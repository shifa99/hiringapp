import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/employer_cubit.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/states.dart';
import 'package:hiring_app/modules/Employer/home_employee/home_employer_layout.dart';
import 'package:hiring_app/modules/register/cubit/cubit.dart';
import 'package:hiring_app/modules/register/cubit/states.dart';
import 'package:hiring_app/network/local/cache_helper.dart';
import 'package:hiring_app/shared/style/style.dart';
import 'package:intl/intl.dart';

class EmployerRegisterScreen2 extends StatefulWidget {
  final fullName, phone, title, email, password;

  EmployerRegisterScreen2(
      {this.fullName, this.phone, this.title, this.email, this.password});

  @override
  _EmployerRegisterScreen2State createState() =>
      _EmployerRegisterScreen2State();
}

class _EmployerRegisterScreen2State extends State<EmployerRegisterScreen2> {
  var country = TextEditingController();

  var companyName = TextEditingController();

  var city = TextEditingController();

  var businessControl = TextEditingController();

  var establishControl = TextEditingController();

  var websiteControl = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  String selectBusiness;
  String selectedBusiness;

  @override
  Widget build(BuildContext context) 
  {
    var mediaQuery = MediaQuery.of(context).size;
    return BlocConsumer<AppRegisterCubit, AppRegisterStates>(
      listener: (context, state) {
        if (state is AppRegisterSuccessState) {
          tokenEmployer = state.employerRegisterModel.token;
          CacheHelper.saveDate(key: 'tokenEmployer', value: tokenEmployer);
          navigateAndFinish(context, HomeEmployerLayout());
        }
      },
      builder: (context, state) {
        var cubit = AppRegisterCubit.get(context);

        return Scaffold(
          key: scaffoldKey,
          appBar: defaultAppBar(context, title: ''),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      child: Stack(
                        children: [
                          Container(
                            height: 100,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: containerDecoration.copyWith(
                                color: Colors.grey.shade300),
                            child: cubit.logoFile == null
                                ? Center(child: Text('Upload Logo'))
                                : Image.file(
                                    cubit.logoFile,
                                    fit: BoxFit.fill,
                                  ),
                            width: mediaQuery.width * 0.4,
                          ),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: GestureDetector(
                              onTap: () {
                                cubit.chooseLogo();
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 18,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    defaultFormField1(
                      controller: companyName,
                      validator: (val) {
                        if (val.length < 3) {
                          return ('Company Name is too short');
                        } else {
                          return null;
                        }
                      },
                      type: TextInputType.text,
                      label: 'Company Name',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.44,
                          child: defaultFormField1(
                            controller: country,
                            validator: (val) {
                              if (country.text.isEmpty) {
                                return ('Invalid data');
                              } else {
                                return null;
                              }
                            },
                            type: TextInputType.text,
                            label: 'Country',
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            child: defaultFormField1(
                              controller: city,
                              validator: (val) {
                                if (city.text.isEmpty) {
                                  return ('Invalid data');
                                } else {
                                  return null;
                                }
                              },
                              onTap: () {},
                              type: TextInputType.text,
                              label: 'City',
                              // icon: Icon(Icons.arrow_drop_down)
                            )),
                      ],
                    ),
                    const SizedBox(height: 20),
                   
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[100]),
                      child: ListTile(
                        title: Text('Business'),
                        trailing: new DropdownButton<String>(
                            hint: Container(
                                width: MediaQuery.of(context).size.width * 0.28,
                                child: Text('choose')),
                            onChanged: (String changedValue) {
                              setState(() {
                                selectBusiness = changedValue;
                                switch (selectBusiness) {
                                  case 'IT':
                                    selectedBusiness = '1';
                                    break;
                                  case 'Medical':
                                    selectedBusiness = '2';
                                    break;
                                }

                                print('selectedBusiness : ' + selectedBusiness);
                              });
                            },
                            value: selectBusiness,
                            underline: Text(''),
                            items: <String>[
                              'IT',
                              'Medical',
                            ].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList()),
                      ),
                    ),
                    const SizedBox(height: 20),
                    defaultFormField1(
                      onTap: () async {
                        await showDatePicker(
                                context: context,
                                initialDate: DateTime(2010),
                                firstDate: DateTime(2010),
                                lastDate: DateTime.now())
                            .then((value) {
                          if (value != null)
                            establishControl.text = DateFormat('yyyy-MM-dd').format(value);
                          else
                            establishControl.text =
                             DateFormat('yyyy-MM-dd').format( DateTime.now());
                        });
                      },
                      controller: establishControl,
                      validator: (val) {
                        if (establishControl.text.isEmpty) {
                          return ('Invalid date');
                        } else {
                          return null;
                        }
                      },
                      type: TextInputType.number,
                      label: 'Established at',
                    ),
                    const SizedBox(height: 20),
                    defaultFormField1(
                      controller: websiteControl,
                      validator: (val) {
                        if (websiteControl.text.isEmpty) {
                          return ('Invalid data');
                        } else {
                          return null;
                        }
                      },
                      type: TextInputType.text,
                      label: 'Website',
                    ),
                    const SizedBox(height: 20),
                    ConditionalBuilder(
                      condition: state is! AppRegisterLoadingState,
                      fallback: (context) => buildCircularProgressIndicator(),
                      builder: (context) => defaultButton(
                        text: 'Finish',
                        onPressed: () {
                          if (formKey.currentState.validate()) 
                          {
                            print('sfdfs : $selectedBusiness ');
                            if (cubit.logoFile != null) {
                              cubit.registerEmployer(
                                fullName: widget.fullName,
                                email: widget.email,
                                password: widget.password,
                                confirmPassword: widget.password,
                                title: widget.title,
                                mobile_number1: widget.phone,
                                country: country.text,
                                city: city.text,
                                business: selectedBusiness,
                                company_name: companyName.text,
                                established_at: establishControl.text,
                                mobile_number2: '213121221',
                                website: websiteControl.text,
                              );

                               navigateTo(context, HomeEmployerLayout());

                            } else {
                              print('select logo');
                            }
                          } else {}
                        },
                      ),
                    ),
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
