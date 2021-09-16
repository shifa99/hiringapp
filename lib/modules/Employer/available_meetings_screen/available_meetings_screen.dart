import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employer/employer_scheduled_meeting_screen/employer_job_meetings_finished_screen.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/employer_cubit.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/states.dart';
import 'package:hiring_app/modules/logins/cubit/available_meetings_cubit/available_meetings_cubit.dart';
import 'package:hiring_app/modules/logins/cubit/available_meetings_cubit/available_meetings_states.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:hiring_app/shared/style/style.dart';
import 'package:intl/intl.dart';

class AvailableMeetingsScreen extends StatelessWidget {
  final int candidateId;
  final int jobId;
  AvailableMeetingsScreen({@required this.candidateId, @required this.jobId});
  @override
  Widget build(BuildContext context) {
    print(candidateId);
    print(jobId);
    return Scaffold(
      body: responsiveWidget(
        responsive: (context, deviceInfo) => SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: BlocProvider(
            create: (context) =>
                AvailableMeetingsCubit()..getAvailableMeetings(jobId),
            child: BlocBuilder<AvailableMeetingsCubit, AvailableMeetingsStates>(
                builder: (context, state) {
              var availableMeetings = AvailableMeetingsCubit.get(context);
              if (state is SuccessAvailableMeetingsStates) {
                return SingleChildScrollView(
                    child: BlocConsumer<AppEmployerCubit, AppEmployerStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (state is LoadingAcceptOrRejectJobState)
                                LinearProgressIndicator(),
                              SizedBox(height: deviceInfo.screenHeight * 0.04),
                              Container(
                                height: deviceInfo.screenHeight * 0.1,
                                decoration: containerDecoration.copyWith(
                                    color: Colors.lightBlue.shade100
                                        .withOpacity(0.5)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(Icons.email_rounded),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Date',
                                                style: secondaryTextStyle(
                                                    deviceInfo),
                                              ),
                                              Text(
                                                availableMeetings
                                                    .availableMeetingsJob
                                                    .availableMeetingsJob
                                                    .meetingDate,
                                                style:
                                                    thirdTextStyle(deviceInfo),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Duration',
                                          style: secondaryTextStyle(deviceInfo),
                                        ),
                                        Text(
                                          '${availableMeetings.availableMeetingsJob.availableMeetingsJob.meetingTime} Min',
                                          style: thirdTextStyle(deviceInfo),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: deviceInfo.screenHeight * 0.05,
                              ),
                              Wrap(
                                children: availableMeetings.availableMeetingsJob
                                    .availableMeetingsJob.availableMeetings
                                    .map((availableMeeting) => GestureDetector(
                                          onTap: () {
                                            availableMeetings.selectMeeting(
                                                availableMeeting.id);
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width:
                                                deviceInfo.screenwidth * 0.455,
                                            height:
                                                deviceInfo.screenHeight * 0.08,
                                            child: Text(
                                              '${getTime(availableMeeting.timeFrom)} to ${getTime(availableMeeting.timeTo)}',
                                              style: thirdTextStyle(deviceInfo)
                                                  .copyWith(
                                                      color: defaultColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 1, vertical: 10),
                                            decoration:
                                                containerDecoration.copyWith(
                                              color: availableMeetings
                                                          .selectedMeeting ==
                                                      availableMeeting.id
                                                  ? Colors.lightBlue.shade200
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: Colors.blue, width: 2),
                                            ),
                                            padding: const EdgeInsets.all(5),
                                          ),
                                        ))
                                    .toList(),
                              ),
                              SizedBox(
                                height: deviceInfo.screenHeight * 0.06,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: defaultButton(
                                          text: 'Confirm',
                                          onPressed: () async {
                                            if (availableMeetings
                                                    .selectedMeeting !=
                                                null) {
                                              await AppEmployerCubit.get(
                                                      context)
                                                  .acceptOrRejectEmployeeForInterview(
                                                      candidateId: candidateId,
                                                      state: 1,
                                                      availableMeetingId:
                                                          availableMeetings
                                                              .selectedMeeting)
                                                  .then((value) async {
                                                if (value) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          duration: Duration(
                                                              seconds: 3),
                                                          content: Text(
                                                              'Accept Employee Succssfully :)')));
                                                  await Future.delayed(
                                                      Duration(seconds: 3));
                                                  navigateTo(
                                                      context,
                                                      EmployerScheduledMeetingScreen(
                                                          jobId));
                                                }
                                                else 
                                                {
                                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Error Happen Appear :(')));
                                                }
                                              });
                                            } else
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Please Choose Appointment')));
                                          })),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: defaultButton(
                                          text: 'Cancel',
                                          onPressed: () {
                                            Navigator.pop(context);
                                          })),
                                ],
                              )
                            ],
                          );
                        }));
              } else if (state is LoadingAvailableMeetingsStates)
                return loadingProgress();
              else
                return Center(
                  child: Text(
                    'Error ',
                    style: primaryTextStyle(deviceInfo)
                        .copyWith(color: Colors.red),
                  ),
                );
            }),
          ),
        )),
      ),
    );
  }
}

String getTime(String time) 
{
  return DateFormat.jm().format(DateFormat('hh:mm').parse(time));
}
