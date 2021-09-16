import 'package:flutter/material.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/modules/Employer/employees_accepted_for_job.dart';
import 'package:hiring_app/modules/Employee/home/home_layout.dart';
import 'package:hiring_app/modules/logins/login_employer_screen.dart';
import 'package:hiring_app/modules/register/register_screen.dart';

class WhoAreYou2Screen extends StatelessWidget {
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
                        isGuest = false;
                        navigateTo(context, RegisterScreen());
                      }),
                  SizedBox(height: 20),
                  borderButton(
                      text: 'Employer',
                      onPressed: () {
                        isEmployee = false;
                        isGuest = false;

                        navigateTo(context, RegisterScreen());
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
