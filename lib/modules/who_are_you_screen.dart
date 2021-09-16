import 'package:flutter/material.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/modules/Employer/employees_accepted_for_job.dart';
import 'package:hiring_app/modules/Employee/home/home_layout.dart';
import 'package:hiring_app/modules/logins/login_employer_screen.dart';

import 'logins/login_employee_screen.dart';

class WhoAreYouScreen extends StatelessWidget {
  const WhoAreYouScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  Text('Welcome', style: TextStyle(fontSize: 30)),
                  SizedBox(height: 20),
                  Text('You are ...',
                      style: TextStyle(color: defaultColor, fontSize: 22)),
                  SizedBox(height: 50),
                  borderButton(
                      text: 'Employee',
                      onPressed: () {
                        isEmployee = true;
                        isEmployer = false;

                        isGuest = false;
                        navigateTo(context, EmployeeLoginScreen());
                      }),
                  SizedBox(height: 20),
                  borderButton(
                      text: 'Employer',
                      onPressed: () {
                        isEmployee = false;
                        isGuest = false;
                        isEmployer = true;
                        // navigateTo(context, EmployeeJobSummaryScreen4());
                        navigateTo(context, EmployerLoginScreen());
                        // navigateTo(context, HomeLayout());
                      }),
                  SizedBox(height: 20),
                  borderButton(
                      text: 'Guest',
                      onPressed: () {
                        isEmployee = false;
                        isGuest = true;
                        isEmployer = false;

                        navigateTo(context, HomeLayout());
                      }),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
