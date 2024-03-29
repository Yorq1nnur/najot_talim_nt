import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:najot_talim_nt/screens/widgets/map_type_item.dart';
import 'package:najot_talim_nt/services/local_notification_service.dart';
import 'package:najot_talim_nt/view_models/location_view_model.dart';
import 'package:provider/provider.dart';
import '../utils/images/app_images.dart';
import '../view_models/maps_view_model.dart';

class GoogleMapsScreen extends StatelessWidget {
  const GoogleMapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;
    LatLng? latLng = context.watch<LocationViewModel>().latLng;


    return Scaffold(
      body: Consumer<MapsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.initialCameraPosition == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              GoogleMap(
                markers: viewModel.markers,
                onCameraIdle: () {
                  LocalNotificationService().showNotification(
                    title: "Diqqat!!!",
                    body: "Foydalanuvchining joriy koordinatasi: (${latLng?.latitude}, ${latLng?.longitude}) ga o'zgardi!!!",
                    id: DateTime.now().millisecond.toInt(),
                  );
                  if (cameraPosition != null) {
                    context
                        .read<MapsViewModel>()
                        .changeCurrentLocation(cameraPosition!);
                    context.read<MapsViewModel>().addNewMarker();
                  }
                },
                onCameraMove: (CameraPosition currentCameraPosition) {
                  // LocalNotificationService().showNotification(
                  //   title: "Diqqat!!!",
                  //   body: "Foydalanuvchining joriy koordinatasi: (${latLng?.latitude}, ${latLng?.longitude}) ga o'zgardi!!!",
                  //   id: DateTime.now().millisecond.toInt(),
                  // );
                  cameraPosition = currentCameraPosition;
                  debugPrint(
                      "CURRENT POSITION:${currentCameraPosition.target.longitude}");
                },
                mapType: viewModel.mapType,
                initialCameraPosition: viewModel.initialCameraPosition!,
                onMapCreated: (GoogleMapController createdController) {
                  viewModel.controller.complete(createdController);
                },
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.location,
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<MapsViewModel>().moveToInitialPosition();
            },
            child: const Icon(Icons.gps_fixed),
          ),
          const SizedBox(width: 20),
          const MapTypeItem(),
        ],
      ),
    );
  }
}
