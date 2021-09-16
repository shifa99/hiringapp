import 'package:flutter/material.dart';

import 'package:hiring_app/shared/responsive_ui/device_information.dart';

Color iconColor = Colors.white;
TextStyle primaryTextStyle(DeviceInformation deviceInfo) {
  return TextStyle(
      fontSize: deviceInfo.screenHeight * 0.03, fontWeight: FontWeight.w500);
}

TextStyle secondaryTextStyle(DeviceInformation deviceInfo) {
  return TextStyle(
      fontSize: deviceInfo.screenHeight * 0.025, fontWeight: FontWeight.w500);
}

TextStyle thirdTextStyle(DeviceInformation deviceInfo) {
  return TextStyle(
      fontSize: deviceInfo.screenHeight * 0.022, fontWeight: FontWeight.w500);
}

TextStyle subTextStyle(DeviceInformation deviceInfo) {
  return TextStyle(
    fontSize: deviceInfo.screenHeight * 0.017,
    color: Colors.grey,
    fontWeight: FontWeight.w500,
  );
}
TextStyle captionTextStyle(DeviceInformation deviceInfo) {
  return TextStyle(
    fontSize: deviceInfo.screenHeight * 0.014,
    color: Colors.grey,
    fontWeight: FontWeight.w500,
  );
}
//decoration
final containerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(
      color: Colors.grey.shade600,
      width: 0.5,
    ));