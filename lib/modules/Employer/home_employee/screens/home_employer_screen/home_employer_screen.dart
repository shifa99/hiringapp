import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/employer_cubit.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/states.dart';
import 'package:hiring_app/modules/Employer/home_employee/screens/home_employer_screen/build_row_view_all.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:hiring_app/shared/style/style.dart';
import '../../../job_details_employer_screen.dart';
import 'create_new_job_widget.dart';

class HomeEmployerScreen extends StatefulWidget {
  @override
  _HomeEmployerScreenState createState() => _HomeEmployerScreenState();
}

class _HomeEmployerScreenState extends State<HomeEmployerScreen> {
  var language;

  @override
  Widget build(BuildContext context) {
    return responsiveWidget(responsive: (context, deviceInfo) {
      double spaceBetweenChildren = deviceInfo.screenHeight * 0.04;
      return BlocConsumer<AppEmployerCubit, AppEmployerStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppEmployerCubit.get(context);
          return ConditionalBuilder(
            condition: state is! GetEmployerHomeDataLoadingState,
            fallback: (context) => buildCircularProgressIndicator(),
            builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(height: spaceBetweenChildren),
                  
                    Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: deviceInfo.screenHeight * 0.119,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'You have Room starts in  ',
                                          style: secondaryTextStyle(deviceInfo),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        'Senior iOS developer',
                                        style: thirdTextStyle(deviceInfo)
                                            .copyWith(color: defaultColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              //   Spacer(),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: deviceInfo.screenwidth * 0.06,
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
                      ),
                    ),
                    SizedBox(height: spaceBetweenChildren),
                    buildRowviewAll(deviceInfo: deviceInfo, label: 'My Jobs', onPressed: (){}),
                    SizedBox(height: spaceBetweenChildren),
                    cubit.homeEmployerModel.myJob!=null&&cubit.homeEmployerModel.myJob.length!=0
                        ? Container(
                            height: deviceInfo.screenHeight*0.2,
                            width: double.infinity,
                            child: ListView.builder(
                                itemCount: cubit.homeEmployerModel.myJob.length,
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // navigateTo(context,
                                          //     JobDetailsEmployerScreen(cubit.homeEmployerModel.myJob[index]));
                                        },
                                        child: Container(
                                  width: deviceInfo.screenwidth*0.45,
                                          child: Card(
                                            elevation: 4,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 10),
                                                  Text(
                                                    '${cubit.homeEmployerModel.myJob[index].title}',
                                                    style:secondaryTextStyle(deviceInfo),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    'experience: ${cubit.homeEmployerModel.myJob[index].experience}',
                                                    style:
                                                       thirdTextStyle(deviceInfo),
                                                  ),
                                                  Text(
                                                    '${cubit.homeEmployerModel.myJob[index].meetingDate}',
                                                    style:
                                                       thirdTextStyle(deviceInfo),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    '${cubit.homeEmployerModel.myJob[index].status == '1' ? 'Active' : cubit.homeEmployerModel.myJob[index].status == '2' ? 'Closed' : 'Canceled'}',
                                                    style:
                                                        thirdTextStyle(deviceInfo).copyWith(
                                                          color: cubit.homeEmployerModel.myJob[index].status == '1' ?Colors.green:Colors.red,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 3,
                                        right: 25,
                                        child: Container(
                                          height: 20,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(15),
                                                  bottomLeft:
                                                      Radius.circular(15)),
                                              color: Colors.black12),
                                          child: CircleAvatar(
                                            radius: 3,
                                            backgroundColor: cubit
                                                        .homeEmployerModel
                                                        .myJob[index]
                                                        .status ==
                                                    '1'
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          )
                        : Text(
                            'No Available Jobs Now',
                            style: secondaryTextStyle(deviceInfo),
                            textAlign: TextAlign.center,
                          ),
                    SizedBox(height: spaceBetweenChildren),
                    buildRowviewAll(deviceInfo: deviceInfo, label: 'Jobs', onPressed: (){}),
                    SizedBox(height: spaceBetweenChildren),
                    createNewJobWidget(
                        deviceInfo: deviceInfo,
                        context: context,
                        onPressed: () {}),
                    SizedBox(height: spaceBetweenChildren),
                    cubit.homeEmployerModel.authorJobs!=null&&cubit.homeEmployerModel.authorJobs.length!=0?
                      GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: cubit.homeEmployerModel.authorJobs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return buildWidgetAuthorJob(context: context, deviceInfo: deviceInfo, authorJob: cubit.homeEmployerModel.authorJobs[index]);
                          }):Text(
                            'No Available Jobs Now',
                            style: secondaryTextStyle(deviceInfo),
                            textAlign: TextAlign.center,
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}

