import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/employer_cubit.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/states.dart';
import 'package:hiring_app/modules/Employer/home_employee/screens/meeting_summery_screen/meeting_summary_screen.dart';
import 'package:hiring_app/modules/video_room_screen.dart';


class HomeEmployerLayout extends StatefulWidget {
  @override
  _HomeEmployerLayoutState createState() => _HomeEmployerLayoutState();
}

class _HomeEmployerLayoutState extends State<HomeEmployerLayout> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();

  final timeController = TextEditingController();

  final dateController = TextEditingController();

  final controller = TextEditingController();
  bool isFirst = true;
  @override
  void didChangeDependencies() {
    AppEmployerCubit.get(context).getProfile();
    AppEmployerCubit.get(context).getEmployerHomeData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppEmployerCubit, AppEmployerStates>(
      listener: (BuildContext context, AppEmployerStates state) {},
      builder: (BuildContext context, AppEmployerStates state) {
        AppEmployerCubit cubit = AppEmployerCubit.get(context);

        return ConditionalBuilder(
          condition: state is! GetEmployerProfileLoadingState,
          builder: (context) => homeLayoutBuilder(
            'isLogin',
            context,
            cubit,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Scaffold homeLayoutBuilder(
      String isLogin, BuildContext context, AppEmployerCubit cubit) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Container(
        child: ClipRRect(
          borderRadius: buildBorderRadiusDrawer(),
          child: Drawer(
            child: Container(
              decoration: BoxDecoration(
                color: secondColor,
                borderRadius: buildBorderRadiusDrawer(),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        padding: EdgeInsets.only(top: 20),
                        color: defaultColor,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: cubit.employerProfileModel.employee != null
                                  ? Image.network(
                                      '${cubit.employerProfileModel.employee.image}',
                                      fit: BoxFit.cover,
                                      height: 120,
                                      width: 120,
                                    )
                                  : Text('loading'),
                            ),
                            SizedBox(height: 10),
                            cubit.employerProfileModel.employee != null
                                ? Text(
                                    '${cubit.employerProfileModel.employee.companyName}',
                                    style: TextStyle(
                                        color: secondColor, fontSize: 22),
                                  )
                                : Text('Loading...'),
                          ],
                        ),
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
                        text: ('Meetings Results'),
                        onTap: () {
                          navigateTo(context, MeetingSummaryScreen());
                        },
                      ),
                      defaultDrawerItem(
                        image: 'email1.png',
                        text: ('Messages'),
                        onTap: () {
                            Navigator.pop(context);
                          cubit.changeIndex(3);
                        },
                      ),
                      defaultDrawerItem(
                        image: 'notifications1.png',
                        text: ('Notifications'),
                        onTap: () {},
                      ),
                      defaultDrawerItem(
                        image: 'add.png',
                        text: ('Create New Job'),
                        onTap: () {
                          Navigator.pop(context);
                          cubit.changeIndex(2);

                          //navigateTo(context, CreateJobScreen());
                        },
                      ),
                      defaultDrawerItem(
                        image: 'home1.png',
                        text: ('Live Room'),
                        onTap: () {
                          navigateTo(context, CallPage(channelName: 'agora',));
                        },
                      ),
                      defaultDrawerItem(
                        image: 'home1.png',
                        text: ('Settings'),
                        onTap: () {},
                      ),
                      defaultDrawerItem(
                        image: 'home1.png',
                        text: ('help'),
                        onTap: () {},
                      ),
                    ],
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
            Container(
              height: 120,
              decoration: BoxDecoration(
                  color: defaultColor, borderRadius: borderRadiusBottom()),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
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

                      Icon(
                        Icons.add,
                        color: defaultColor,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Container(
                      height: 70,
                      child: cubit.currentIndex == 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                                      shape:
                                                          RoundedRectangleBorder(
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
                                                              MainAxisSize.min,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text('Title'),
                                                                Checkbox(
                                                                    value: true,
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
                                                                text: 'Filter',
                                                                onPressed: () {
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
              padding:
                  EdgeInsets.only(top: cubit.currentIndex == 0 ? 130 : 120),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: cubit.currentScreen(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: borderRadiusTop(radius: 25.0),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black54,
          backgroundColor: Colors.grey.shade50,
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
              label: ('Schedule'),
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
              label: (''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.email),
              label: ('Messages'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: ('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
