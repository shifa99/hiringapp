import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/models/chat_models/chat_cubit/chat_cubit.dart';
import 'package:hiring_app/models/chat_models/chat_cubit/chat_cubit_states.dart';
import 'package:hiring_app/modules/Employer/home_employee/chat_screen.dart';
import 'package:hiring_app/modules/Employer/home_employee/screens/accepted_for_meeting_screen/accepted_for_meeting.dart';
import 'package:hiring_app/modules/Employer/employer_scheduled_meeting_screen/employer_job_meetings_finished_screen.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:hiring_app/shared/style/style.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:video_player/video_player.dart';

class EmployeeJobSummaryScreen4 extends StatefulWidget {
  final int employeeAcceptedId;
  EmployeeJobSummaryScreen4(this.employeeAcceptedId);
  @override
  _EmployeeJobSummaryScreen4State createState() =>
      _EmployeeJobSummaryScreen4State();
}

class _EmployeeJobSummaryScreen4State extends State<EmployeeJobSummaryScreen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar1(context,
          title: 'Personal Profile', actionWidget: Container()),
      body: responsiveWidget(responsive: (context, deviceInfo) {
        return SingleChildScrollView(
          child: Card(
            color: Colors.white.withOpacity(0.9),
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: deviceInfo.screenwidth * 0.15,
                      ),
                      SizedBox(width: deviceInfo.screenwidth * 0.06),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ahmed Ali',
                            style: TextStyle(
                                color: defaultColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('Cairo, Egypt\n'),
                          defaultButton(
                              text: 'Read CV',
                              onPressed: () {
                               // navigateTo(context, AcceptedForMeetingScreen());
                              },
                              width: deviceInfo.screenwidth * 0.3,
                              height: deviceInfo.screenHeight * 0.06),
                        ],
                      )
                    ],
                  ),
                  myDivider(context),
                  Text(
                    'Information\n',
                    style: secondaryTextStyle(deviceInfo)
                        .copyWith(color: defaultColor),
                  ),
                  Text(
                    '  Male\n',
                    style: thirdTextStyle(deviceInfo),
                  ),
                  Text('  3 years experience\n',
                      style: thirdTextStyle(deviceInfo)),
                  Text('  Bachelor’s Degree\n',
                      style: thirdTextStyle(deviceInfo)),
                  myDivider(context),
                  Text(
                    'SKILLS\n',
                    style: secondaryTextStyle(deviceInfo)
                        .copyWith(color: defaultColor),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: containerDecoration,
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: [
                        buildSkill(text: 'UI/UX'),
                        buildSkill(text: 'Web design'),
                        buildSkill(text: 'Mobile developer'),
                        buildSkill(text: 'UI/UX'),
                        buildSkill(text: 'Tester'),
                        buildSkill(text: 'Mobile developer'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Personal Record\n',
                      style: secondaryTextStyle(deviceInfo)
                          .copyWith(color: defaultColor)),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          size: 35,
                        ),
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                          thickness: 2,
                          endIndent: 10,
                          indent: 10,
                        )),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Personal Video\n',
                    style: secondaryTextStyle(deviceInfo)
                        .copyWith(color: defaultColor),
                  ),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black45),
                    child: Center(
                      child: Icon(
                        Icons.play_arrow,
                        size: 150,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  defaultButton(text: 'Create Meeting', onPressed: () {}),
                  SizedBox(
                    height: 5,
                  ),
                  BlocProvider(
                      create: (context) => ChatCubit(),
                      child: BlocConsumer<ChatCubit, ChatCubitStates>(
                        listener: (context, state) {
                          if (state is ChatSuccessCreateState)
                            navigateTo(context, ChatScreen(widget.employeeAcceptedId));
                        },
                        builder: (context, state) {
                          if (state is ChatSuccessState ||
                              state is ChatErrorState ||
                              state is ChatSuccessCreateState ||
                              state is ChatIdleState)
                            return defaultButton(
                                text: 'Chat',
                                onPressed: () async 
                                {
                                  await ChatCubit.get(context)
                                      .createChatWithNewEmployee(widget.employeeAcceptedId);
                                  await ChatCubit.get(context)
                                      .createChatWithNewEmployer(employerId);
                                }
                                );
                          else
                            return loadingProgress();
                        },
                      )),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
