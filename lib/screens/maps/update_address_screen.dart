import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:najot_talim_nt/data/models/place_model.dart';
import 'package:najot_talim_nt/screens/maps/dialogs/address_detail_dialog.dart';
import 'package:najot_talim_nt/screens/widgets/map_type_item.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'package:najot_talim_nt/view_models/addresses_view_model.dart';
import 'package:najot_talim_nt/view_models/maps_view_model.dart';
import 'package:provider/provider.dart';

class UpdateAddressScreen extends StatefulWidget {
  const UpdateAddressScreen({
    super.key,
    required this.placeModel, required this.onTap,
  });

  final VoidCallback onTap;

  final PlaceModel placeModel;

  @override
  State<UpdateAddressScreen> createState() => _UpdateAddressScreenState();
}

class _UpdateAddressScreenState extends State<UpdateAddressScreen> {
  @override
  void initState() {
    context.read<MapsViewModel>().currentPlaceName =
        widget.placeModel.placeName;

    context.read<MapsViewModel>().setLatInitialLong(
          LatLng(
            double.parse(widget.placeModel.lat),
            double.parse(widget.placeModel.long),
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;
    return Scaffold(
      body: Consumer<MapsViewModel>(
        builder: (context, viewModel, child) {
          return Stack(
            children: [
              GoogleMap(
                markers: viewModel.markers,
                onCameraIdle: () {
                  if (cameraPosition != null) {
                    context
                        .read<MapsViewModel>()
                        .changeCurrentLocation(cameraPosition!);
                  }
                },
                onCameraMove: (CameraPosition currentCameraPosition) {
                  cameraPosition = currentCameraPosition;
                  debugPrint(
                      "CURRENT POSITION:${currentCameraPosition.target.longitude}");
                },
                mapType: viewModel.mapType,
                initialCameraPosition: viewModel.initialCameraPosition,
                onMapCreated: (GoogleMapController createdController) {
                  viewModel.controller.complete(createdController);
                },
              ),
              Align(
                child: Image.asset(
                  AppImages.location,
                  width: 50,
                  height: 50,
                ),
              ),
              Positioned(
                top: 100,
                right: 0,
                left: 0,
                child: Text(
                  viewModel.currentPlaceName,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 24,
                  ),
                ),
              )
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
          FloatingActionButton(
            onPressed: () {
              addressDetailDialog(
                context: context,
                placeModel: (newAddressDetails) {
                  PlaceModel? place = newAddressDetails as PlaceModel?;
                  place?.lat = cameraPosition!.target.latitude.toString();
                  place?.long = cameraPosition!.target.longitude.toString();
                  place?.placeCategory = 'work';
                  context.read<AddressesViewModel>().addNewAddress(
                        placeModel: place!,
                      );
                  Navigator.pop(context);
                  widget.onTap.call();
                },
              );
            },
            child: const Icon(Icons.place),
          ),
          const SizedBox(width: 20),
          const MapTypeItem(),
        ],
      ),
    );
  }
}
