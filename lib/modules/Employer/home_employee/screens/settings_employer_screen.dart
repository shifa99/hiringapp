import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/employer_cubit.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/states.dart';
import 'package:hiring_app/modules/who_are_you_screen.dart';
import 'package:hiring_app/network/local/cache_helper.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:hiring_app/shared/style/style.dart';

import '../../employer_profile_screen.dart';

class ProfileEmployerScreen extends StatefulWidget {
  @override
  _ProfileEmployerScreenState createState() => _ProfileEmployerScreenState();
}

class _ProfileEmployerScreenState extends State<ProfileEmployerScreen> {
  var language = 'English';

  @override
  Widget build(BuildContext context) {
    return responsiveWidget(responsive: (context,deviceInfo)=>
       BlocConsumer<AppEmployerCubit, AppEmployerStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppEmployerCubit.get(context);
          return /* Padding(
                  padding: const EdgeInsets.only(top: 80, right: 16, left: 16),
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          // color: Colors.red,
                          child: Card(
                            margin: EdgeInsets.only(top: 60,bottom: 30),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(height: 50),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Company name\n'),
                                          Text('Country\n'),
                                          Text('City\n'),
                                          Text('Business\n'),
                                          Text('Manager\n'),
                                          Text('Mobile Number\n'),
                                          Text('Website\n'),
                                        ],
                                      ),
                                      SizedBox(width: 50),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Vodafone\n',
                                            style: TextStyle(color: defaultColor),
                                          ),
                                          Text(
                                            'Egypt\n',
                                            style: TextStyle(color: defaultColor),
                                          ),
                                          Text(
                                            'Cairo\n',
                                            style: TextStyle(color: defaultColor),
                                          ),
                                          Text(
                                            'Software\n',
                                            style: TextStyle(color: defaultColor),
                                          ),
                                          Text(
                                            'Amr Eltohamy\n',
                                            style: TextStyle(color: defaultColor),
                                          ),
                                          Text(
                                            '01234567890\n',
                                            style: TextStyle(color: defaultColor),
                                          ),
                                          Text(
                                            'www.vodafone.com\n',
                                            style: TextStyle(color: defaultColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: MediaQuery.of(context).size.width * 0.2,
                          left: MediaQuery.of(context).size.width * 0.2,
                          child: Image.asset(
                            'assets/images/vodafone.png',
                          ),
                        ),
                        Positioned(
                          top: 100,
                          right: MediaQuery.of(context).size.width * 0.25,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.add),
                          ),
                        ),
                        Positioned(
                            bottom: 10,
                            left: MediaQuery.of(context).size.width * 0.05,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: defaultColor,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.edit_outlined,color: Colors.white,),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                );*/
              SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: cubit.employerProfileModel.employee != null
                  ? Column(
                      children: [
                        SizedBox(height: 50),
                        InkWell(
                            onTap: () {
                              navigateTo(context, EmployerProfileScreen());
                            },
                            child: Container(
                               height:
                                        deviceInfo.screenHeight * 0.28,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(height: deviceInfo.screenHeight*0.28,),
                                  Container(
                                    height:
                                        deviceInfo.screenHeight * 0.2,
                                    width: double.infinity,
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                                cubit.employerProfileModel.employee
                                                    .companyName,
                                                style: primaryTextStyle(deviceInfo).copyWith(color: defaultColor),
                                                
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.topCenter,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        cubit.employerProfileModel.employee.image,
                                        height: deviceInfo.screenHeight*0.2,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
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
                        )
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(height: 50),
                        defaultButton(text: 'Logout', onPressed: () {
                          CacheHelper.removeData(key: 'tokenEmployer');
                          navigateAndFinish(context, WhoAreYouScreen());
                        },),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
