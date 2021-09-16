import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/modules/Employee/home/home_layout.dart';
import 'package:hiring_app/modules/Employee/reset_password/reset_password_screen.dart';
import 'package:hiring_app/modules/logins/login_in_phone.dart';
import 'package:hiring_app/modules/register/cubit/cubit.dart';
import 'package:hiring_app/modules/register/cubit/states.dart';
import 'package:hiring_app/modules/who_are_you2_screen.dart';
import 'package:hiring_app/network/local/cache_helper.dart';
import 'package:toast/toast.dart';

class EmployeeLoginScreen extends StatelessWidget {
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppRegisterCubit, AppRegisterStates>(
      listener: (context, state) {
        if (state is SignInEmployeeSuccessState) {
          CacheHelper.saveDate(key: 'tokenEmployee', value: tokenEmployee);
          navigateAndFinish(context, HomeLayout());
        } else if (state is SignInEmployeeLoadingState) {}
        if (state is SignInWithGoogleSuccess) {
          navigateTo(context, HomeLayout());
        } else if (state is SignInWithGoogleError) {
          Toast.show('Error E', context);
        }
      },
      builder: (context, state) {
        var cubit = AppRegisterCubit.get(context);
        return Scaffold(
          appBar: defaultAppBar(context, title: ''),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(color: defaultColor, fontSize: 30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account ?'),
                        TextButton(
                            onPressed: () {
                              // navigateTo(context, RegisterScreen());
                              navigateTo(context, WhoAreYou2Screen());
                            },
                            child: Text('Register here'))
                      ],
                    ),
                    SizedBox(height: 20),
                    defaultFormField1(
                        controller: email,
                        validator: (email) {
                          if (email.isEmpty) return 'Please Enter Your Email';
                          return null;
                        },
                        type: TextInputType.emailAddress,
                        label: 'Email'),
                    SizedBox(height: 20),
                    defaultFormField1(
                        controller: password,
                        validator: (password) {
                          if (password.isEmpty)
                            return 'Please Enter Your Password';
                          else if (password.length < 6)
                            return 'Password is Short';
                          return null;
                        },
                        onSubmit: (passwordValue) async {
                          if (formKey.currentState.validate()) {
                            await cubit.loginEmployee(
                                email: email.text, pass: password.text);
                          }
                        },
                        type: TextInputType.visiblePassword,
                        label: 'Password',
                        isPassword: true,
                        icon: Icon(Icons.remove_red_eye)),
                    TextButton(
                        onPressed: () {
                          print('lol');
                          if (isEmployee)
                            navigateTo(context, ResetPasswordEmployeeScreen());
                        },
                        child: Text('Forget Password?')),
                    const SizedBox(height: 30),
                    ConditionalBuilder(
                      condition: state is! SignInEmployeeLoadingState,
                      fallback: (context) => buildCircularProgressIndicator(),
                      builder: (context) => defaultButton(
                        text: 'Login',
                        onPressed: () async {
                          if (formKey.currentState.validate()) {
                            print('${email.text}/${password.text}');
                            await cubit.loginEmployee(
                                email: email.text, pass: password.text);
                          }
                          // navigateTo(context, HomeLayout());
                          //    navigateTo(context, HomeEmployerLayout());
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    if (isEmployee) Text('Or Login Using'),
                    if (isEmployee) SizedBox(height: 20),
                    if (isEmployee)
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
                            Expanded(
                              child: borderButtonWithIcon(
                                socialLogo:
                                    Image.asset('assets/icons/google.png'),
                                onPressed: () {
                                  cubit.signInWithGoogle(context: context);
                                },
                                text: 'Google',
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: borderButtonWithIcon(
                                socialLogo:
                                    Image.asset('assets/icons/facebook.png'),
                                onPressed: () {
                                  print('Facebook');

                                  // Authentication.signInWithFacebook();
                                },
                                text: 'Facebook',
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: borderButtonWithIcon(
                                socialLogo:
                                    Image.asset('assets/icons/Phone.png'),
                                onPressed: () {
                                  print('Phone');
                                  navigateTo(context, LoginWithPhoneNumber());
                                },
                                text: 'Phone',
                              ),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
