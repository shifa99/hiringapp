import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/employer_cubit.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/states.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:hiring_app/shared/style/style.dart';

class EmployerProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppEmployerCubit()..getProfile(),
      child: responsiveWidget(
        responsive: (context, deviceInfo) =>
            BlocConsumer<AppEmployerCubit, AppEmployerStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppEmployerCubit.get(context);
            return Scaffold(
              appBar: defaultAppBar1(
                context,
                title: 'profile',
                actionWidget: TextButton(
                  onPressed: () async 
                  {
                 await   cubit.logoutEmployer(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body:
             state is GetEmployerProfileLoadingState?loadingProgress():state is GetEmployerProfileErrorState?Center(child: Text('Some Errors Appear',
             style: primaryTextStyle(deviceInfo).copyWith(color: Colors.red),),):
               SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80, right: 16, left: 16),
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: cubit.employerProfileModel.employee != null
                        ? Container(
                          height: deviceInfo.screenHeight*0.66,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(height: deviceInfo.screenHeight*0.67,),
                                Container(
                                  height:
                                      deviceInfo.screenHeight * 0.60,
                                  // color: Colors.red,
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            const SizedBox(height: 50),
                                            buildRowJobDetailsEmployer(
                                              context,
                                              title: 'Company name\n',
                                              job:
                                                  '${cubit.employerProfileModel.employee.companyName}\n',
                                            ),
                                            buildRowJobDetailsEmployer(
                                             context,
                                              title: 'Country\n',
                                              job:
                                                  '${cubit.employerProfileModel.employee.country}\n',
                                            ),
                                            buildRowJobDetailsEmployer(
                                              context,
                                              title: 'City\n',
                                              job:
                                                  '${cubit.employerProfileModel.employee.city}\n',
                                            ),
                                            buildRowJobDetailsEmployer(
                                              context,
                                              title: 'Business\n',
                                              job:
                                                  '${cubit.employerProfileModel.employee.business.name}\n',
                                            ),
                                            buildRowJobDetailsEmployer(
                                              context,
                                              title: 'Manager\n',
                                              job:
                                                  '${cubit.employerProfileModel.employee.fullName}\n',
                                            ),
                                            buildRowJobDetailsEmployer(
                                              context,
                                              title: 'Mobile Number\n',
                                              job:
                                                  '${cubit.employerProfileModel.employee.mobileNumber1}\n',
                                            ),
                                            buildRowJobDetailsEmployer(
                                              context,
                                              title: 'Website\n',
                                              job:
                                                  '${cubit.employerProfileModel.employee.website}\n',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                               
                                Align(
                                  alignment: AlignmentDirectional.topCenter,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.network(
                                      cubit.employerProfileModel.employee.image,
                                      height: deviceInfo.screenHeight*0.15,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.bottomStart,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 20,bottom: 5),
                                    child: ElevatedButton.icon(onPressed: (){},
                                     icon: Icon(Icons.edit),
                                      label: Text('Edit',style: secondaryTextStyle(deviceInfo),)),
                                  ),
                                ),
                              ],
                            ),
                        )
                        : Container(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

 
}
