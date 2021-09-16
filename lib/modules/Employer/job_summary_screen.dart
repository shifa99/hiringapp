import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/candidates_after_meeting_cubit/candidates_after_meeting_cubit.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/candidates_after_meeting_cubit/candidates_after_meeting_states.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:hiring_app/shared/style/style.dart';

import '../employee_job_review_screen.dart';

class JobSummaryScreen extends StatelessWidget {
  final int jobId;
  final String jobTitle;
  JobSummaryScreen(this.jobId,this.jobTitle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: responsiveWidget(
        responsive: (context, deviceInfo) => SafeArea(
          child: BlocProvider(
            create: (context) => CandidatesAfterMeetingCubit()
              ..getCandidatesAfterInterview(jobId: jobId),
            child: BlocBuilder<CandidatesAfterMeetingCubit,
                CandidatesAfterMeetingStates>(builder: (context, state) {
              if (state is CandidatesAfterMeetingSuccessState) {
                var jobSummeryDate = CandidatesAfterMeetingCubit.get(context)
                    .candidatesAfterMeetingModel
                    .employees;
                return Stack(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                jobTitle,
                                style: primaryTextStyle(deviceInfo)
                                    .copyWith(color: secondColor),
                              ),
                              Icon(
                                Icons.add,
                                color: defaultColor,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Container(
                                height: 40,
                                child: Card(
                                  child: TextButton.icon(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  content: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text('Title'),
                                                            Checkbox(
                                                                value: true,
                                                                onChanged:
                                                                    (val) {}),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text('Date'),
                                                            Checkbox(
                                                                value: false,
                                                                onChanged:
                                                                    (val) {}),
                                                          ],
                                                        ),
                                                        SizedBox(height: 20),
                                                        defaultButton(
                                                            text: 'Filter',
                                                            onPressed: () {})
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                      },
                                      icon: Image.asset(
                                          'assets/icons/filter.png'),
                                      label: Text(
                                        'Filter',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      )),
                                )),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 115),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: deviceInfo.screenHeight * 0.065,
                                    width: double.infinity,
                                    child: ListView.builder(
                                        itemCount: 4,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                              onTap: () {
                                                CandidatesAfterMeetingCubit.get(
                                                        context)
                                                    .getCandidatesAfterInterview(
                                                        state: 4 - index - 1,
                                                        jobId: jobId);
                                              },
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      borderRadiusAll(),
                                                ),
                                                color: defaultColor,
                                                child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    child: Text(
                                                      titles[4-index-1],
                                                      style: secondaryTextStyle(
                                                              deviceInfo)
                                                          .copyWith(
                                                              color:
                                                                  secondColor),
                                                    )),
                                              ),
                                            )),
                                  ),
                                  jobSummeryDate.isEmpty
                                      ? Center(
                                          child: Text('No Available Date Now'),
                                        )
                                      : GridView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisExtent:
                                                deviceInfo.screenHeight * 0.4,
                                          ),
                                          itemCount: jobSummeryDate.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              InkWell(
                                                onTap: () {

                                                  navigateTo(context,
                                                      EmployeeJobReviewScreen(id: jobSummeryDate[index].id,));
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Card(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            borderRadiusAll()),
                                                    elevation: 3,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          CircleAvatar(
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    jobSummeryDate[
                                                                            index]
                                                                        .image),
                                                            radius: 50,
                                                          ),
                                                          Divider(),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                jobSummeryDate[
                                                                        index]
                                                                    .fullName,
                                                                style: secondaryTextStyle(
                                                                        deviceInfo)
                                                                    .copyWith(
                                                                        color:
                                                                            defaultColor),
                                                              ),
                                                              SizedBox(
                                                                  height: 5),
                                                              Text(
                                                                '${jobSummeryDate[index].city},${jobSummeryDate[index].country}',
                                                                style: thirdTextStyle(
                                                                    deviceInfo),
                                                              ),
                                                              Text(
                                                                '${jobSummeryDate[index].experience} years experience',
                                                                style: thirdTextStyle(
                                                                    deviceInfo),
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: defaultButton(
                                                                        text:
                                                                            'Accepted',
                                                                        onPressed:
                                                                            () {},
                                                                        radius:
                                                                            5,
                                                                        height: deviceInfo.screenHeight *
                                                                            0.05),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 3,
                                                                  ),
                                                                  Expanded(
                                                                    child: Container(
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(5),
                                                                            border: Border.all(
                                                                              color: Colors.grey,
                                                                            )),
                                                                        height: deviceInfo.screenHeight * 0.05,
                                                                        child: Center(
                                                                          child:
                                                                              IconButton(
                                                                            onPressed:
                                                                                () {},
                                                                            icon:
                                                                                Icon(
                                                                              Icons.edit,
                                                                              color: Colors.grey,
                                                                            ),
                                                                            iconSize:
                                                                                15,
                                                                          ),
                                                                        )),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is CandidatesAfterMeetingLoadingState)
                return loadingProgress();
              else
                return Center(
                  child: Text(
                    'Error Happen Appear',
                    style: primaryTextStyle(deviceInfo)
                        .copyWith(color: Colors.red),
                  ),
                );
            }),
          ),
        ),
      ),
    );
  }
}

List<String> titles = [
  'Rejected',
  'Accepted',
  'Under Review',
  'ALL',
];
