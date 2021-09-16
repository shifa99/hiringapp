import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/models/employee/employee_meetings_model.dart';
import 'package:hiring_app/modules/Employee/home/cubit/accept_meeting_time_cubit/accept_meeting_time_cubit.dart';
import 'package:hiring_app/modules/Employee/home/cubit/accept_meeting_time_cubit/accept_meeting_time_states.dart';
import 'package:hiring_app/modules/Employee/home/cubit/accept_meeting_with_another_time_cubit/accept_meeting_with_another_time_cubit.dart';
import 'package:hiring_app/modules/Employee/home/cubit/accept_meeting_with_another_time_cubit/accept_meeting_with_another_time_states.dart';
import 'package:hiring_app/modules/Employee/home/cubit/available_meetings_cubit/available_meetings_cubit.dart';
import 'package:hiring_app/modules/Employee/home/cubit/available_meetings_cubit/available_meetings_states.dart';
import 'package:hiring_app/modules/Employee/home/cubit/get_confirmed_meetings_cubit/get_confirmed_meetings_cubit.dart';
import 'package:hiring_app/modules/Employee/job_details_screen.dart';
import 'package:hiring_app/shared/responsive_ui/device_information.dart';
import 'package:hiring_app/shared/style/style.dart';
import 'package:intl/intl.dart';

Widget buildNotConfirmedScreen(
    DeviceInformation deviceInfo,
    List<ScheduleMeetings> notConfirmscheduledMeetings,
    BuildContext globalContext) {
  if (notConfirmscheduledMeetings.isEmpty)
    return Center(
      child: Text('There Is No Meeting Available Now',
          style: primaryTextStyle(deviceInfo).copyWith(color: Colors.red)),
    );
  return ListView.builder(
    itemCount: notConfirmscheduledMeetings.length,
    shrinkWrap: true,
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: containerDecoration.copyWith(
              color: Colors.deepOrange.withOpacity(0.1)),
          height: deviceInfo.screenHeight * 0.26,
          child: Column(
            children: [
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notConfirmscheduledMeetings[index]
                                .job
                                .employer
                                .title,
                            style: primaryTextStyle(deviceInfo),
                          ),
                          SizedBox(height: 5),
                          Text(
                            notConfirmscheduledMeetings[index]
                                .job
                                .employer
                                .companyName,
                            style: secondaryTextStyle(deviceInfo)
                                .copyWith(color: defaultColor),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Please confirm your date',
                            style: secondaryTextStyle(deviceInfo)
                                .copyWith(color: defaultColor),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your meeting time',
                            style: secondaryTextStyle(
                              deviceInfo,
                            ).copyWith(color: defaultColor),
                          ),
                          SizedBox(height: 5),
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 1, color: defaultColor),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                '${notConfirmscheduledMeetings[index].availableMeeting.date}\n ${notConfirmscheduledMeetings[index].availableMeeting.timeFrom} \n ${notConfirmscheduledMeetings[index].availableMeeting.time}',
                                style: thirdTextStyle(deviceInfo)
                                    .copyWith(color: defaultColor),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: BlocBuilder<AcceptMeetingTimeCubit,
                            AcceptMeetingTimeCubitStates>(
                        builder: (context, state) {
                      if (state is AcceptMeetingTimeSucssesstate ||
                          state is AcceptMeetingTimeIdlestate ||
                          state is AcceptMeetingTimeErrorstate) {
                        return defaultButton(
                          text: 'CONFIRM',
                          onPressed: () async {
                            await AcceptMeetingTimeCubit.get(context)
                                .acceptTimeMeetingOffer(
                                    notConfirmscheduledMeetings[index].id)
                                .then((value) {
                              if (value) {
                                defaultSnackBar(context,
                                    content: 'Done Confirmation',
                                    color: Colors.green);
                                GetMyScheduleEmployeeMeetingsCubit.get(context)
                                    .getMyScheduleEmployeeMeetings();
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
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                insetPadding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 20),
                                content: BlocProvider(
                                  create: (context) => AvailableMeetingsCubit()
                                    ..getAvailableMeetings(int.parse(
                                        notConfirmscheduledMeetings[index]
                                            .jobId)),
                                  child: BlocBuilder<AvailableMeetingsCubit,
                                          AvailableMeetingsStatesEmployee>(
                                      builder: (context, state) {
                                    if (state is AvailableMeetingSuccessState) {
                                      var availableMeetingsCubit =
                                          AvailableMeetingsCubit.get(context)
                                              .availableMeetingsCandidateModel;

                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            'Other available',
                                            style: primaryTextStyle(deviceInfo)
                                                .copyWith(color: defaultColor),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          availableMeetingsCubit
                                                  .availableMeetings.isEmpty
                                              ? Text(
                                                  'There Is No Available Another Meetings',
                                                  style: primaryTextStyle(
                                                          deviceInfo)
                                                      .copyWith(
                                                          color: Colors.red),
                                                )
                                              : Container(
                                                  child: Wrap(
                                                      runSpacing: 5,
                                                      spacing: 3,
                                                      children:
                                                          availableMeetingsCubit
                                                              .availableMeetings
                                                              .map(
                                                                (e) =>
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    AvailableMeetingsCubit.get(
                                                                            context)
                                                                        .changeSelectedMeeting(
                                                                            e.id);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            3,
                                                                        vertical:
                                                                            8),
                                                                    child: Text(
                                                                      getTime(e
                                                                              .timeFrom) +
                                                                          ' to ' +
                                                                          getTime(
                                                                              e.timeTo),
                                                                      style: thirdTextStyle(
                                                                          deviceInfo),
                                                                    ),
                                                                    decoration:
                                                                        containerDecoration
                                                                            .copyWith(
                                                                      color: AvailableMeetingsCubit.get(context).selectedMeeting ==
                                                                              null
                                                                          ? Colors
                                                                              .white
                                                                          : AvailableMeetingsCubit.get(context).selectedMeeting == e.id
                                                                              ? Colors.lightBlue
                                                                              : Colors.white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                              .toList()),
                                                ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: BlocProvider(
                                                  create: (context) =>
                                                      AcceptMeetingWithAnotherTimeCubit(),
                                                  child: BlocBuilder<
                                                          AcceptMeetingWithAnotherTimeCubit,
                                                          AcceptMeetingWithAnotherTimeStates>(
                                                      builder:
                                                          (context, state) {
                                                    if (state is AcceptMeetingWithAnotherTimeSuccessState ||
                                                        state
                                                            is AcceptMeetingWithAnotherTimeIdleState ||
                                                        state
                                                            is AcceptMeetingWithAnotherTimeErrorState) {
                                                      return defaultButton(
                                                        text: 'CONFIRM',
                                                        onPressed: () async {
                                                          if (AvailableMeetingsCubit
                                                                      .get(
                                                                          context)
                                                                  .selectedMeeting !=
                                                              null) {
                                                            await AcceptMeetingWithAnotherTimeCubit
                                                                    .get(
                                                                        context)
                                                                .changeMeetingTime(
                                                                    notConfirmscheduledMeetings[
                                                                            index]
                                                                        .id,
                                                                    AvailableMeetingsCubit.get(
                                                                            context)
                                                                        .selectedMeeting)
                                                                .then(
                                                                    (value) async {
                                                              Navigator.pop(
                                                                  context);
                                                              if (value) {
                                                                defaultSnackBar(
                                                                    context,
                                                                    content:
                                                                        'Done Edit Meeting Time',
                                                                    color: Colors
                                                                        .green);
                                                                await GetMyScheduleEmployeeMeetingsCubit
                                                                        .get(
                                                                            globalContext)
                                                                    .getMyScheduleEmployeeMeetings();
                                                              } else {
                                                                defaultSnackBar(
                                                                    context,
                                                                    content:
                                                                        'Error Happen Now',
                                                                    color: Colors
                                                                        .redAccent);
                                                              }
                                                            });
                                                          } else {
                                                            defaultSnackBar(
                                                                context,
                                                                content:
                                                                    'Please Choose Meeting',
                                                                color: Colors
                                                                    .redAccent);
                                                          }
                                                        },
                                                        height: 40.0,
                                                      );
                                                    } else
                                                      return loadingProgress();
                                                  }),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: borderButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  text: 'SKIP',
                                                  height: 40.0,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      );
                                    } else if (state
                                        is AvailableMeetingLoadingState)
                                      return loadingProgress();
                                    return Center(child: Text('Error'));
                                  }),
                                ),
                              );
                            });
                      },
                      text: 'CHOOSE OTHER DATE',
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 40.0,
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
}

String getTime(String time) {
  return DateFormat.jm().format(DateFormat('hh:mm').parse(time));
}
