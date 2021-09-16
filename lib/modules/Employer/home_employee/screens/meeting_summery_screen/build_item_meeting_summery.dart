import 'package:flutter/material.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/models/employer/meeting_summery_model.dart';
import 'package:hiring_app/shared/responsive_ui/device_information.dart';
import 'package:hiring_app/shared/style/style.dart';

class BuildItemMeetingSummery extends StatelessWidget {
  final DeviceInformation deviceInfo;
  final Schedule schedule;
  BuildItemMeetingSummery(this.deviceInfo,this.schedule);
  @override
  Widget build(BuildContext context) 
  {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadiusAll()),
      elevation: 3,
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${schedule.title}\n',
                style: secondaryTextStyle(deviceInfo)
                    .copyWith(color: defaultColor)),
            Text(
              '${schedule.employer.city},${schedule.employer.country}\n',
              style: thirdTextStyle(deviceInfo).copyWith(color: Colors.grey),
            ),
            Text(
              '${schedule.employeeJobCount} candidate\n',
              style: thirdTextStyle(deviceInfo).copyWith(color: Colors.grey),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  'Meeting date',
                  style: secondaryTextStyle(deviceInfo),
                ),
                SizedBox(width: 1.5),
                Text(
                  schedule.meetingDate,
                  style:
                      captionTextStyle(deviceInfo).copyWith(color: defaultColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
