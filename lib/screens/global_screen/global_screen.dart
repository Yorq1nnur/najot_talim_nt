import 'dart:async';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown battery level.';

  String deviceInfo = "Device Info:";

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Platform Specific"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _batteryLevel,
                style: AppTextStyle.interBlack.copyWith(
                  color: AppColors.white,
                ),
              ),
              Text(
                deviceInfo,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.white,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 120,
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: () async {
                DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
                AndroidDeviceInfo androidDeviceInfo =
                    await deviceInfoPlugin.androidInfo;
                setState(() {
                  deviceInfo += "ID: ${androidDeviceInfo.id}\n";
                  deviceInfo +=
                      "VERSION: ${androidDeviceInfo.version.sdkInt}\n";
                  deviceInfo += "TYPE: ${androidDeviceInfo.type}\n";
                  deviceInfo += "MODEL: ${androidDeviceInfo.model}\n";
                  deviceInfo +=
                      "MANUFACTURER: ${androidDeviceInfo.manufacturer}\n";
                  deviceInfo +=
                      "SERIAL NUMBER: ${androidDeviceInfo.serialNumber}\n";
                  deviceInfo += "DEVICE: ${androidDeviceInfo.device}\n";
                });
              },
              child: const Icon(
                Icons.mobile_friendly,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                _getBatteryLevel();
              },
              child: const Icon(
                Icons.battery_0_bar,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
