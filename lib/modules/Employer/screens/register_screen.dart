import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/logins/login_employer_screen.dart';
import 'package:hiring_app/modules/register/cubit/cubit.dart';
import 'package:hiring_app/modules/register/cubit/states.dart';
import 'package:hiring_app/modules/register/employer_register_screen2.dart';

class EmployerRegisterScreen extends StatelessWidget {
  var controller = TextEditingController();
  var name = TextEditingController();
  var phoneController = TextEditingController();
  var titleController = TextEditingController();

  var email = TextEditingController();
  var password = TextEditingController();
  var confirm_password = TextEditingController();
  var country = TextEditingController();
  var city = TextEditingController();

  var formKeyEmployer = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppRegisterCubit, AppRegisterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppRegisterCubit.get(context);
        return Form(
          key: formKeyEmployer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register',
                style: TextStyle(color: defaultColor, fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account ?'),
                  defaultTextButton(
                      text: 'Log in ',
                      onPressed: () {
                        navigateTo(context, EmployerLoginScreen());
                      }),
                ],
              ),
              const SizedBox(height: 20),
              Text('Company Information'),
              const SizedBox(height: 15),
              defaultFormField1(
                  controller: name,
                  validator: (val) {
                    if (val.length < 3) {
                      return ('Name is too short');
                    } else {
                      return null;
                    }
                  },
                  type: TextInputType.text,
                  label: 'Full Name'),
              const SizedBox(height: 20),
              defaultFormField1(
                  controller: phoneController,
                  validator: (val) {
                    if (val.length != 11) {
                      return ('Not valid number');
                    } else {
                      return null;
                    }
                  },
                  type: TextInputType.phone,
                  label: 'Mobile Number'),
              const SizedBox(height: 20),
              defaultFormField1(
                  controller: titleController,
                  validator: (val) {
                    if (val.length < 3) {
                      return ('Title is too short');
                    } else {
                      return null;
                    }
                  },
                  type: TextInputType.text,
                  label: 'Title'),
              const SizedBox(height: 20),
              defaultFormField1(
                  controller: email,
                  validator: (val) {
                    if (email.text.isEmpty ||
                        !email.text.contains('@') ||
                        !email.text.contains('.')) {
                      return ('Not valid email');
                    } else {
                      return null;
                    }
                  },
                  type: TextInputType.emailAddress,
                  label: 'Email'),
              const SizedBox(height: 20),
              defaultFormField1(
                  controller: password,
                  validator: (val) {
                    if (val.length < 6) {
                      return ('password is too short');
                    } else {
                      return null;
                    }
                  },
                  type: TextInputType.text,
                  label: 'Password',
                  isPassword: cubit.isPassword,
                  icon: IconButton(
                    icon: Icon(cubit.suffix),
                    onPressed: () => cubit.changePassVisibility(),
                  )),
              const SizedBox(height: 20),
              defaultFormField1(
                  controller: confirm_password,
                  validator: (val) {
                    if (confirm_password.text != password.text) {
                      return ('password not match');
                    } else {
                      return null;
                    }
                  },
                  type: TextInputType.text,
                  label: 'Confirm Password',
                  isPassword: cubit.isPassword,
                  icon: IconButton(
                    icon: Icon(cubit.suffix),
                    onPressed: () => cubit.changePassVisibility(),
                  )),
              const SizedBox(height: 50),
              defaultButton(
                text: 'Next',
                onPressed: () {
                  if (formKeyEmployer.currentState.validate()) {
                    navigateTo(
                      context,
                      EmployerRegisterScreen2(
                        fullName: name.text,
                        email: email.text,
                        password: password.text,
                        title: titleController.text,
                        phone: phoneController.text,
                      ),
                    );
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}
