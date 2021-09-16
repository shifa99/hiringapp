import 'package:flutter/material.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/shared/responsive_ui/device_information.dart';
import 'package:hiring_app/shared/style/style.dart';

Row buildRowviewAll(
    {@required DeviceInformation deviceInfo,
    @required String label,
    @required Function onPressed}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: secondaryTextStyle(deviceInfo),
      ),
      defaultTextButton(
          text: 'VIEW ALL',
          onPressed: () {
            onPressed();
          }),
    ],
  );
}
