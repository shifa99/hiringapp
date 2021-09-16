import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/modules/Employee/screens/register_employee_screen.dart';
import 'package:hiring_app/modules/Employer/screens/register_screen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: defaultAppBar(context, title: ''),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: isEmployee
              ?
              /// Employee Register
              EmployeeRegisterScreen()
              :
              /// Employer Register
              EmployerRegisterScreen(),
        ),
      ),
    );
  }
}
