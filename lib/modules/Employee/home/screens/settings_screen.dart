import 'dart:ui';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/modules/Employee/home/cubit/cubit.dart';
import 'package:hiring_app/modules/Employee/home/cubit/states.dart';
import 'package:hiring_app/modules/logins/login_employer_screen.dart';
import 'package:hiring_app/modules/register/cubit/cubit.dart';
import 'package:hiring_app/modules/register/cubit/states.dart';
import 'package:hiring_app/modules/services/logout.dart';
import 'package:hiring_app/modules/who_are_you2_screen.dart';
import 'package:hiring_app/network/end_points.dart';
import 'package:hiring_app/network/local/cache_helper.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';

import '../../../Employer/employer_profile_screen.dart';
import '../../../who_are_you_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var language = 'English';
  var controller = TextEditingController();
  var nameController = TextEditingController();
  var countryController = TextEditingController();
  var cityController = TextEditingController();
  var number1Controller = TextEditingController();
  var number2Controller = TextEditingController();

  var emailController = TextEditingController();
  var datebirthController = TextEditingController();

  var universityController = TextEditingController();
  var studyfieldController = TextEditingController();
  var graduationYearController = TextEditingController();

  var qaController = TextEditingController();

  var ckeckValue = false;
  var changeName = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is SignOutWithGoogleSuccess) {
          navigateTo(context, EmployerLoginScreen());
        } else {}
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
       if(!isGuest) {
          nameController.text =
              cubit.employeeProfileModel.employee.fullName ?? '';
          qaController.text =
              cubit.employeeProfileModel.employee.qualification ?? '';
          emailController.text =
              cubit.employeeProfileModel.employee.email ?? '';

          cityController.text = cubit.employeeProfileModel.employee.city ?? '';
          countryController.text =
              cubit.employeeProfileModel.employee.country ?? '';
          datebirthController.text =
              cubit.employeeProfileModel.employee.birth ?? '';
          studyfieldController.text =
              cubit.employeeProfileModel.employee.studyField ?? '';
          universityController.text =
              cubit.employeeProfileModel.employee.university ?? '';
        }
        // graduationYearController.text =  int.parse(cubit.employeeProfileModel.employee.graduationYear.toString())??'';

        return isGuest
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Image.asset('assets/icons/notUser.png'),
                      SizedBox(height: 20),
                      Text(
                        'Guest User',
                        style: TextStyle(color: defaultColor, fontSize: 22),
                      ),
                      SizedBox(height: 20),
                      defaultButton(
                          text: 'Login',
                          onPressed: () {
                            navigateTo(context, EmployerLoginScreen());
                          },
                          height: 60.0),
                      SizedBox(height: 20),
                      borderButton(
                          onPressed: () {
                            navigateTo(context, WhoAreYou2Screen());
                          },
                          text: 'CREATE ACCOUNT')
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 50),

                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(cubit.employeeProfileModel.employee
                            .image),
                      ),
                      SizedBox(height: 20),
                      Text(
                        cubit.employeeProfileModel.employee
                            .fullName == null
                            ? 'loading..'
                            : '${cubit.employeeProfileModel.employee
                            .fullName}',
                        // '${cubitReg.loginModel.data.name}'
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 45,
                        child: ListTile(
                          title: Text(
                            'Language',
                            style: TextStyle(color: defaultColor),
                          ),
                          trailing: new DropdownButton<String>(
                              hint: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.28,
                                  child: Text('choose')),
                              onChanged: (String changedValue) {
                                setState(() {
                                  language = changedValue;
                                  print('Language : ' + language);
                                });
                              },
                              value: language,
                              underline: Text(''),
                              items: <String>[
                                'English',
                                'عربي',
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(
                                    value,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                );
                              }).toList()),
                        ),
                      ),
                      SizedBox(height: 50),
                      ConditionalBuilder(
                        condition: state is! SignOutWithGoogleLoading,
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator(),)
                        ,
                        builder: (context) => defaultButton(
                            text: 'LOGOUT',
                            onPressed: () {
                              print('lol :$tokenEmployee');

                              CacheHelper.removeData(key: 'tokenEmployee');
                              navigateAndFinish(context, WhoAreYouScreen());
                              tokenEmployee = '';
                              print('token $tokenEmployee');

                              // cubitReg.signOut(context: context);
                            },
                            height: 50.0),
                      ),
                    ],
                  ),
                ),
              );
           /* SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .8,
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.95),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * .75,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 60,
                                  ),

                                  Center(
                                    child: Text(
                                      cubit.employeeProfileModel.employee
                                          .fullName,
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  myDivider(context),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildHeadLine(
                                          title: '\n About job Title \n'),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            print(changeName);
                                            // if (changeName == false) {
                                            cubit.updateEmployeeProfile(
                                              fullName: nameController.text,
                                              qualification: qaController.text,
                                              university:
                                                  universityController.text,
                                              study_field:
                                                  studyfieldController.text,
                                              email: emailController.text,
                                              city: cityController.text,
                                              country: countryController.text,
                                            );
                                            // }
                                            changeName = !changeName;
                                            print(changeName);
                                          });
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  defaultFormField1(
                                    controller: nameController,
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return 'Invalid data';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSubmit: (val) {
                                      // setState(() {
                                      //   changeName = !changeName;
                                      // });
                                    },
                                    type: TextInputType.text,
                                    label: 'Name',
                                    enabled: changeName,
                                  ),

                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.42,
                                          child: defaultFormField1(
                                            controller: countryController,
                                            validator: (val) {},
                                            type: TextInputType.text,
                                            label: 'Country',
                                            enabled: changeName,
                                          )),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.42,
                                          child: defaultFormField1(
                                            controller: cityController,
                                            validator: (val) {},
                                            type: TextInputType.text,
                                            label: 'City',
                                            enabled: changeName,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  defaultFormField1(
                                      controller: number2Controller,
                                      validator: (val) {},
                                      type: TextInputType.text,
                                      enabled: changeName,
                                      label: 'Contact Number'),
                                  const SizedBox(height: 10),
                                  defaultFormField1(
                                      controller: number2Controller,
                                      validator: (val) {},
                                      type: TextInputType.text,
                                      enabled: changeName,
                                      label: 'Additional contact number'),
                                  const SizedBox(height: 10),
                                  defaultFormField1(
                                      controller: emailController,
                                      validator: (val) {},
                                      type: TextInputType.text,
                                      enabled: changeName,
                                      label: 'Email'),
                                  const SizedBox(height: 10),
                                  defaultFormField1(
                                      controller: datebirthController,
                                      validator: (val) {},
                                      type: TextInputType.text,
                                      enabled: changeName,
                                      label: 'Date of Birth'),
                                  const SizedBox(height: 10),
                                  defaultFormField1(
                                      controller: controller,
                                      validator: (val) {},
                                      type: TextInputType.text,
                                      enabled: changeName,
                                      label: 'Gender'),
                                  const SizedBox(height: 10),
                                  defaultFormField1(
                                      controller: controller,
                                      validator: (val) {},
                                      type: TextInputType.text,
                                      enabled: changeName,
                                      label: 'State'),
                                  const SizedBox(height: 10),
                                  ListTile(
                                    title: Text('Driving license  '),
                                    trailing: Checkbox(
                                      value: ckeckValue,
                                      onChanged: (val) {
                                        setState(() {
                                          ckeckValue = val;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  myDivider(context),

                                  /// Qualifications Information
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildHeadLine(
                                          title:
                                              '\n Qualifications Information \n'),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            print(changeName);

                                            changeName = !changeName;
                                            // if (changeName == false) {
                                            cubit.updateEmployeeProfile(
                                              fullName: nameController.text,
                                              qualification: qaController.text,
                                              university:
                                                  universityController.text,
                                              study_field:
                                                  studyfieldController.text,
                                              email: emailController.text,
                                              city: cityController.text,
                                              country: countryController.text,
                                            );
                                            // }
                                            print(changeName);
                                          });
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  defaultFormField1(
                                      controller: studyfieldController,
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'Invalid data';
                                        } else {
                                          return null;
                                        }
                                      },
                                      type: TextInputType.text,
                                      enabled: changeName,
                                      label: 'Study field'),
                                  const SizedBox(height: 10),
                                  defaultFormField1(
                                      controller: universityController,
                                      validator: (val) {},
                                      type: TextInputType.text,
                                      enabled: changeName,
                                      label: 'University/Institution'),
                                  const SizedBox(height: 10),
                                  defaultFormField1(
                                      controller: controller,
                                      validator: (val) {},
                                      type: TextInputType.text,
                                      enabled: changeName,
                                      label: 'Faculty'),
                                  const SizedBox(height: 10),
                                  defaultFormField1(
                                      controller: controller,
                                      validator: (val) {},
                                      type: TextInputType.text,
                                      enabled: changeName,
                                      label: 'Graduation Year'),
                                  const SizedBox(height: 10),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: defaultButton(
                                      text: 'Add',
                                      onPressed: () {},
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  myDivider(context),

                                  /// Work Information
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildHeadLine(
                                          title: '\n Work Information \n'),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                        iconSize: 20,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  buildRowJobDetailsEmployer(context,
                                      title: 'Industry\n',
                                      job: 'It and programing\n'),
                                  buildRowJobDetailsEmployer(context,
                                      title: 'Job title\n',
                                      job:
                                          '${cubit.employeeProfileModel.employee.title}\n'),
                                  buildRowJobDetailsEmployer(context,
                                      title: 'Experience\n',
                                      job:
                                          '${cubit.employeeProfileModel.employee.graduationYear}\n'),
                                  const SizedBox(height: 10),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: defaultButton(
                                      text: 'Add',
                                      onPressed: () {},
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  myDivider(context),

                                  /// SKILLS
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildHeadLine(title: '\n SKILLS \n'),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                        iconSize: 20,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Wrap(
                                      spacing: 10.0,
                                      runSpacing: 10.0,
                                      children: [
                                        buildSkill1(text: 'UI/UX'),
                                        buildSkill1(text: 'Web design'),
                                        buildSkill1(text: 'Mobile developer'),
                                        buildSkill1(text: 'UI/UX'),
                                        buildSkill1(text: 'Tester'),
                                        buildSkill1(text: 'Mobile developer'),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: defaultButton(
                                      text: 'Add',
                                      onPressed: () {},
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  myDivider(context),

                                  /// Langauges
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildHeadLine(title: '\n Langauges \n'),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                        iconSize: 20,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Wrap(
                                      spacing: 10.0,
                                      runSpacing: 10.0,
                                      children: cubit.employeeProfileModel
                                          .employee.languages
                                          .map(
                                            (e) => buildSkill1(
                                                text:
                                                    '${cubit.employeeProfileModel.employee.languages}'),
                                          )
                                          .toList(),
                                    ),
                                  ),

                                  const SizedBox(height: 10),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: defaultButton(
                                      text: 'Add',
                                      onPressed: () {},
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  myDivider(context),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.42,
                                        child: TextButton(
                                          onPressed: () {
                                            // navigateTo(context, HomeEmployerLayout());
                                          },
                                          child: Image.asset(
                                            'assets/images/btn11.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.42,
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Image.asset(
                                            'assets/images/btn22.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: defaultColor.withOpacity(0.15),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: defaultColor
                                                  .withOpacity(0.5))),
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          Icon(Icons.add),
                                          SizedBox(width: 16),
                                          Text(
                                            'UPLOAD YOUR CV',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                cubit.employeeProfileModel.employee.image)),
                      ),
                    ],
                  ),
                ),
              )*/

      },
    );
  }
}
