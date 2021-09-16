import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employer/available_meetings_screen/available_meetings_screen.dart';
import 'package:hiring_app/modules/Employer/employer_scheduled_meeting_screen/employer_job_meetings_finished_screen.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/employer_cubit.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/states.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:hiring_app/shared/style/style.dart';

class EmployeeJobSummaryScreen3 extends StatefulWidget {
  final int employeeId;
  final int candidateId;
  final String candidateApplyStatus;

  final int jobJd;

  const EmployeeJobSummaryScreen3(
      {@required this.employeeId,
      @required this.jobJd,
      @required this.candidateApplyStatus,
      @required this.candidateId});

  @override
  _EmployeeJobSummaryScreen3State createState() =>
      _EmployeeJobSummaryScreen3State();
}

class _EmployeeJobSummaryScreen3State extends State<EmployeeJobSummaryScreen3> {
  bool isFirst = true;

  @override
  void didChangeDependencies() {
    if (isFirst)
      AppEmployerCubit.get(context).showEmployeeProfile(id: widget.employeeId);
    isFirst = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: responsiveWidget(
        responsive: (context, deviceInfo) =>
            BlocBuilder<AppEmployerCubit, AppEmployerStates>(
                builder: (context, state) {
          var employeeProfileData =
              AppEmployerCubit.get(context).showEmployeeModel.employeeDetails;
          if (state is! ShowEmployeeProfileLoadingState &&
              state is! ShowEmployeeProfileErrorState) {
            return SafeArea(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BackButton(),
                          Text(
                            'Scheduled meeting',
                            style: primaryTextStyle(deviceInfo)
                                .copyWith(color: defaultColor),
                          ),
                         Container(),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 100),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Container(
                                      height: deviceInfo.screenHeight * 0.73,
                                      width: double.infinity,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        margin: EdgeInsets.only(
                                            top: 60, bottom: 30),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          radius: deviceInfo.screenwidth * 0.15,
                                          backgroundImage: NetworkImage(
                                            employeeProfileData.image,
                                          ),
                                        ),
                                        Text(
                                          employeeProfileData.fullName,
                                          style: secondaryTextStyle(deviceInfo),
                                        ),
                                        Text(
                                          '${employeeProfileData.city} , ${employeeProfileData.country} ',
                                          style: secondaryTextStyle(deviceInfo),
                                        ),
                                        myDivider(context),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Date of Birth\n',
                                                    style: secondaryTextStyle(
                                                        deviceInfo),
                                                  ),
                                                  Text(
                                                    'Industry\n',
                                                    style: secondaryTextStyle(
                                                        deviceInfo),
                                                  ),
                                                  Text(
                                                    'Title\n',
                                                    style: secondaryTextStyle(
                                                        deviceInfo),
                                                  ),
                                                  Text(
                                                    'Qualification\n',
                                                    style: secondaryTextStyle(
                                                        deviceInfo),
                                                  ),
                                                  Text(
                                                    'Experience years\n',
                                                    style: secondaryTextStyle(
                                                        deviceInfo),
                                                  ),
                                                  Text(
                                                    'Gender\n',
                                                    style: secondaryTextStyle(
                                                        deviceInfo),
                                                  ),
                                                  Text(
                                                    'Personal Video\n',
                                                    style: secondaryTextStyle(
                                                        deviceInfo),
                                                  ),
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
                                                    employeeProfileData.birth,
                                                    style: secondaryTextStyle(
                                                            deviceInfo)
                                                        .copyWith(
                                                            color:
                                                                defaultColor),
                                                  ),
                                                  Text(
                                                    'Engineering\n',
                                                    style: secondaryTextStyle(
                                                            deviceInfo)
                                                        .copyWith(
                                                            color:
                                                                defaultColor),
                                                  ),
                                                  Text(
                                                    '${employeeProfileData.title}\n',
                                                    style: secondaryTextStyle(
                                                            deviceInfo)
                                                        .copyWith(
                                                            color:
                                                                defaultColor),
                                                  ),
                                                  Text(
                                                    '${employeeProfileData.qualification}\n',
                                                    style: secondaryTextStyle(
                                                            deviceInfo)
                                                        .copyWith(
                                                            color:
                                                                defaultColor),
                                                  ),
                                                  Text(
                                                    '${employeeProfileData.experience}+\n',
                                                    style: TextStyle(
                                                        color: defaultColor),
                                                  ),
                                                  Text(
                                                    '${employeeProfileData.gender}\n',
                                                    style: TextStyle(
                                                        color: defaultColor),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.play_arrow,
                                                        size: 50,
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        myDivider(context),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'CV',
                                                style: secondaryTextStyle(
                                                    deviceInfo),
                                              ),
                                              Spacer(),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  decoration:
                                                      containerDecoration,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons
                                                          .document_scanner),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        employeeProfileData
                                                            .fullName,
                                                        style:
                                                            secondaryTextStyle(
                                                                deviceInfo),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                widget.candidateApplyStatus == null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: defaultButton(
                                                text: 'ACCEPT',
                                                onPressed: () {
                                                  navigateTo(
                                                      context,
                                                      AvailableMeetingsScreen(
                                                        candidateId:
                                                            widget.candidateId,
                                                        jobId: widget.jobJd,
                                                      ));
                                                },
                                                radius: 5),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: borderButton(
                                              onPressed: () {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  duration:
                                                      Duration(seconds: 3),
                                                  backgroundColor: Colors.green,
                                                  content: Text(
                                                      'Are You Sure For Reject ?'),
                                                  action: SnackBarAction(
                                                      textColor: Colors.white,
                                                      label: 'Confirm',
                                                      onPressed: () async {
                                                        await AppEmployerCubit
                                                                .get(context)
                                                            .acceptOrRejectEmployeeForInterview(
                                                                candidateId: widget
                                                                    .candidateId,
                                                                state: 0)
                                                            .then((value) {
                                                          if (!value)
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(SnackBar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    content: Text(
                                                                        'Something Happen Error !!')));
                                                          else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(SnackBar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .green,
                                                                    content: Text(
                                                                        'Rejected Succssfully :)')));
                                                            Navigator.pop(
                                                                context);
                                                          }
                                                        });
                                                      }),
                                                ));
                                              },
                                              text: 'REJECT',
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ShowEmployeeProfileLoadingState)
            return loadingProgress();
          else
            return Center(
              child: Text('Error Happen In Internet'),
            );
        }),
      ),
    );
  }
}
