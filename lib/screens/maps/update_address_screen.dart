import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:najot_talim_nt/data/models/place_model.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'package:najot_talim_nt/view_models/addresses_view_model.dart';
import 'package:najot_talim_nt/view_models/maps_view_model.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../widgets/map_type_item.dart';

class UpdateAddressScreen extends StatefulWidget {
  const UpdateAddressScreen({
    super.key,
    required this.onTap,
    required this.placeModel,
  });

  final PlaceModel placeModel;
  final VoidCallback onTap;

  @override
  State<UpdateAddressScreen> createState() => _UpdateAddressScreenState();
}

class _UpdateAddressScreenState extends State<UpdateAddressScreen> {
  int activeIndex = -1;
  String category = '';

  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.w,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'UPDATE ADDRESS',
          style: AppTextStyle.interBold.copyWith(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Consumer<MapsViewModel>(
        builder: (context, viewModel, child) {
          return Stack(
            children: [
              GoogleMap(
                zoomControlsEnabled: false,
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
                initialCameraPosition: CameraPosition(
                  zoom: 15,
                  target: LatLng(
                    double.parse(widget.placeModel.lat),
                    double.parse(
                      widget.placeModel.long,
                    ),
                  ),
                ),
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
                top: 30,
                right: 0,
                left: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Text(
                    viewModel.currentPlaceName,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.interSemiBold.copyWith(
                      fontSize: 24,
                      color: context.watch<MapsViewModel>().mapType ==
                              MapType.normal
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 25.w,
                bottom: MediaQuery.sizeOf(context).height / 50,
                child: ZoomTapAnimation(
                  onTap: () async {
                    PlaceModel placeModel = PlaceModel(
                      placeCategory: category == ''
                          ? widget.placeModel.placeCategory
                          : category,
                      lat: context
                          .read<MapsViewModel>()
                          .currentCameraPosition
                          .target
                          .latitude
                          .toString(),
                      long: context
                          .read<MapsViewModel>()
                          .currentCameraPosition
                          .target
                          .longitude
                          .toString(),
                      image: category == ''
                          ? widget.placeModel.image
                          : 'assets/images/$category.png',
                      docId: widget.placeModel.docId,
                      placeName: context.read<MapsViewModel>().currentPlaceName,
                    );
                    await context.read<AddressesViewModel>().updateCategory(
                          placeModel: placeModel,
                        );
                    if (!context.mounted) return;
                    widget.onTap.call();
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 30.w,
                    ),
                    width: 250.w,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(
                        16.r,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.update,
                          color: Colors.white,
                          size: 20.w,
                        ),
                        Text(
                          "UPDATE ADDRESS",
                          style: AppTextStyle.interBold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20.w,
                bottom: MediaQuery.sizeOf(context).height / 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      categories.length,
                      (index) => ZoomTapAnimation(
                        onTap: () {
                          setState(() {
                            activeIndex = index;
                          });
                          category = categories[index];
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 5.w,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: activeIndex == index
                                ? Colors.blueGrey
                                : Colors.yellowAccent,
                            borderRadius: BorderRadius.circular(
                              16.r,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              categories[index],
                              style: AppTextStyle.interBold.copyWith(
                                color: activeIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<MapsViewModel>().moveToInitialPosition();
            },
            child: const Icon(Icons.gps_fixed),
          ),
          SizedBox(
            height: 20.h,
          ),
          const MapTypeItem(),
        ],
      ),
    );
  }
}

List<String> categories = [
  "home",
  "work",
  "study",
  "other",
];
