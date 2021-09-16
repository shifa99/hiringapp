
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/modules/Employee/home/cubit/get_confirmed_meetings_cubit/get_confirmed_meetings_cubit.dart';
import 'package:hiring_app/modules/Employee/home/cubit/get_confirmed_meetings_cubit/get_confirmed_meetings_cubit_states.dart';
import 'package:hiring_app/modules/logins/login_employer_screen.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import '../../../../who_are_you2_screen.dart';
import 'build_confirmation_widget.dart';
import 'build_not_confirmed_widget.dart';

class MySchedualScreen extends StatefulWidget {
  @override
  _MySchedualScreenState createState() => _MySchedualScreenState();
}

class _MySchedualScreenState extends State<MySchedualScreen>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() 
  {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetMyScheduleEmployeeMeetingsCubit()..getMyScheduleEmployeeMeetings(),
      child: responsiveWidget(
        responsive: (context, deviceInfo) =>
            BlocBuilder<GetMyScheduleEmployeeMeetingsCubit, MyScheduleMeetings>(
                builder: (context, state) {
          if (state is GetNotConfirmedMeetingsSuccussState) {
            var myScheduleCubit =
                GetMyScheduleEmployeeMeetingsCubit.get(context);
            return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('My Schedule'),
                  centerTitle: true,
                  toolbarHeight: 130.0,
                  leading: Builder(
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
                  shape: RoundedRectangleBorder(
                      borderRadius: borderRadiusBottom()),
                  bottom: PreferredSize(
                    child: Container(
                      color: Colors.white,
                      child: TabBar(
                        controller: _tabController,
                        tabs: [
                          Tab(
                            child: Text(
                                'Not Confirmed (${myScheduleCubit.employeeMeetingModel.notConfirmscheduledMeetings.length}+)'),
                          ),
                          Tab(
                            child: Text(
                                'Confirmed (${myScheduleCubit.employeeMeetingModel.confirmedscheduledMeetings.length}+)'),
                          )
                        ],
                        unselectedLabelColor: Colors.black54,
                        labelColor: defaultColor,
                      ),
                    ),
                  ),
                ),
                body: isGuest
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
                                style: TextStyle(
                                    color: defaultColor, fontSize: 22),
                              ),
                              SizedBox(height: 20),
                              defaultButton(
                                  text: 'Login',
                                  onPressed: () {
                                    navigateTo(context, EmployerLoginScreen());
                                  },
                                  height: 50.0),
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
                    : TabBarView(
                        physics: BouncingScrollPhysics(),
                        controller: _tabController,
                        children: <Widget>[
                          buildNotConfirmedScreen(
                              deviceInfo,
                              myScheduleCubit.employeeMeetingModel
                                  .notConfirmscheduledMeetings,
                              context),
                          buildConfirmedScreen(
                              deviceInfo,
                              myScheduleCubit.employeeMeetingModel
                                  .confirmedscheduledMeetings),
                        ],
                      ),
              ),
            );
          } else if (state is GetNotConfirmedMeetingsLoadingState)
            return loadingProgress();
          else
            return Center(
              child: Text('Error'),
            );
        }),
      ),
    );
  }
}

  

