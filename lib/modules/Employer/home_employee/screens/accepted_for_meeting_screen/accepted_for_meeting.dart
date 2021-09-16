import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employee/home/cubit/accepted_live_job_cubit/accepted_live_job_cubit.dart';
import 'package:hiring_app/modules/Employee/home/cubit/accepted_live_job_cubit/accepted_live_job_states.dart';
import 'package:hiring_app/modules/Employer/employer_scheduled_meeting_screen/employer_job_meetings_finished_screen.dart';
import 'package:hiring_app/modules/Employer/employees_accepted_for_job.dart';
import 'package:hiring_app/modules/Employer/live_details_screen.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:hiring_app/shared/style/style.dart';
import 'package:video_player/video_player.dart';

class AcceptedForMeetingScreen extends StatelessWidget {
  final int jobId;
  AcceptedForMeetingScreen(this.jobId);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          defaultAppBar1(context, title: 'Accepted', actionWidget: Container()),
      body: responsiveWidget(
        responsive: (context, deviceInfo) => BlocProvider(
          create: (context) => AcceptedLiveJobsCubit()..getAllLiveJobs(jobId),
          child: BlocBuilder<AcceptedLiveJobsCubit, AcceptedLiveJobsStates>(
              builder: (context, state) {
            if (state is LiveJobsAcceptedSuccessState) {
              var acceptedEmployee = AcceptedLiveJobsCubit.get(context);
              return GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: deviceInfo.screenHeight * 0.35,
                  ),
                  itemCount: acceptedEmployee.acceptedEmployeesForLiveJobModel
                      .acceptedEmployees.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          navigateTo(context, EmployeeJobSummaryScreen4(acceptedEmployee.acceptedEmployeesForLiveJobModel.acceptedEmployees[index].id));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      backgroundImage:NetworkImage(acceptedEmployee.acceptedEmployeesForLiveJobModel.acceptedEmployees[index].image),
                                      radius:
                                          (deviceInfo.screenwidth / 2) * 0.25,
                                    ),
                                  ),
                                  Divider(),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${acceptedEmployee.acceptedEmployeesForLiveJobModel.acceptedEmployees[index].fullName}\n',
                                        style: secondaryTextStyle(deviceInfo)
                                            .copyWith(color: defaultColor),
                                            overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        '${acceptedEmployee.acceptedEmployeesForLiveJobModel.acceptedEmployees[index].city},${acceptedEmployee.acceptedEmployeesForLiveJobModel.acceptedEmployees[index].country}',
                                        style: subTextStyle(deviceInfo),
                                      ),
                                      Text(
                                        '${acceptedEmployee.acceptedEmployeesForLiveJobModel.acceptedEmployees[index].experience} years experience',
                                        style: subTextStyle(deviceInfo),
                                      ),
                                      Text(
                                        '12-2 9:00 am',
                                        style: subTextStyle(deviceInfo)
                                            .copyWith(color: defaultColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ));
            } else if (state is LiveJobsAcceptedLoadingState)
              return loadingProgress();
            else
              return Text('Error');
          }),
        ),
      ),
    );
  }
}
