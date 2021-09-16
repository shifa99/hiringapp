import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/modules/Employee/home/cubit/accept_meeting_time_cubit/accept_meeting_time_cubit.dart';
import 'package:hiring_app/modules/Employee/home/cubit/accept_meeting_time_cubit/accept_meeting_time_states.dart';
import 'package:hiring_app/modules/Employee/home/cubit/cubit.dart';
import 'package:hiring_app/modules/Employee/home/cubit/states.dart';
import 'package:hiring_app/modules/Employee/job_details_screen.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/notifications_cubit/notifications_cubit.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/notifications_cubit/notifications_states_cubit.dart';
import 'package:hiring_app/modules/logins/login_employer_screen.dart';
import 'package:hiring_app/shared/style/style.dart';
import '../../../who_are_you2_screen.dart';

class NotificationsScreen extends StatelessWidget {
  final deviceInformation;
  NotificationsScreen(this.deviceInformation);
  final double imageSize = 0.2;
  @override
  Widget build(BuildContext context) {
    return isGuest
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Image.asset('assets/icons/notUser.png'),
                  SizedBox(height: 20),
                  Text(
                    'Guest User',
                    style: TextStyle(color: defaultColor, fontSize: 22),
                  ),
                  SizedBox(height: 20),
                  defaultButton(
                      text: 'Login',
                      onPressed: () {
                        navigateTo(context, EmployerLoginScreen());
                      },
                      height: 60.0),
                  SizedBox(height: 20),
                  borderButton(
                      onPressed: () {
                        navigateTo(context, WhoAreYou2Screen());
                      },
                      text: 'CREATE ACCOUNT')
                ],
              ),
            ),
          )
        : BlocProvider(
            create: (context) => NotificationCubit()..getNotifications(),
            child: BlocBuilder<NotificationCubit, NotificationStatesCubit>(
                builder: (context, state) {
              if (state is NotificationSuccessState) {
                var cubit = NotificationCubit.get(context);
                return ListView.builder(
                  itemCount:
                      cubit.employeeNotificationModel.notifications.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        height: deviceInformation.screenHeight * 0.28,
                        decoration: containerDecoration,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('iOS Developer',
                                                style: secondaryTextStyle(
                                                    deviceInformation)),
                                            SizedBox(height: 5),
                                            Text(
                                              'Cairo, Egypt',
                                              style: thirdTextStyle(
                                                  deviceInformation),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: deviceInformation
                                                      .screenwidth *
                                                  0.6,
                                              child: Text(
                                                'You have been accepted your meeting is in ${cubit.employeeNotificationModel.notifications[index].meetingDate.timeFrom} with date ${cubit.employeeNotificationModel.notifications[index].meetingDate.date} ',
                                                style: thirdTextStyle(
                                                    deviceInformation),
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: deviceInformation.screenwidth * 0.08,
                                ),
                                Expanded(
                                  child: Image.asset(
                                    'assets/images/vodafone.png',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: BlocBuilder<AcceptMeetingTimeCubit,
                                          AcceptMeetingTimeCubitStates>(
                                      builder: (context, state) {
                                    if (state
                                            is AcceptMeetingTimeSucssesstate ||
                                        state is AcceptMeetingTimeIdlestate ||
                                        state is AcceptMeetingTimeErrorstate) {
                                      return defaultButton(
                                        text: 'CONFIRM',
                                        onPressed: () async {
                                          await AcceptMeetingTimeCubit.get(
                                                  context)
                                              .acceptTimeMeetingOffer(cubit
                                                  .employeeNotificationModel
                                                  .notifications[index]
                                                  .candateId)
                                              .then((value) {
                                            if (value) {
                                              defaultSnackBar(context,
                                                  content: 'Done Confirmation',
                                                  color: Colors.green);
                                              // GetMyScheduleEmployeeMeetingsCubit.get(
                                              //         context)
                                              //     .getMyScheduleEmployeeMeetings();
                                            } else {
                                              defaultSnackBar(context,
                                                  content: 'Error Happen Now',
                                                  color: Colors.redAccent);
                                            }
                                          });
                                        },
                                        height: 40.0,
                                      );
                                    } else
                                      return loadingProgress();
                                  }),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: borderButton(
                                    onPressed: () {},
                                    text: 'MORE ACTION',
                                    // width: MediaQuery.of(context).size.width * 0.35,
                                    // height: 40.0,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (state is NotificationLoadingState)
                return loadingProgress();
              else
                return Center(
                  child: Text('Error'),
                );
            }),
          );
  }
}
