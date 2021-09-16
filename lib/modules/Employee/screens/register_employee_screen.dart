import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employee/Regsiter_Employee/employee_job_data_screen.dart';
import 'package:hiring_app/modules/Employee/home/home_layout.dart';
import 'package:hiring_app/modules/logins/login_employee_screen.dart';
import 'package:hiring_app/modules/register/cubit/cubit.dart';
import 'package:hiring_app/modules/register/cubit/states.dart';
import 'package:hiring_app/modules/register/employer_register_screen2.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';

class EmployeeRegisterScreen extends StatelessWidget {
  var name = TextEditingController();
  var phoneController = TextEditingController();
  var titleController = TextEditingController();

  var email = TextEditingController();
  var password = TextEditingController();
  var confirm_password = TextEditingController();
  var country = TextEditingController(text: 'Egypt');
  var city = TextEditingController(text: 'Cairo');
  var formKeyEmployee = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return responsiveWidget(
      responsive: (context, deviceInfo) =>
          BlocConsumer<AppRegisterCubit, AppRegisterStates>(
              listener: (context, state) {
        if (state is SignInWithGoogleSuccess) {
          navigateTo(context, HomeLayout());
        } else if (state is SignInWithGoogleError) {}
      }, builder: (context, state) {
        var cubit = AppRegisterCubit.get(context);
        return Form(
          key: formKeyEmployee,
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
                        navigateTo(context, EmployeeLoginScreen());
                      }),
                ],
              ),
              SizedBox(height: 30),
              defaultFormField1(
                  controller: name,
                  validator: (val) {
                    if (name.text.isEmpty) {
                      return 'Invalid Data';
                    } else {
                      return null;
                    }
                  },
                  type: TextInputType.text,
                  label: 'Name'),
              SizedBox(height: 20),
              defaultFormField1(
                  controller: email,
                  validator: (val) {
                    if (email.text.isEmpty) {
                      return 'Invalid Data';
                    } else if (!email.text.contains('@') ||
                        !email.text.contains('.')) {
                      return 'Plz enter valid email';
                    } else {
                      return null;
                    }
                  },
                  type: TextInputType.emailAddress,
                  label: 'Email'),
              SizedBox(height: 20),
              defaultFormField1(
                  controller: password,
                  validator: (val) {
                    if (password.text.isEmpty) {
                      return 'Invalid Data';
                    } else if (password.text.length < 6) {
                      return 'Password is too short';
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
              SizedBox(height: 20),
              defaultFormField1(
                  controller: confirm_password,
                  validator: (val) {
                    if (confirm_password.text != password.text) {
                      return 'Password not match';
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: defaultDropdownButton(
                        label: 'Country',
                        value: 'Egypt',
                        onChanged: (countryValue) 
                        {
                          country.text = countryValue;
                        },
                        items: [
                          DropdownMenuItem<String>(
                            value: 'Egypt',
                            child: Text('Egypt'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Morroco',
                            child: Text('Morroco'),
                          ),
                        ]),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: defaultDropdownButton(
                        label: 'City',
                        value: 'Cairo',
                        onChanged: (cityValue) {
                          city.text = cityValue;
                        },
                        items: [
                          DropdownMenuItem<String>(
                            value: 'Cairo',
                            child: Text('Cairo'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Giza',
                            child: Text('Giza'),
                          ),
                        ]),
                  ),
                ],
              ),
              SizedBox(height: 30),
              defaultButton(
                text: 'Next',
                onPressed: () {
                  if (formKeyEmployee.currentState.validate()) {
                    navigateTo(
                      context,
                      EmployeeJobDataScreen(
                        fullName: name.text,
                        country: country.text,
                        city: city.text,
                        email: email.text,
                        password: password.text,
                      ),
                    );
                  } 
                },
              ),
              SizedBox(height: 40),
              Text('Register faster with'),
              SizedBox(height: 20),
              ConditionalBuilder(
                condition: state is! SignInWithGoogleLoading,
                fallback: (context) {
                  return Builder(
                    builder: (context) =>
                        Center(child: CircularProgressIndicator()),
                  );
                },
                builder: (context) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    borderButtonWithIcon(
                        socialLogo: Image.asset('assets/icons/google.png'),
                        onPressed: () {
                          cubit.signInWithGoogle(context: context);
                        },
                        text: 'Google',
                        width: 110),
                    borderButtonWithIcon(
                        socialLogo: Image.asset('assets/icons/facebook.png'),
                        onPressed: () {},
                        text: 'Facebook',
                        width: 120),
                    borderButtonWithIcon(
                        socialLogo: Image.asset('assets/icons/Phone.png'),
                        onPressed: () {},
                        text: 'Phone',
                        width: 110),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}


