import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/modules/Employee/home/cubit/cubit.dart';
import 'package:hiring_app/modules/Employee/home/cubit/states.dart';
import 'package:hiring_app/modules/Employee/job_details_screen.dart';
import 'package:hiring_app/modules/Employee/under_progress_screen.dart';
import 'package:hiring_app/modules/Employer/home_employee/screens/home_employer_screen/build_row_view_all.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return responsiveWidget(responsive: (context,deviceInfo)=>
       BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppSuccessHomeDataState) {
            print('----------Done-------------');
          } else if (state is AppErrorHomeDataState) {
            print('----------Error-------------');
            print(state.error);
          }
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                 
               !isGuest?  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Vodafone',
                                style: TextStyle(
                                    color: defaultColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'iOS developer',
                              ),
                              SizedBox(height: 5),
                              Text(
                                '5+ years experience',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '21-12-2021',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 10),
                              // defaultButton(
                              //     text: 'LIVE NOW',
                              //     onPressed: () {
                              //       isGuest
                              //           ? Toast.show('Login First', context)
                              //           : navigateTo(
                              //               context, UnderProgressScreen());
                              //     },
                              //     width: MediaQuery.of(context).size.width * 0.4)
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 50,
                              ),
                              SizedBox(height: 5),
                              Text(
                                '13 min 30 sec',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ):Container(),
                  SizedBox(height: 20),
                    buildRowviewAll(deviceInfo: deviceInfo, label: 'Jobs by Category', onPressed: (){}),

                  SizedBox(height: 20),
                  Container(
                    height: 80,
                    child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Computers/IT',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    '120 Jobs',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 20),
                    buildRowviewAll(deviceInfo: deviceInfo, label: 'Jobs', onPressed: (){}),
                
                  SizedBox(height: 20),
                  !isGuest
                      ? ((cubit.homeEmployeeModel.jobs != null&&cubit.homeEmployeeModel.jobs.isNotEmpty)
                          ? GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: cubit.homeEmployeeModel.jobs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                  
                                    navigateTo(
                                        context,
                                        JobDetailsScreen(
                                          id: cubit
                                              .homeEmployeeModel.jobs[index].id,
                                        ));
                                  },
                                  child:buildWidgetAuthorJob(context: context, deviceInfo: deviceInfo, authorJob: cubit.homeEmployeeModel.jobs[index])
                                );
                              })
                          : Container(
                              child: Center(child: Text('No Jobs Available!'))))
                      : ((cubit.homeGuestModel.jobs != null)
                      ? GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // mainAxisExtent: deviceInfo.screenHeight*0.32,
                        mainAxisSpacing: 2,

                      ),
                      itemCount: cubit.homeGuestModel.jobs.length,
                      shrinkWrap: true,

                      itemBuilder: (context, index) {
                        return GestureDetector(
                         
                          onTap: () {
                            navigateTo(
                                context,
                                JobDetailsScreen(
                                  id: cubit
                                      .homeGuestModel.jobs[index].id,
                                ));
                          },
                        child:buildWidgetAuthorJob(context: context, deviceInfo: deviceInfo, authorJob: cubit.homeGuestModel.jobs[index])
                        );
                      })
                      : Container(
                      child: Center(child: Text('No Jobs Available!')))),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
