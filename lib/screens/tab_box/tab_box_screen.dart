import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/scanner_bloc.dart';
import '../../bloc/scanner_event.dart';
import '../../data/models/scaner_model.dart';
import '../../utils/app_colors.dart';
import '../generate/generate_qr_screen.dart';
import '../history/history_screen.dart';
import '../qr_scaner/qr_scaner_screen.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  List<Widget> _screens = [];
  int _activeIndex = 1;

  @override
  void initState() {
    _screens = [
      const GenerateQrScreen(),
      const HistoryScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_activeIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.c333333.withOpacity(
            .84,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 46.w,
          vertical: 33.h,
        ),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.cFDB623,
          unselectedItemColor: AppColors.cD9D9D9,
          onTap: (newActiveIndex) {
            _activeIndex = newActiveIndex;
            setState(
              () {},
            );
          },
          currentIndex: _activeIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 16,
          unselectedFontSize: 14,
          backgroundColor: AppColors.c333333,
          selectedLabelStyle: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.cFDB623,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.cD9D9D9,
          ),
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.qr_code_scanner,
                color: AppColors.cFDB623,
                size: 40.w,
              ),
              icon: Icon(
                Icons.qr_code_scanner,
                color: AppColors.cD9D9D9,
                size: 40.w,
              ),
              label: "Generate",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.history,
                color: AppColors.cFDB623,
                size: 40.w,
              ),
              icon: Icon(
                Icons.history,
                color: AppColors.cD9D9D9,
                size: 40.w,
              ),
              label: "History",
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Container(
        width: 70.h,
        height: 70.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.cFDB623,
              blurRadius: 30.r,
              spreadRadius: 0,
            ),
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: AppColors.cFDB623,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return QrScannerScreen(
                    barcode: (barcode) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            barcode.code.toString(),
                          ),
                        ),
                      );
                      context.read<ScannerBloc>().add(
                            AddScannerEvent(
                              scannerModel: ScannerModel(
                                name: "Data",
                                qrCode: barcode.code.toString(),
                              ),
                            ),
                          );
                    },
                  );
                },
              ),
            );
          },
          child: Icon(
            Icons.qr_code_scanner_sharp,
            size: 30.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
