<<<<<<< HEAD
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
>>>>>>> origin/location_homework
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:najot_talim_nt/screens/widgets/map_type_item.dart';
import 'package:najot_talim_nt/services/local_notification_service.dart';
import 'package:najot_talim_nt/view_models/location_view_model.dart';
import 'package:provider/provider.dart';
<<<<<<< HEAD
import '../utils/images/app_images.dart';
import '../view_models/maps_view_model.dart';

class GoogleMapsScreen extends StatelessWidget {
  const GoogleMapsScreen({super.key});
=======

import '../utils/images/app_images.dart';
import '../view_models/maps_view_model.dart';

class GoogleMapsScreen extends StatefulWidget {
  GoogleMapsScreen({super.key});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  Set<Marker> markers = {};

  late LatLng currentLatLong;
>>>>>>> origin/location_homework

  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;
    LatLng? latLng = context.watch<LocationViewModel>().latLng;

<<<<<<< HEAD

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


=======
    return Consumer<MapsViewModel>(builder: (context, viewModel, child) {
      if (viewModel.initialCameraPosition == null) {
        return const Center(child: CircularProgressIndicator());
      }
      return Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,
              // markers: markers,
              onCameraIdle: () {
                LocalNotificationService().showNotification(
                  title: "Diqqat!!!",
                  body:
                      "Foydalanuvchining joriy koordinatasi: (${latLng?.latitude}, ${latLng?.longitude}) ga o'zgardi!!!",
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
                currentLatLong = currentCameraPosition.target;
                print("Current lat long has been updated Jo'ra");
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
              onMapCreated: (GoogleMapController createdController) async {
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
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const MapTypeItem(),
            const SizedBox(height: 32),
            FloatingActionButton(
              onPressed: () {
                context.read<MapsViewModel>().moveToInitialPosition();
              },
              child: const Icon(Icons.gps_fixed),
            ),
            const SizedBox(height: 32),
            FloatingActionButton(
              onPressed: () {
                TextEditingController controller = TextEditingController();
                String? _chosenModel;
                showAdaptiveDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Marker qo'shish"),
                    content: StatefulBuilder(
                      builder: (newContext, setNewState) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Nom to'liq kiritilmadi!";
                                }
                                return null;
                              },
                              controller: controller,
                              maxLines: 1,
                              maxLength: 100,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Nom bering",
                                alignLabelWithHint: true,
                                // label: const Text("Enter your number"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              style: const TextStyle(color: Colors.red),
                            ),
                            DropdownButton<String>(
                              value: _chosenModel,
                              items: <String>[
                                'Uy',
                                'Ish',
                                'Boshqa',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setNewState(() {
                                  _chosenModel = newValue;
                                });
                              },
                              hint: const Text(
                                "Toifani tanlang",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                  onPressed: () async {
                                    print(
                                        "Mana rasm ${'assets/images/${_chosenModel.toString().toLowerCase()}.png'}");
                                    Uint8List markerImage =
                                        await viewModel.getBytesFromAsset(
                                      'assets/images/${_chosenModel.toString().toLowerCase()}.png',
                                      150,
                                    );
                                    print(markerImage);
                                    print("Salomiddin");
                                    Marker marker = Marker(
                                        markerId: MarkerId(DateTime.now()
                                            .millisecond
                                            .toString()),
                                        position: currentLatLong,
                                        icon: BitmapDescriptor.fromBytes(
                                            markerImage));
                                    print(
                                        "Mana lat long jiyan ${currentLatLong.latitude} ${currentLatLong.longitude}");
                                    markers.add(marker);
                                    print("Bo'ldi");
                                  },
                                  child: Text("Saqlash")),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
              child: const Icon(CupertinoIcons.add),
            ),
          ],
        ),
      );
    });
  }
}

>>>>>>> origin/location_homework
/*
#0      StandardMethodCodec.decodeEnvelope (package:flutter/src/services/message_codecs.dart:651:7)
E/flutter (12497): #1      MethodChannel._invokeMethod (package:flutter/src/services/platform_channel.dart:334:18)
E/flutter (12497): <asynchronous suspension>
E/flutter (12497): #2      MethodChannelLocation.enableBackgroundMode (package:location_platform_interface/src/method_channel_location.dart:68:20)
<<<<<<< HEAD
 */
=======
 */
>>>>>>> origin/location_homework
