import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/models/employer/my_schedule_model.dart';
import 'package:hiring_app/modules/Employer/employer_scheduled_meeting_screen/employer_job_meetings_finished_screen.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/employer_cubit.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/states.dart';
import 'package:hiring_app/modules/Employer/home_employee/screens/edit_job_screen.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:hiring_app/shared/style/style.dart';

class LiveDetailsScreen extends StatelessWidget {
  final int index;
  LiveDetailsScreen({this.index});

  @override
  Widget build(BuildContext context) {
    var currentScaffold = ScaffoldMessenger.of(context);

    return BlocBuilder<AppEmployerCubit, AppEmployerStates>(
        builder: (context, state) {
      var schedule =
          AppEmployerCubit.get(context).myScheduleModel.schedule[index];
      return Scaffold(
        appBar: defaultAppBar1(context,
            title: 'Details', actionWidget: Container()),
        body: responsiveWidget(
          responsive: (context, deviceInfo) => Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                if (state is LoadingDeleteJobState) LinearProgressIndicator(),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildHeadTitle(title: 'About job Title'),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Job title\n'),
                                        Text('Job field \n'),
                                        Text('Details\n'),
                                      ],
                                    ),
                                    SizedBox(width: 50),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${schedule.title}\n',
                                          style: thirdTextStyle(deviceInfo)
                                              .copyWith(color: defaultColor),
                                        ),
                                        Text(
                                          '${schedule.jobField.name}\n',
                                          style: thirdTextStyle(deviceInfo)
                                              .copyWith(color: defaultColor),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: Text(
                                            '${schedule.details}\n',
                                            style: thirdTextStyle(deviceInfo)
                                                .copyWith(color: defaultColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Salary\n'),
                                        Text('Gender \n'),
                                        Text('Experience\n'),
                                        Text('Qualification\n'),
                                      ],
                                    ),
                                    SizedBox(width: 50),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${schedule.salary}\n',
                                          style: thirdTextStyle(deviceInfo)
                                              .copyWith(color: defaultColor),
                                        ),
                                        Text(
                                          '${schedule.gender == 0 ? 'Male' : 'Female'}\n',
                                          style: thirdTextStyle(deviceInfo)
                                              .copyWith(color: defaultColor),
                                        ),
                                        Text(
                                          '${schedule.experience} years\n',
                                          style: thirdTextStyle(deviceInfo)
                                              .copyWith(color: defaultColor),
                                        ),
                                        Text(
                                          '${schedule.qualification}\n',
                                          style: thirdTextStyle(deviceInfo)
                                              .copyWith(color: defaultColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              myDivider(context),
                              buildHeadTitle(title: 'Dates'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.date_range),
                                        SizedBox(width: 10),
                                        Text(
                                          '${schedule.meetingDate}',
                                          style: thirdTextStyle(deviceInfo)
                                              .copyWith(color: defaultColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.watch_later_outlined),
                                        SizedBox(width: 10),
                                        Center(
                                          child: Text(
                                            '9:00 am - 11:00 am',
                                            style: TextStyle(
                                              color: defaultColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              myDivider(context),
                              buildHeadTitle(
                                  title: 'About Meeting Interviewer'),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Name\n'),
                                        Text('Role \n'),
                                      ],
                                    ),
                                    SizedBox(width: 50),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${schedule.interviewerName}\n',
                                          style: thirdTextStyle(deviceInfo)
                                              .copyWith(color: defaultColor),
                                        ),
                                        Text(
                                          '${schedule.interviewerRole}\n',
                                          style: thirdTextStyle(deviceInfo)
                                              .copyWith(color: defaultColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: borderRadiusTop(radius: 25.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                defaultButton(
                  text: 'CANDIDATES',
                  onPressed: () {
                    navigateTo(context, EmployerScheduledMeetingScreen(schedule.id));
                  },
                  width: 120.0,
                ),
                borderButton(
                    onPressed: () {
                      navigateTo(
                          context,
                          EditJobScreen(
                              indexJob: index,
                              jobId: schedule.id,
                              date: schedule.meetingDate,
                              title: schedule.title,
                              jobField: schedule.jobField.name,
                              description: schedule.details,
                              salary: schedule.salary,
                              gender: schedule.gender,
                              experience: schedule.experience,
                              qualification: schedule.qualification,
                              time: schedule.startFrom,
                              timeTo: schedule.meetingEnd,
                              nameEnterviewer: schedule.interviewerName,
                              roleEnterviewer: schedule.interviewerRole,
                              meetingTime: schedule.meetingTime));
                    },
                    width: 100,
                    text: 'EDIT'),
                TextButton(
                  onPressed: () {
                    currentScaffold.showSnackBar(SnackBar(
                      content: Text(
                        'Are You Sure To Delete Job ?',
                      ),
                      backgroundColor: Colors.green,
                      duration: Duration(
                        seconds: 3,
                      ),
                      action: SnackBarAction(
                        textColor: Colors.white,
                        label: 'Confirm',
                        onPressed: () async {
                          await AppEmployerCubit.get(context)
                              .deleteJob(schedule.id)
                              .then((value) {
                            if (value) {
                              currentScaffold.hideCurrentSnackBar();
                              currentScaffold.showSnackBar(SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text('Removed Successfully')));
                              Navigator.pop(context);
                              AppEmployerCubit.get(context).getMyScheduleData();
                            } else {
                              currentScaffold.hideCurrentSnackBar();
                              currentScaffold.showSnackBar(SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                      'You Can\'t remove This Job Now !!')));
                            }
                          });
                        },
                      ),
                    ));
                  },
                  child: Text('CANCEL'),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Text buildHeadTitle({String title}) {
    return Text(
      '$title\n',
      style: TextStyle(
          color: defaultColor, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
