import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employee/home/cubit/cubit.dart';
import 'package:hiring_app/modules/Employer/employer_scheduled_meeting_screen/build_filtered_item.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/employer_cubit.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/states.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/filteration_cubit/filteration_cubit.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/filteration_cubit/filteration_cubit_states.dart';
import 'package:hiring_app/modules/employee_job_summary_screen3.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:hiring_app/shared/style/style.dart';
import 'package:intl/intl.dart';

import '../../employee_job_review_screen.dart';
import 'build_filtered_classified_widget.dart';

class EmployerScheduledMeetingScreen extends StatefulWidget {
  final int jobId;
  EmployerScheduledMeetingScreen(this.jobId);
  @override
  _EmployerScheduledMeetingScreenState createState() =>
      _EmployerScheduledMeetingScreenState();
}

class _EmployerScheduledMeetingScreenState
    extends State<EmployerScheduledMeetingScreen> {
  List<String> filter = [
    'All',
    'Not confirmed',
    'Accepted',
    'Rejected',
  ];
  @override
  void didChangeDependencies() 
  {
    AppEmployerCubit.get(context).getCandidates(jobId: widget.jobId);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return responsiveWidget(
        responsive: (context, deviceInfo) => Scaffold(
                body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    height: deviceInfo.screenHeight * 0.15,
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
                              'Job Meetings Finished',
                              style: primaryTextStyle(deviceInfo)
                                  .copyWith(color: secondColor),
                            ),
                            Container(),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
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
                                                      const EdgeInsets.all(8.0),
                                                  child: SingleChildScrollView(
                                                    child: BlocProvider<
                                                        FilterationCubit>(
                                                      create: (context) =>
                                                          FilterationCubit(),
                                                      child: BlocConsumer<
                                                              FilterationCubit,
                                                              FilterationCubitStates>(
                                                          listener: (context,
                                                              state) {},
                                                          builder:
                                                              (context, state) {
                                                            var filterCubit =
                                                                FilterationCubit
                                                                    .get(
                                                                        context);
                                                            return Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .stretch,
                                                              children: [
                                                                buildFilteredClassifiedWidget(
                                                                    label:
                                                                        'Qualification',
                                                                    onChanged:
                                                                        (value) {
                                                                      filterCubit
                                                                          .changeFilter(
                                                                              0,
                                                                              value);
                                                                    },
                                                                    checked:
                                                                        filterCubit
                                                                            .filtertypes[0]),
                                                                filterCubit
                                                                        .filtertypes[0]
                                                                    ? DropdownButton(
                                                                        onChanged:
                                                                            (selectedQulifications) {
                                                                          filterCubit
                                                                              .changeQualificationDegree(selectedQulifications);
                                                                        },
                                                                        value: filterCubit
                                                                            .selectedQualification,
                                                                        items: filterCubit
                                                                            .qualificationList
                                                                            .map(
                                                                              (value) => DropdownMenuItem<String>(
                                                                                child: Text(value),
                                                                                onTap: () {},
                                                                                value: value,
                                                                              ),
                                                                            )
                                                                            .toList(),
                                                                      )
                                                                    : Container(),
                                                                buildFilteredClassifiedWidget(
                                                                    label:
                                                                        'Experience',
                                                                    onChanged:
                                                                        (value) {
                                                                      filterCubit
                                                                          .changeFilter(
                                                                              1,
                                                                              value);
                                                                    },
                                                                    checked:
                                                                        filterCubit
                                                                            .filtertypes[1]),
                                                                filterCubit
                                                                        .filtertypes[1]
                                                                    ? Row(
                                                                        children: [
                                                                          Text(
                                                                            '0',
                                                                            style:
                                                                                thirdTextStyle(deviceInfo).copyWith(color: defaultColor),
                                                                          ),
                                                                          Expanded(
                                                                            child: Slider(
                                                                                activeColor: defaultColor,
                                                                                value: filterCubit.experienceYears,
                                                                                inactiveColor: Colors.lightBlue,
                                                                                min: 0.0,
                                                                                max: 10.0,
                                                                                divisions: 10,
                                                                                label: filterCubit.experienceYears.round().toString(),
                                                                                onChanged: (experience) {
                                                                                  print(experience);
                                                                                  filterCubit.changeExperiecneYears(experience);
                                                                                }),
                                                                          ),
                                                                          Text(
                                                                            '10+',
                                                                            style:
                                                                                thirdTextStyle(deviceInfo).copyWith(color: defaultColor),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    : Container(),
                                                                buildFilteredClassifiedWidget(
                                                                    label:
                                                                        'Age',
                                                                    onChanged:
                                                                        (value) {
                                                                      filterCubit
                                                                          .changeFilter(
                                                                              2,
                                                                              value);
                                                                    },
                                                                    checked:
                                                                        filterCubit
                                                                            .filtertypes[2]),
                                                                filterCubit
                                                                        .filtertypes[2]
                                                                    ? Row(
                                                                        children: [
                                                                          Text(
                                                                            '18',
                                                                            style:
                                                                                thirdTextStyle(deviceInfo).copyWith(color: defaultColor),
                                                                          ),
                                                                          Expanded(
                                                                            child: RangeSlider(
                                                                                min: 18,
                                                                                max: 60,
                                                                                divisions: 60,
                                                                                labels: RangeLabels(filterCubit.startAge.round().toString(), filterCubit.endAge.round().toString()),
                                                                                values: RangeValues(filterCubit.startAge, filterCubit.endAge),
                                                                                onChanged: (value) {
                                                                                  filterCubit.changeAge(value);
                                                                                }),
                                                                          ),
                                                                          Text(
                                                                            '60+',
                                                                            style:
                                                                                thirdTextStyle(deviceInfo).copyWith(color: defaultColor),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    : Container(),
                                                                buildFilteredClassifiedWidget(
                                                                    label:
                                                                        'Gender',
                                                                    onChanged:
                                                                        (value) {
                                                                      filterCubit
                                                                          .changeFilter(
                                                                              3,
                                                                              value);
                                                                    },
                                                                    checked:
                                                                        filterCubit
                                                                            .filtertypes[3]),
                                                                filterCubit.filtertypes[
                                                                        3]
                                                                    ? DropdownButton(
                                                                        onChanged:
                                                                            (gender) {
                                                                          print(
                                                                              gender);
                                                                          filterCubit
                                                                              .changeGender(gender);
                                                                        },
                                                                        value: filterCubit
                                                                            .selectedGender,
                                                                        items: filterCubit
                                                                            .gender
                                                                            .map((gender) =>
                                                                                DropdownMenuItem(value: gender, child: Text(gender)))
                                                                            .toList())
                                                                    : Container(),
                                                                SizedBox(
                                                                    height: 20),
                                                                defaultButton(
                                                                    text:
                                                                        'Filter',
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                      if (filterCubit.filtertypes[0] ||
                                                                          filterCubit.filtertypes[
                                                                              1] ||
                                                                          filterCubit.filtertypes[
                                                                              2] ||
                                                                          filterCubit
                                                                              .filtertypes[3]) {
                                                                        AppEmployerCubit.get(context)
                                                                            .candidatesModel
                                                                            .candidates = AppEmployerCubit.get(
                                                                                context)
                                                                            .filteredCandidats;
                                                                        AppEmployerCubit.get(context)
                                                                            .filterCandidate(
                                                                          experience: filterCubit.filtertypes[1]
                                                                              ? filterCubit.experienceYears.toInt()
                                                                              : null,
                                                                          gender: filterCubit.filtertypes[3]
                                                                              ? filterCubit.selectedGender
                                                                              : null,
                                                                          qualification: filterCubit.filtertypes[0]
                                                                              ? filterCubit.selectedQualification
                                                                              : null,
                                                                          startAge: filterCubit.filtertypes[2]
                                                                              ? filterCubit.startAge.toInt()
                                                                              : null,
                                                                          endAge: filterCubit.filtertypes[2]
                                                                              ? filterCubit.endAge.toInt()
                                                                              : null,
                                                                        );
                                                                      }
                                                                      // navigateTo(
                                                                      //     context,
                                                                      //     EmployeeJobSummaryScreen3());
                                                                    })
                                                              ],
                                                            );
                                                          }),
                                                    ),
                                                  ),
                                                ),
                                              ));
                                    },
                                    icon:
                                        Image.asset('assets/icons/filter.png'),
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
                  BlocBuilder<AppEmployerCubit, AppEmployerStates>(
                      builder: (context, state) {
                    if (state is! GetCandidatesErrorState &&
                        state is! GetCandidatesLoadingState) {
                      var cubit = AppEmployerCubit.get(context);
                      return Container(
                        padding: const EdgeInsets.only(top: 115),
                        child: SingleChildScrollView(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  Container(
                                    height: 40,
                                    width: double.infinity,
                                    child: ListView.builder(
                                      itemCount: 4,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          buildFilteredItem(
                                              onTap: () {
                                                cubit.getCandidates(
                                                    selectedEmployeeIndex:
                                                        index,
                                                    jobId: widget.jobId);
                                              },
                                              label: filter[index]),
                                    ),
                                  ),
                                  cubit.candidatesModel.candidates != null &&
                                          cubit.candidatesModel.candidates
                                                  .length !=
                                              0
                                      ? Container(
                                          height:
                                              deviceInfo.screenHeight * 0.73,
                                          child: GridView.builder(
                                              physics: BouncingScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisExtent:
                                                    deviceInfo.screenHeight *
                                                        0.48,
                                              ),
                                              itemCount: cubit.candidatesModel
                                                  .candidates.length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    navigateTo(
                                                        context,
                                                        EmployeeJobSummaryScreen3(
                                                            candidateId: cubit
                                                                .candidatesModel
                                                                .candidates[
                                                                    index]
                                                                .id,
                                                            candidateApplyStatus:cubit
                                                                .candidatesModel
                                                                .candidates[
                                                                    index].candatApplayStatus,
                                                            employeeId: cubit
                                                                .candidatesModel
                                                                .candidates[
                                                                    index]
                                                                .employee
                                                                .id,
                                                            jobJd: int.parse(cubit
                                                                .candidatesModel
                                                                .candidates[
                                                                    index]
                                                                .jobId)));
                                                    // navigateTo(
                                                    //     context,
                                                    //     EmployeeJobSummaryScreen(
                                                    //       id: cubit
                                                    //           .candidatesModel
                                                    //           .candidates[index]
                                                    //           .employee
                                                    //           .id,
                                                    //     ));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Card(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              borderRadiusAll()),
                                                      elevation: 3,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundImage:
                                                                  NetworkImage(cubit
                                                                      .candidatesModel
                                                                      .candidates[
                                                                          index]
                                                                      .employee
                                                                      .image),
                                                              radius: deviceInfo
                                                                      .screenwidth *
                                                                  0.2,
                                                            ),
                                                            Divider(),
                                                            Text(
                                                              '${cubit.candidatesModel.candidates[index].employee.fullName}\n',
                                                              style: secondaryTextStyle(
                                                                      deviceInfo)
                                                                  .copyWith(
                                                                      color:
                                                                          defaultColor),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              '${cubit.candidatesModel.candidates[index].employee.experience} years',
                                                              style:
                                                                  thirdTextStyle(
                                                                      deviceInfo),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              '${cubit.candidatesModel.candidates[index].employee.country}, ${cubit.candidatesModel.candidates[index].employee.city}',
                                                              style:
                                                                  thirdTextStyle(
                                                                      deviceInfo),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              '${cubit.candidatesModel.candidates[index].employee.qualification}',
                                                              style:
                                                                  thirdTextStyle(
                                                                      deviceInfo),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            if (cubit
                                                                    .savedIndex ==
                                                                2)
                                                              Text(
                                                                '${DateFormat('yyyy-MM-dd').format(cubit.candidatesModel.candidates[index].job.meetingDate)}',
                                                                style: thirdTextStyle(
                                                                        deviceInfo)
                                                                    .copyWith(
                                                                        color:
                                                                            defaultColor),
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        )
                                      : Center(
                                          child: Text('no Available Data'),
                                        )
                                ]),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (state is GetCandidatesLoadingState)
                      return loadingProgress();
                    else
                      return Center(
                        child: Text(
                          'Error',
                          style: primaryTextStyle(deviceInfo)
                              .copyWith(color: Colors.red),
                        ),
                      );
                  }),
                ],
              ),
            )));
  }
}
