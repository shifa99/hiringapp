import 'package:flutter/material.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/shared/responsive_ui/device_information.dart';
import 'package:hiring_app/shared/style/style.dart';

Container createNewJobWidget(
    {@required DeviceInformation deviceInfo,
    @required BuildContext context,
    @required Function onPressed}) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: containerDecoration.copyWith(
        border: Border.all(
      color: Colors.grey.shade300,
    )),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Creat New job\n',
              style: secondaryTextStyle(deviceInfo),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod ',
                  style: thirdTextStyle(deviceInfo),
                ))
          ],
        ),
        Spacer(),
        defaultButton(
          text: 'Create New Job',
          onPressed: () {
            onPressed();
          },
          width: MediaQuery.of(context).size.width * 0.4,
        )
      ],
    ),
  );
}

