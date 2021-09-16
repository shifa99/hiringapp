import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/employer_cubit.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/states.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:hiring_app/shared/style/style.dart';

import '../live_details_screen.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  bool isFirst = true;
  @override
  void didChangeDependencies() {
    if (isFirst) AppEmployerCubit.get(context).getMyScheduleData();
    isFirst = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return responsiveWidget(
      responsive: (context, deviceInfo) =>
          BlocConsumer<AppEmployerCubit, AppEmployerStates>(
        listener: (context, state) {},
        builder: (context, state) => ConditionalBuilder(
          condition: state is! GetMuScheduleDataLoadingState,
          fallback: (context) => buildCircularProgressIndicator(),
          builder: (context) {
            var cubit = AppEmployerCubit.get(context);
            return cubit.myScheduleModel.schedule != null &&
                    cubit.myScheduleModel.schedule.length != 0
                ? SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      height: deviceInfo.screenHeight * 0.66,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GridView.builder(
                              physics: BouncingScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: deviceInfo.screenHeight * 0.28,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                              ),
                              itemCount: cubit.myScheduleModel.schedule.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      // navigateTo(context, JobDetailsScreen());
                                      navigateTo(
                                          context,
                                          LiveDetailsScreen(
                                            index:index,
                                            
                                          ));
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      elevation: 3,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '${cubit.myScheduleModel.schedule[index].title}',
                                                    style: secondaryTextStyle(
                                                        deviceInfo),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  height:
                                                      deviceInfo.screenHeight *
                                                          0.05,
                                                  width:
                                                      deviceInfo.screenHeight *
                                                          0.055,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: defaultColor),
                                                  child: Text(
                                                    '${cubit.myScheduleModel.schedule[index].employeejobCount}',
                                                    style: thirdTextStyle(
                                                            deviceInfo)
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Text(
                                              '${cubit.myScheduleModel.schedule[index].employer.country}, ${cubit.myScheduleModel.schedule[index].employer.city}\n',
                                              style: thirdTextStyle(deviceInfo)
                                                  .copyWith(
                                                      color: Colors.black54),
                                            ),
                                            Text(
                                              'Meeting in ',
                                              style: thirdTextStyle(deviceInfo),
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.date_range,
                                                  size: 15,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  '${cubit.myScheduleModel.schedule[index].meetingDate}',
                                                  style: thirdTextStyle(
                                                      deviceInfo),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.watch_later_outlined,
                                                  size: 15,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  '${cubit.myScheduleModel.schedule[index].meetingTime}',
                                                  style: thirdTextStyle(
                                                      deviceInfo),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Apply',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(width: 5),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 3),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Colors.grey,
                                                      style: BorderStyle.solid,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    '${cubit.myScheduleModel.schedule[index].employeejobCount}/${cubit.myScheduleModel.schedule[index].applies}',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))),
                    ),
                  )
                : Text('No Data Available Now', textAlign: TextAlign.center);
          },
        ),
      ),
    );
  }
}
