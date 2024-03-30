import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/screens/maps/google_maps_screen.dart';
import 'package:najot_talim_nt/screens/maps/update_address_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'package:najot_talim_nt/view_models/addressess_view_model.dart';
import 'package:provider/provider.dart';

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
              Expanded(
                child: Consumer<AddressesViewModel>(
                  builder: (context, viewModel, child) {
                    return ListView(children: [
                      ...List.generate(viewModel.myAddresses.length, (index) {
                        var myAddress = viewModel.myAddresses[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return UpdateAddressScreen(
                                    placeModel: myAddress,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            height: 100,
                            width: double.infinity,
                            color: Colors.blue,
                          ),
                        );
                      })
                    ]);
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const GoogleMapsScreen();
                        },
                      ),
                    );
                  },
                  child: const Text("Yangi address qo'shish"))
            ],
          ),
        ));
  }
}
