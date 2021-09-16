import 'package:flutter/material.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/models/employee/employee_meetings_model.dart';
import 'package:hiring_app/modules/Employee/accepted_job_screen.dart';
import 'package:hiring_app/shared/responsive_ui/device_information.dart';
import 'package:hiring_app/shared/style/style.dart';

Widget buildConfirmedScreen(DeviceInformation deviceInfo,
    List<ScheduleMeetings> confirmscheduledMeetings) {
  if (confirmscheduledMeetings.isEmpty)
    return Center(
      child: Text('There is No Meeting Confirmed Untill Now'),
    );
  return ListView.separated(
    padding: const EdgeInsets.all(8.0),
    itemCount: confirmscheduledMeetings.length,
    shrinkWrap: true,
    physics: BouncingScrollPhysics(),
    separatorBuilder: (context, index) => SizedBox(
      height: 5,
    ),
    itemBuilder: (context, index) {
      String date =
          confirmscheduledMeetings[index].availableMeeting.date == null
              ? '2021-02-09'
              : confirmscheduledMeetings[index].availableMeeting.date;
      String time =
          confirmscheduledMeetings[index].availableMeeting.timeFrom == null
              ? '9:00'
              : confirmscheduledMeetings[index].availableMeeting.timeFrom;
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        confirmscheduledMeetings[index].job.title,
                        style: secondaryTextStyle(deviceInfo)
                            .copyWith(color: defaultColor),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Vodafone',
                        style: secondaryTextStyle(deviceInfo),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Please confirm your date',
                        style: secondaryTextStyle(deviceInfo),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your meeting time',
                        style: thirdTextStyle(deviceInfo),
                      ),
                      SizedBox(height: 5),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: Text(
                            '$date | $time',
                            style: thirdTextStyle(deviceInfo),
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              defaultButton(
                text: 'DETAILS',
                onPressed: () {
                  navigateTo(
                      context,
                      AcceptedJobScreen(
                          confirmscheduledMeetings[index], deviceInfo));
                },
                width: deviceInfo.screenwidth * 0.9,
                height: deviceInfo.screenHeight * 0.07,
              )
            ],
          ),
        ),
      );
    },
  );
}