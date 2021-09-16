import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employee/home/home_layout.dart';
import 'package:hiring_app/modules/register/cubit/cubit.dart';
import 'package:hiring_app/modules/register/cubit/states.dart';
import 'package:toast/toast.dart';

class ResetPasswordEmployeeScreen extends StatelessWidget {
  var email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppRegisterCubit, AppRegisterStates>(
      listener: (context, state) {
        if (state is SignInWithGoogleSuccess) {
          navigateTo(context, HomeLayout());
        } else if (state is SignInWithGoogleError) {
          Toast.show('Error E', context);
        }
      },
      builder: (context, state) {
        var cubit = AppRegisterCubit.get(context);
        var formKey = GlobalKey<FormState>();
        return Scaffold(
          appBar: defaultAppBar(context, title: 'Reset Password'),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formKey,
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        'Enter Your Email',
                        style: TextStyle(color: defaultColor, fontSize: 20),
                      ),
                      SizedBox(height: 30),
                      defaultFormField1(
                          controller: email,
                          validator: (val) {
                            if(val.isEmpty){
                              return 'please enter your email';
                            }else if(!val.contains('@') || !val.contains('.')){
                              return 'please enter valid email';
                            }else{
                              return null ;
                            }
                          },
                          type: TextInputType.emailAddress,
                          label: 'Email',),
                      SizedBox(height: 30),
                      defaultButton(text: 'Continue', onPressed: (){
                        if(formKey.currentState.validate()){
                          print('${email.text}');
                        }else{
                          print('Invalid Email ..');
                        }

                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
