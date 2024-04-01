import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/screens/maps/add_new_address_screen.dart';
import 'package:najot_talim_nt/screens/maps/update_address_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'package:najot_talim_nt/view_models/addresses_view_model.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "My Addresses",
            style: AppTextStyle.interBold.copyWith(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Column(
          children: [
            context.watch<AddressesViewModel>().myAddresses.isNotEmpty
                ? Expanded(
                    child: Consumer<AddressesViewModel>(
                      builder: (context, viewModel, child) {
                        return ListView(
                          children: [
                            ...List.generate(
                              viewModel.myAddresses.length,
                              (index) {
                                var myAddress = viewModel.myAddresses[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return UpdateAddressScreen(
                                            placeModel: myAddress,
                                            onTap: () {
                                              context
                                                  .read<AddressesViewModel>()
                                                  .getPlaces();
                                              setState(() {});
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15.w,
                                      vertical: 15.h,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 30.w,
                                      vertical: 10.h,
                                    ),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        16.r,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5.w,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          myAddress.image,
                                          height: 30.h,
                                          width: 40.w,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              myAddress.placeCategory,
                                              style: AppTextStyle.interBold
                                                  .copyWith(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 180.w,
                                              child: Text(
                                                myAddress.placeName,
                                                style: AppTextStyle.interBold
                                                    .copyWith(
                                                  color:
                                                      Colors.black.withOpacity(
                                                    0.5,
                                                  ),
                                                  fontSize: 16.sp,
                                                ),
                                                maxLines: 10,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ZoomTapAnimation(
                                              onLongTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        backgroundColor:
                                                            AppColors.white,
                                                        title: const Text(
                                                          "Ishonchingiz komilmi?",
                                                        ),
                                                        titleTextStyle:
                                                            AppTextStyle
                                                                .interBold
                                                                .copyWith(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 20.sp,
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed:
                                                                () async {
                                                              if (!context
                                                                  .mounted) {
                                                                return;
                                                              }
                                                              context
                                                                  .read<
                                                                      AddressesViewModel>()
                                                                  .deleteCategory(
                                                                    myAddress
                                                                        .docId,
                                                                  );
                                                              context
                                                                  .read<
                                                                      AddressesViewModel>()
                                                                  .getPlaces();
                                                              Navigator.pop(
                                                                  context);
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    "DELETED SUCCESSFULLY",
                                                                    style: AppTextStyle
                                                                        .interBold
                                                                        .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Text(
                                                              'Yes',
                                                              style:
                                                                  AppTextStyle
                                                                      .interBold
                                                                      .copyWith(
                                                                color: AppColors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              'No',
                                                              style:
                                                                  AppTextStyle
                                                                      .interBold
                                                                      .copyWith(
                                                                color: AppColors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              },
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        backgroundColor:
                                                            AppColors.white,
                                                        title: const Text(
                                                          "Ishonchingiz komilmi?",
                                                        ),
                                                        titleTextStyle:
                                                            AppTextStyle
                                                                .interBold
                                                                .copyWith(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 20.sp,
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed:
                                                                () async {
                                                              if (!context
                                                                  .mounted) {
                                                                return;
                                                              }
                                                              context
                                                                  .read<
                                                                      AddressesViewModel>()
                                                                  .deleteCategory(
                                                                    myAddress
                                                                        .docId,
                                                                  );
                                                              context
                                                                  .read<
                                                                      AddressesViewModel>()
                                                                  .getPlaces();
                                                              Navigator.pop(
                                                                  context);
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    "DELETED SUCCESSFULLY",
                                                                    style: AppTextStyle
                                                                        .interBold
                                                                        .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Text(
                                                              'Yes',
                                                              style:
                                                                  AppTextStyle
                                                                      .interBold
                                                                      .copyWith(
                                                                color: AppColors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              'No',
                                                              style:
                                                                  AppTextStyle
                                                                      .interBold
                                                                      .copyWith(
                                                                color: AppColors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: Icon(
                                                Icons.cancel_outlined,
                                                color: Colors.black,
                                                size: 30.w,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        );
                      },
                    ),
                  )
                : Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.sizeOf(context).height / 2.5,
                      ),
                      child: Text(
                        "ADDRESSES IS EMPTY!!!",
                        style: AppTextStyle.interBold.copyWith(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddNewAddressScreen(
                        onTap: () {
                          context.read<AddressesViewModel>().getPlaces();
                        },
                      );
                    },
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                padding: EdgeInsets.symmetric(
                  horizontal: 50.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(
                    16.r,
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20.w,
                      ),
                      Text(
                        "ADD NEW ADDRESS",
                        style: AppTextStyle.interBold
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
