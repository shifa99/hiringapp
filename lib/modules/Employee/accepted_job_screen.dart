import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/models/employee/employee_meetings_model.dart';
import 'package:hiring_app/modules/Employee/home/cubit/company_details_cubit/company_details_cubit.dart';
import 'package:hiring_app/modules/Employee/home/cubit/company_details_cubit/company_details_states.dart';
import 'package:hiring_app/shared/responsive_ui/device_information.dart';
import 'package:hiring_app/shared/style/style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AcceptedJobScreen extends StatelessWidget {
  final ScheduleMeetings scheduleMeeting;
  final DeviceInformation deviceInfo;
  AcceptedJobScreen(this.scheduleMeeting, this.deviceInfo);
  int days, hours, minutes;
  void differenceBetweenTwoDates(String date) {
    DateTime meetingTime = DateTime.parse(date);
    days = meetingTime.difference(DateTime.now()).inDays;
  }

  @override
  Widget build(BuildContext context) {
    differenceBetweenTwoDates(scheduleMeeting.job.meetingDate);
    return Scaffold(
        appBar: defaultAppBar(context, title: 'Live Meeting'),
        body: days<0?Center(child: Text('Meeting Ended',style: primaryTextStyle(deviceInfo),),): SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircularPercentIndicator(
                  progressColor: defaultColor,
                  backgroundColor: defaultColor.withOpacity(0.5),
                  percent: 1-(days/100)==0?1:1-(days/100),
                  animation: true,
                  radius: 180.0,
                  lineWidth: 15.0,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        days==0?'Meeting Today':"$days day",
                        style: primaryTextStyle(deviceInfo).copyWith(
                          color: Colors.green,
                        ),
                      ),
                      Text("12 hour 13 min",
                          style: primaryTextStyle(deviceInfo).copyWith(
                            color: Colors.green,
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 180,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 150,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'About company',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: defaultColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Name'),
                                        SizedBox(height: 10),
                                        Text('Address'),
                                        SizedBox(height: 10),
                                        Text('Start from'),
                                      ],
                                    ),
                                    SizedBox(width: 50),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            scheduleMeeting
                                                .job.employer.companyName,
                                            style:
                                                secondaryTextStyle(deviceInfo)
                                                    .copyWith(
                                                        color: defaultColor)),
                                        SizedBox(height: 10),
                                        Text(
                                            '${scheduleMeeting.job.employer.city}, ${scheduleMeeting.job.employer.country}',
                                            style:
                                                secondaryTextStyle(deviceInfo)
                                                    .copyWith(
                                                        color: defaultColor)),
                                        SizedBox(height: 10),
                                        Text(
                                            scheduleMeeting
                                                .job.employer.establishedAt
                                                .toString(),
                                            style:
                                                secondaryTextStyle(deviceInfo)
                                                    .copyWith(
                                                        color: defaultColor)),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/images/vodafone.png',
                            width: 80,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About job Title',
                            style: TextStyle(
                                fontSize: 22,
                                color: defaultColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Job title'),
                                  SizedBox(height: 10),
                                  Text('Details'),
                                ],
                              ),
                              SizedBox(width: 50),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(scheduleMeeting.job.employer.title,
                                      style: secondaryTextStyle(deviceInfo)
                                          .copyWith(color: defaultColor)),
                                  SizedBox(height: 10),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(scheduleMeeting.job.details,
                                        style: secondaryTextStyle(deviceInfo)
                                            .copyWith(color: defaultColor)),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text('Meeting Details',
                            style: primaryTextStyle(deviceInfo)
                                .copyWith(color: defaultColor)),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Meeting time ',
                                  style: secondaryTextStyle(deviceInfo),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Meeting date',
                                  style: secondaryTextStyle(deviceInfo),
                                ),
                              ],
                            ),
                            SizedBox(width: 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  scheduleMeeting.job.startFrom,
                                  style: secondaryTextStyle(deviceInfo)
                                      .copyWith(color: defaultColor),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  scheduleMeeting.job.meetingDate,
                                  style: secondaryTextStyle(deviceInfo)
                                      .copyWith(color: defaultColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
