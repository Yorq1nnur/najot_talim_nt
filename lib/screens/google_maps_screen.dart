import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:najot_talim_nt/screens/widgets/map_type_item.dart';
import 'package:najot_talim_nt/view_models/location_view_model.dart';
import 'package:najot_talim_nt/view_models/notifications_view_model.dart';
import 'package:provider/provider.dart';
import '../utils/images/app_images.dart';
import '../view_models/maps_view_model.dart';

class GoogleMapsScreen extends StatelessWidget {
  const GoogleMapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;

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
                  if (cameraPosition != null) {
                    context.read<MapsViewModel>().changeCurrentLocation(cameraPosition!);
                    context.read<MapsViewModel>().addNewMarker();
                  }
                },
                onCameraMove: (CameraPosition currentCameraPosition) {
                  cameraPosition = currentCameraPosition;
                  debugPrint("CURRENT POSITION:${currentCameraPosition.target.longitude}");
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
              final userLocationData = context.read<LocationViewModel>().userLocationData;
              if (userLocationData != null) {
                final currentLat = userLocationData.latitude.toString();
                final currentLong = userLocationData.longitude.toString();
                context.read<MapsViewModel>().moveToInitialPosition();
                context.read<NotificationsViewModel>().showNotifications(
                  title: "Foydalanuvchining joriy koordinatasi: ($currentLat, $currentLong) ga o'zgardi",
                  body: "Foydalanuvchining joriy koordinatasi: ($currentLat, $currentLong) ga o'zgardi",
                  id: DateTime.now().millisecond,
                );
              }
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
