import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employer/employer_scheduled_meeting_screen/employer_job_meetings_finished_screen.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:hiring_app/shared/style/style.dart';

import 'Employer/home_employee/cubit/employer_cubit/employer_cubit.dart';
import 'Employer/home_employee/cubit/employer_cubit/states.dart';

class EmployeeJobReviewScreen extends StatelessWidget {
  final int id;

  const EmployeeJobReviewScreen({this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            AppEmployerCubit()..showEmployeeProfile(id: id),
        child: responsiveWidget(
          responsive: (context, deviceInfo) => BlocConsumer<AppEmployerCubit,
                  AppEmployerStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = AppEmployerCubit.get(context);
                return ConditionalBuilder(
                  condition: state is! ShowEmployeeProfileLoadingState,
                  fallback: (context) => Scaffold(
                    body: buildCircularProgressIndicator(),
                  ),
                  builder: (context) => Scaffold(
                    body: SafeArea(
                      child: Stack(
                        children: [
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: defaultColor,
                                borderRadius: borderRadiusBottom()),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Personal profile',
                                      style: primaryTextStyle(deviceInfo)
                                          .copyWith(color: secondColor),
                                    ),
                                    Icon(
                                      Icons.add,
                                      color: defaultColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 100),
                            child: SingleChildScrollView(
                              child: Center(
                                // child: cubit.internetConnect ?

                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.topCenter,
                                          children: [
                                            Container(
                                              height: deviceInfo.screenHeight *
                                                  0.81,
                                              width: double.infinity,
                                              // color: Colors.red,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        borderRadiusAll()),
                                                margin: EdgeInsets.only(
                                                    top: 60, bottom: 30),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      '${cubit.showEmployeeModel.employeeDetails.image}'),
                                                  radius:
                                                      deviceInfo.screenwidth *
                                                          0.15,
                                                ),
                                                Text(
                                                    '${cubit.showEmployeeModel.employeeDetails.fullName}'),
                                                Text(
                                                    '${cubit.showEmployeeModel.employeeDetails.country}, ${cubit.showEmployeeModel.employeeDetails.city} '),
                                                myDivider(context),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Date of Birth\n',
                                                            style:
                                                                secondaryTextStyle(
                                                                    deviceInfo),
                                                          ),
                                                          Text('Industry\n',
                                                              style: secondaryTextStyle(
                                                                  deviceInfo)),
                                                          Text('Title\n',
                                                              style: secondaryTextStyle(
                                                                  deviceInfo)),
                                                          Text(
                                                              'Qualification\n',
                                                              style: secondaryTextStyle(
                                                                  deviceInfo)),
                                                          Text(
                                                              'Experience years\n',
                                                              style: secondaryTextStyle(
                                                                  deviceInfo)),
                                                          Text('Gender\n',
                                                              style: secondaryTextStyle(
                                                                  deviceInfo)),
                                                          Text(
                                                              'Personal Video\n',
                                                              style: secondaryTextStyle(
                                                                  deviceInfo)),
                                                        ],
                                                      ),
                                                      const SizedBox(width: 50),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${cubit.showEmployeeModel.employeeDetails.birth}\n',
                                                            style: secondaryTextStyle(
                                                                    deviceInfo)
                                                                .copyWith(
                                                                    color:
                                                                        defaultColor),
                                                          ),
                                                          Text(
                                                            '${cubit.showEmployeeModel.employeeDetails.industry.name}\n',
                                                            style: secondaryTextStyle(
                                                                    deviceInfo)
                                                                .copyWith(
                                                                    color:
                                                                        defaultColor),
                                                          ),
                                                          Text(
                                                            '${cubit.showEmployeeModel.employeeDetails.title}\n',
                                                            style: secondaryTextStyle(
                                                                    deviceInfo)
                                                                .copyWith(
                                                                    color:
                                                                        defaultColor),
                                                          ),
                                                          Text(
                                                            '${cubit.showEmployeeModel.employeeDetails.qualification}\n',
                                                            style: secondaryTextStyle(
                                                                    deviceInfo)
                                                                .copyWith(
                                                                    color:
                                                                        defaultColor),
                                                          ),
                                                          Text(
                                                            '${cubit.showEmployeeModel.employeeDetails.experience}\n',
                                                            style: secondaryTextStyle(
                                                                    deviceInfo)
                                                                .copyWith(
                                                                    color:
                                                                        defaultColor),
                                                          ),
                                                          Text(
                                                            '${cubit.showEmployeeModel.employeeDetails.gender == 0 ? 'Male' : 'Female'}\n',
                                                            style: secondaryTextStyle(
                                                                    deviceInfo)
                                                                .copyWith(
                                                                    color:
                                                                        defaultColor),
                                                          ),
                                                          Image.network(
                                                            '${cubit.showEmployeeModel.employeeDetails.video == null ? 'https://moviemaker.minitool.com/images/uploads/articles/2020/08/youtube-video-not-available/youtube-video-not-available-1.png' : '${cubit.showEmployeeModel.employeeDetails.video}'}',
                                                            height: deviceInfo
                                                                    .screenHeight *
                                                                0.1,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                myDivider(context),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Row(
                                                    children: [
                                                      Text('CV'),
                                                      SizedBox(width: 135),
                                                      Container(
                                                        width: 150,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10,
                                                                vertical: 5),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                                color: defaultColor
                                                                    .withOpacity(
                                                                        0.5))),
                                                        child: Row(
                                                          children: [
                                                            Icon(Icons
                                                                .document_scanner),
                                                            SizedBox(width: 5),
                                                            Text('Ahmed Ali')
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        defaultButton(
                                            text: 'MY REVIEW',
                                            onPressed: () {
                                              // navigateTo(context,
                                              //     EmployerScheduledMeetingScreen());
                                            },
                                            radius: 5)
                                      ],
                                    ),
                                  ),
                                ),
                                // : Text('Internet Not Connected !'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
