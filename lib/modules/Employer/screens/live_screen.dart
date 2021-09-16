import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employee/home/cubit/accepted_live_job_cubit/accepted_live_job_cubit.dart';
import 'package:hiring_app/modules/Employee/home/cubit/live_jobs_today_cubit/live_jobs_today_cubit.dart';
import 'package:hiring_app/modules/Employee/home/cubit/live_jobs_today_cubit/live_jobs_today_states.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:hiring_app/shared/style/style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../home_employee/screens/accepted_for_meeting_screen/accepted_for_meeting.dart';
import '../meeting_details_screen.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return responsiveWidget(responsive: (context,deviceInfo)=>
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: BlocProvider(
           create: (context) => LiveJobsTodayCubit()..getAllLiveJobs(),
           child: BlocConsumer<LiveJobsTodayCubit, LiveJobsTodayStates>(
               listener: (context, state) {},
               builder: (context, state) {
                 if (state is LiveJobsSuccessState) {
                   var liveCubit = LiveJobsTodayCubit.get(context);
                   return Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height: 10),
                       buildHeadLine(title: 'Meeting countdown\n'),
                       SizedBox(height: 10),
                       ListView.separated(
                         shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                           itemBuilder: (context, index) 
                           {
                             return GestureDetector(
                               onTap: (){
                                 navigateTo(context, AcceptedForMeetingScreen(liveCubit.liveJobsModel.jobs[index].id));
                               },
                               child: Container(
                                 decoration: containerDecoration,
                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                 child:Text(liveCubit.liveJobsModel.jobs[index].title,
                                 style: primaryTextStyle(deviceInfo),)
                               ),
                             );
                           },
                           separatorBuilder: (context, index) => SizedBox(
                                 height: 5,
                               ),
                           itemCount: liveCubit.liveJobsModel.jobs.length)
    
                       // Center(
                       //   child: CircularPercentIndicator(
                       //     progressColor: defaultColor,
                       //     backgroundColor: defaultColor.withOpacity(0.5),
                       //     percent: 0.9,
                       //     animation: true,
                       //     radius: 150.0,
                       //     lineWidth: 12.0,
                       //     circularStrokeCap: CircularStrokeCap.round,
                       //     center: Text(
                       //       "13 Min",
                       //       style: TextStyle(
                       //           color: Colors.green, fontSize: 22),
                       //     ),
                       //   ),
                       // ),
                       // Card(
                       //   elevation: 5,
                       //   shape: RoundedRectangleBorder(
                       //       borderRadius: BorderRadius.circular(10)),
                       //   child: Padding(
                       //     padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
                       //     child: Column(
                       //       children: [
                       //         buildHeadLine(title: 'IOS Developer'),
                       //         SizedBox(height: 10),
                       //         Row(
                       //           mainAxisAlignment:
                       //           MainAxisAlignment.spaceAround,
                       //           children: [
                       //             defaultButton(
                       //               text: 'ACCEPTED',
                       //               onPressed: () {
                       //                 navigateTo(context, AcceptedForMeetingScreen());
                       //               },
                       //               width:
                       //               MediaQuery.of(context).size.width *
                       //                   0.35,
                       //             ),
                       //             borderButton(
                       //               onPressed: () {
                       //                 navigateTo(context, MeetingDetailsScreen());
                       //               },
                       //               text: 'DETAILS',
                       //               height: 45.0,
                       //               width:
                       //               MediaQuery.of(context).size.width *
                       //                   0.35,
                       //               fontSize: 14.0,
                       //             ),
                       //           ],
                       //         )
                       //       ],
                       //     ),
                       //   ),
                       // )
                     ],
                   );
                 } else if (state is LiveJobsLoadingState)
                   return loadingProgress();
                 else
                   return Text('Error');
               }),
         ),
       ),
    );
  }
}
//Company Details