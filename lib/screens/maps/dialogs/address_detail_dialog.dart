import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/place_model.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

int activeIndex = -1;
String category = '';

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
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16.r,
                          ),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.w,
                          ))),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      categories.length,
                      (index) => ZoomTapAnimation(
                        onTap: () {
                          activeIndex = index;
                          category = categories[index];
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
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
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              TextButton(
                onPressed: () {
                  placeModel.call(
                    PlaceModel(
                      entrance: "",
                      flatNumber: "",
                      orientAddress: "",
                      placeCategory: category,
                      long: '',
                      lat: '',
                      placeName: '',
                      stage: "",
                      id: '',
                      docId: '',
                      image: 'assets/images/$category.png',
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  "SAVE PLACE",
                ),
              ),
            ],
          ),
        );
      });
}

List<String> categories = [
  "home",
  "work",
  "study",
  "other",
];
