import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/size_utils.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/models/scaner_model.dart';
import '../../services/widget_save_sirvice.dart';
import '../../utils/app_colors.dart';

class ShowInfoScreen extends StatefulWidget {
  const ShowInfoScreen({super.key, required this.scannerModel});

  final ScannerModel scannerModel;

  @override
  State<ShowInfoScreen> createState() => _ShowInfoScreenState();
}

class _ShowInfoScreenState extends State<ShowInfoScreen> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c333333.withOpacity(0.7),
      body: Column(
        children: [
          40.getH(),
          Row(
            children: [
              SizedBox(width: 20.w),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.c333333,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 22.sp,
                  color: AppColors.cFDB623,
                ),
              ),
              25.getW(),
              Text(
                "QR Code",
                style: TextStyle(
                  color: AppColors.cD9D9D9,
                  fontSize: 27.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          33.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ListTile(
              onTap: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r)),
              tileColor: AppColors.c333333,
              title: Text(
                "Data:",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                widget.scannerModel.qrCode,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          55.getH(),
          RepaintBoundary(
            key: _globalKey,
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () async {
                  Uri uri = Uri.parse(widget.scannerModel.qrCode);
                  await launchUrl(uri);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: AppColors.cFDB623, width: 5.w),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.cFDB623.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5),
                    ],
                  ),
                  child: QrImageView(
                    data: widget.scannerModel.qrCode,
                    version: QrVersions.auto,
                    size: 200,
                  ),
                ),
              ),
            ),
          ),
          40.getH(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.w, vertical: 18.h),
                      backgroundColor: AppColors.cFDB623,
                    ),
                    onPressed: () {
                      WidgetSaverService.openWidgetAsImage(
                        context: context,
                        widgetKey: _globalKey,
                        fileId: widget.scannerModel.qrCode,
                      );
                    },
                    child: Icon(
                      Icons.share,
                      size: 30.sp,
                      color: AppColors.c333333,
                    ),
                  ),
                  8.getH(),
                  Text(
                    "Share",
                    style: TextStyle(
                      color: AppColors.cD9D9D9,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              20.getW(),
              Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.w, vertical: 18.h),
                      backgroundColor: AppColors.cFDB623,
                    ),
                    onPressed: () {
                      WidgetSaverService.saveWidgetToGallery(
                        context: context,
                        widgetKey: _globalKey,
                        fileId: widget.scannerModel.qrCode,
                      );
                    },
                    child: Icon(
                      Icons.save,
                      size: 30.sp,
                      color: AppColors.c333333,
                    ),
                  ),
                  8.getH(),
                  Text(
                    "Save",
                    style: TextStyle(
                      color: AppColors.cD9D9D9,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
