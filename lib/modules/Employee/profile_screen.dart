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

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var controller = TextEditingController();
  var language = 'English';
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
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getProfile(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            nameController.text = cubit.employeeProfileModel.employee == null
                ? 'loading'
                : cubit.employeeProfileModel.employee.fullName;
            qaController.text = cubit.employeeProfileModel.employee == null
                ? 'loading'
                : cubit.employeeProfileModel.employee.qualification;
            emailController.text = cubit.employeeProfileModel.employee == null
                ? 'loading'
                : cubit.employeeProfileModel.employee.email;
            graduationYearController.text =
                cubit.employeeProfileModel.employee == null
                    ? 'loading'
                    : '${cubit.employeeProfileModel.employee.graduationYear}';

            cityController.text = cubit.employeeProfileModel.employee == null
                ? 'loading'
                : cubit.employeeProfileModel.employee.city;
            countryController.text = cubit.employeeProfileModel.employee == null
                ? 'loading'
                : cubit.employeeProfileModel.employee.country;
            datebirthController.text =
                cubit.employeeProfileModel.employee == null
                    ? 'loading'
                    : cubit.employeeProfileModel.employee.birth;
            studyfieldController.text =
                cubit.employeeProfileModel.employee == null
                    ? 'loading'
                    : cubit.employeeProfileModel.employee.studyField;
            universityController.text =
                cubit.employeeProfileModel.employee == null
                    ? 'loading'
                    : cubit.employeeProfileModel.employee.university;
            return ConditionalBuilder(
              condition: state is! GetEmployeeProfileLoadingState,
              fallback: (context) =>
                  Scaffold(body: buildCircularProgressIndicator()),
              builder: (context) => Scaffold(
                appBar: defaultAppBar1(context,
                    title: 'Personal Profile', actionWidget: Container()),
                body: SingleChildScrollView(
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
                                                qualification:
                                                    qaController.text,
                                                university:
                                                    universityController.text,
                                                studyField:
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
                                                qualification:
                                                    qaController.text,
                                                university:
                                                    universityController.text,
                                                studyField:
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
                                        controller: graduationYearController,
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
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Wrap(
                                        spacing: 10.0,
                                        runSpacing: 10.0,
                                        children: cubit.employeeProfileModel
                                            .employee.skills
                                            .map(
                                              (e) => buildSkill1(
                                                  text:
                                                      '${cubit.employeeProfileModel.employee.skills[0]}'),
                                            )
                                            .toList(),
                                        /*  children: [
                                      buildSkill1(text: 'UI/UX'),
                                      buildSkill1(text: 'Web design'),
                                      buildSkill1(text: 'Mobile developer'),
                                      buildSkill1(text: 'UI/UX'),
                                      buildSkill1(text: 'Tester'),
                                      buildSkill1(text: 'Mobile developer'),
                                    ],*/
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: defaultButton(
                                        text: 'Add',
                                        onPressed: () {},
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
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
                                            color:
                                                defaultColor.withOpacity(0.15),
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
                ),
              ),
            );
          }),
    );
  }
}
