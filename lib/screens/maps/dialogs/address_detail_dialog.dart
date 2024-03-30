import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:najot_talim_nt/data/models/place_category.dart';
import 'package:najot_talim_nt/data/models/place_model.dart';

addressDetailDialog({
  required BuildContext context,
  required ValueChanged<PlaceModel> placeModel,
}) {
  final TextEditingController controller = TextEditingController();

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              TextField(
                controller: controller,
              ),
              const SizedBox(height: 24),
              TextButton(
                  onPressed: () {
                    placeModel.call( PlaceModel(
                      entrance: "",
                      flatNumber: "",
                      orientAddress: "",
                      placeCategory: PlaceCategory.home,
                      latLng:const  LatLng(0,0),
                      placeName: "Chilonzor",
                      stage: "",
                    ),);
                    Navigator.pop(context);
                  },
                  child: const Text("SAVE PLACE"))
            ],
          ),
        );
      });
}
