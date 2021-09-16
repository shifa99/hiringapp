import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employer/job_summary_screen.dart';
import 'package:hiring_app/modules/Employer/meeting_details_screen.dart';
import 'package:hiring_app/modules/Employer/home_employee/screens/accepted_for_meeting_screen/accepted_for_meeting.dart';
import 'package:hiring_app/modules/Employee/home/cubit/cubit.dart';
import 'package:hiring_app/modules/Employee/home/cubit/states.dart';
import 'package:hiring_app/modules/Employee/job_details_screen.dart';
import 'package:hiring_app/modules/Employer/live_details_screen.dart';
import 'package:hiring_app/modules/Employer/home_employee/screens/meeting_summery_screen/meeting_summary_screen.dart';
import 'package:hiring_app/modules/Employer/screens/live_screen.dart';
import 'package:hiring_app/modules/Employer/screens/schedule_screen.dart';
import 'package:hiring_app/modules/employee_job_review_screen.dart';
import 'package:hiring_app/modules/employee_job_summary_screen3.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ScheduleEmployerScreen extends StatefulWidget {
  @override
  _ScheduleEmployerScreenState createState() => _ScheduleEmployerScreenState();
}

class _ScheduleEmployerScreenState extends State<ScheduleEmployerScreen> {
  String selectedTab = 'current';

  List<bool> isSelected;
  int currentIndex = 0;

  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  TabController tabController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              width: double.infinity,
              child: ToggleButtons(
                borderWidth: 1,
                fillColor: Colors.white,
                selectedBorderColor: defaultColor,
                splashColor: secondColor,
                selectedColor: defaultColor,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    alignment: Alignment.center,
                    child: Text(
                      'Schedule',
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 5,
                    alignment: Alignment.center,
                    child: Text(
                      'Live',
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    currentIndex = index;
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                },
                isSelected: isSelected,
              ),
            ),
            currentIndex == 0
                ?     /// Schedule Screen
            ScheduleScreen()
                :
            /// Live Screen
            LiveScreen()
          ],
        );
      },
    );
  }
}




