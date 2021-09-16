import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/modules/Employee/my_jobs_screen.dart';
import 'package:hiring_app/modules/Employee/profile_screen.dart';
import 'package:hiring_app/modules/Employer/job_summary_screen.dart';
import 'package:hiring_app/modules/services/logout.dart';
import 'package:hiring_app/modules/who_are_you_screen.dart';
import 'package:hiring_app/network/end_points.dart';
import 'package:hiring_app/network/local/cache_helper.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return 
       BlocProvider(
        create: (BuildContext context) => AppCubit()
          ..getProfile()
          ..getHomeData()
          ..getJustHomeData(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates state) {},
          builder: (BuildContext context, AppStates state) {
            AppCubit cubit = AppCubit.get(context);
            return ConditionalBuilder(
              condition: true,
              builder: (context) => homeLayoutBuilder(
                state,
                'isLogin',
                context,
                cubit,
              ),
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        
      ),
    );
  }

  Scaffold homeLayoutBuilder(
      state, String isLogin, BuildContext context, AppCubit cubit) {
    var controller = TextEditingController();
    return Scaffold(
      key: scaffoldKey,
      drawer: SafeArea(
        child: ConditionalBuilder(
          condition: state is! GetEmployeeProfileLoadingState,
          fallback: (context) => buildCircularProgressIndicator(),
          builder: (context) => Container(
            child: ClipRRect(
              borderRadius: buildBorderRadiusDrawer(),
              child: Drawer(
                child: Container(
                  decoration: BoxDecoration(
                    color: secondColor,
                    borderRadius: buildBorderRadiusDrawer(),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          padding: EdgeInsets.only(top: 20),
                          color: defaultColor,
                          child: isGuest
                              ? Center(
                                  child: InkWell(
                                      onTap: () {
                                        navigateTo(context, WhoAreYouScreen());
                                      },
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            color: secondColor,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      )))
                              : Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                        cubit.employeeProfileModel.employee ==
                                                null
                                            ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
                                            : cubit.employeeProfileModel
                                                .employee.image,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      cubit.employeeProfileModel.employee ==
                                              null
                                          ? 'loading..'
                                          : cubit.employeeProfileModel.employee
                                              .fullName,
                                      style: TextStyle(
                                          color: secondColor, fontSize: 22),
                                    ),
                                  ],
                                ),
                        ),
                        if (!isGuest)
                          defaultDrawerItem(
                            image: 'home1.png',
                            text: ('Profile'),
                            onTap: () {
                              isGuest
                                  ? print('log first')
                                  : navigateTo(context, ProfileScreen());
                            },
                          ),
                        defaultDrawerItem(
                          image: 'home1.png',
                          text: ('Home'),
                          onTap: () {
                            Navigator.pop(context);
                            cubit.changeIndex(0);
                          },
                        ),
                        defaultDrawerItem(
                          image: 'calendar1.png',
                          text: ('My schedule'),
                          onTap: () {
                            Navigator.pop(context);
                            cubit.changeIndex(1);
                            // navigateTo(context, MeetingSummaryScreen());
                          },
                        ),
                        if (!isGuest)
                          defaultDrawerItem(
                            image: 'email1.png',
                            text: ('Messages'),
                            onTap: () {
                              Navigator.pop(context);
                              cubit.changeIndex(3);
                            },
                          ),
                        if (!isGuest)
                          defaultDrawerItem(
                            image: 'notifications1.png',
                            text: ('Notifications'),
                            onTap: () {
                              Navigator.pop(context);
                              cubit.changeIndex(2);
                            },
                          ),
                        if (!isGuest)
                          defaultDrawerItem(
                            image: 'add.png',
                            text: ('My Jobs'),
                            onTap: () {
                              isGuest
                                  ? print('log first')
                                  : navigateTo(context, MyJobsScreen());
                            },
                          ),
                        if (!isGuest)
                          defaultDrawerItem(
                            image: 'home1.png',
                            text: ('Title'),
                            onTap: () {},
                          ),
                        defaultDrawerItem(
                          image: 'home1.png',
                          text: ('help'),
                          onTap: () {
                            logoutEmployee(context,
                                url: EMPLOYEELOGOUT,
                                tokenEmp: 'tokenEmployee',
                                tokenKey: 'tokenEmployee');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            if (cubit.currentIndex != 1)
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: defaultColor, borderRadius: borderRadiusBottom()),
              ),
            if (cubit.currentIndex != 1)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: Icon(
                              Icons.format_list_bulleted,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          cubit.title[cubit.currentIndex],
                          style: TextStyle(
                              color: secondColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        cubit.currentIndex == 4
                            ? IconButton(
                                onPressed: () {
                                  CacheHelper.removeData(key: 'tokenEmployee');
                                  CacheHelper.removeData(key: 'tokenEmployer');
                                  navigateTo(context, WhoAreYouScreen());

                                  logoutEmployee(context,
                                      tokenEmp: tokenEmployee,
                                      tokenKey: 'tokenEmployee',
                                      url: EMPLOYEELOGOUT);
                                },
                                icon: Icon(
                                  Icons.logout,
                                  color: secondColor,
                                ),
                              )
                            : Icon(
                                Icons.add,
                                color: defaultColor,
                              ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Container(
                        height: 40,
                        child: cubit.currentIndex == 0
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton.icon(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                        content: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text('Title'),
                                                                  Checkbox(
                                                                      value:
                                                                          true,
                                                                      onChanged:
                                                                          (val) {}),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text('Date'),
                                                                  Checkbox(
                                                                      value:
                                                                          false,
                                                                      onChanged:
                                                                          (val) {}),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: 20),
                                                              defaultButton(
                                                                  text:
                                                                      'Filter',
                                                                  onPressed:
                                                                      () {
                                                                    // navigateTo(
                                                                    //     context,
                                                                    //     JobSummaryScreen());
                                                                  })
                                                            ],
                                                          ),
                                                        ),
                                                      ));
                                            },
                                            icon: Image.asset(
                                                'assets/icons/filter.png'),
                                            label: Text(
                                              'Filter',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: defaultFormField(
                                        controller: controller,
                                        validator: (val) {},
                                        onTap: () {},
                                        type: TextInputType.text,
                                        hint: 'search',
                                        icon: Icon(Icons.search)),
                                  )
                                ],
                              )
                            : Container(),
                      ),
                    )
                  ],
                ),
              ),
            Container(
              padding: EdgeInsets.only(
                  top: cubit.currentIndex != 1
                      ? cubit.currentIndex == 0
                          ? 115
                          : 100
                      : 0),
              child:responsiveWidget(responsive: (context,deviceInfo)=> 
              ConditionalBuilder(
                  condition: state is! GetEmployeeHomeDataLoadingState,
                  fallback: (context) => buildCircularProgressIndicator(),
                  builder: (context) => cubit.currentScreen(deviceInfo))),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black87,
        onTap: (index) {
          cubit.changeIndex(index);
        },
        currentIndex: cubit.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: ('MySchedual'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: ('Notifications'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.email),
            label: ('Messages'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.person),
            label: ('Profile'),
          ),
        ],
      ),
    );
  }
}
