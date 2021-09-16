import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/modules/Employee/home/cubit/cubit.dart';
import 'package:hiring_app/modules/Employee/home/cubit/states.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:hiring_app/shared/style/style.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class JobDetailsScreen extends StatefulWidget {
  final int id;

  const JobDetailsScreen({this.id});

  @override
  _JobDetailsScreenState createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  bool rolled = false;
  bool isFirst = true;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void didChangeDependencies() {
    if (isFirst) {
      AppCubit.get(context).getGuestJobDetails(id: widget.id);
      AppCubit.get(context).getJobDetails(id: widget.id);
    }
    isFirst = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return responsiveWidget(
      responsive: (context, deviceInfo) => BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetJobDetailsEmployeeHomeDataSuccessState ||
              (state is! GetJobDetailsEmployeeHomeDataLoadingState &&
                  state is! GetJobDetailsEmployeeHomeDataErrorState)) {
            var cubit = AppCubit.get(context);
            return Scaffold(
              key: scaffoldKey,
              appBar: defaultAppBar1(context,
                  title:
                      '${cubit.jobDetailsEmployeeModel.jobDetails.employer.title}',
                  actionWidget: Container()),
              body: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildHeadLine(title: 'Company Details\n'),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildRowJobDetails(context,
                                        title: 'Name\n',
                                        job:
                                            '${cubit.jobDetailsEmployeeModel.jobDetails.employer.fullName}\n',
                                        deviceInfo: deviceInfo),
                                    buildRowJobDetails(context,
                                        title: 'Address \n',
                                        job:
                                            '${cubit.jobDetailsEmployeeModel.jobDetails.employer.country},${cubit.jobDetailsEmployeeModel.jobDetails.employer.city}\n',
                                        deviceInfo: deviceInfo),
                                    buildRowJobDetails(context,
                                        title: 'Website\n',
                                        job:
                                            '${cubit.jobDetailsEmployeeModel.jobDetails.employer.website}',
                                        deviceInfo: deviceInfo),
                                    myDivider(context),
                                    buildHeadLine(title: 'Job  details\n'),
                                    buildRowJobDetails(context,
                                        title: 'Job title\n',
                                        job:
                                            '${cubit.jobDetailsEmployeeModel.jobDetails.employer.title}\n',
                                        deviceInfo: deviceInfo),
                                    buildRowJobDetails(context,
                                        title: 'Industry\n',
                                        job:
                                            '${cubit.jobDetailsEmployeeModel.jobDetails.details}\n',
                                        deviceInfo: deviceInfo),
                                    buildRowJobDetails(context,
                                        title: 'Details\n',
                                        job:
                                            '${cubit.jobDetailsEmployeeModel.jobDetails.employer.title}\n',
                                        deviceInfo: deviceInfo),
                                    buildRowJobDetails(context,
                                        title: 'Salary\n',
                                        job:
                                            '${cubit.jobDetailsEmployeeModel.jobDetails.salary}\n',
                                        deviceInfo: deviceInfo),
                                    buildRowJobDetails(context,
                                        title: 'Gender\n',
                                        job:
                                            '${cubit.jobDetailsEmployeeModel.jobDetails.gender}\n',
                                        deviceInfo: deviceInfo),
                                    buildRowJobDetails(context,
                                        title: 'Experience\n',
                                        job:
                                            '${cubit.jobDetailsEmployeeModel.jobDetails.experience}\n',
                                        deviceInfo: deviceInfo),
                                    buildRowJobDetails(context,
                                        title: 'Qualification\n',
                                        job:
                                            '${cubit.jobDetailsEmployeeModel.jobDetails.qualification}\n',
                                        deviceInfo: deviceInfo),
                                    myDivider(context),
                                    buildHeadLine(title: 'Meeting Details\n'),
                                    buildRowJobDetails(context,
                                        title: 'Meeting time\n',
                                        job:
                                            '${cubit.jobDetailsEmployeeModel.jobDetails.meetingTime}\n',
                                        deviceInfo: deviceInfo),
                                    buildRowJobDetails(context,
                                        title: 'Meeting date\n',
                                        job:
                                            '${DateFormat('yyyy-MM-dd').format(cubit.jobDetailsEmployeeModel.jobDetails.meetingDate)}\n',
                                        deviceInfo: deviceInfo),
                                    buildRowJobDetails(context,
                                        title: 'Note\n',
                                        job:
                                            '${cubit.jobDetailsEmployeeModel.jobDetails.note}\n',
                                        deviceInfo: deviceInfo),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        elevation: 3,
                      ),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    if (!isGuest)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: defaultButton(
                              text: 'SHARE',
                              onPressed: () {
                                //     navigateTo(context, EmployeeJobSummaryScreen2());
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ConditionalBuilder(
                              condition: state
                                  is! JobApplyEmployeeHomeDataLoadingState,
                              fallback: (context) =>
                                  buildCircularProgressIndicator(),
                              builder: (context) => borderButton(
                                onPressed: () async {
                                  if (isGuest)
                                    Toast.show('Please Login first', context);
                                  else {
                                    await cubit
                                        .applyJob(jobId: widget.id)
                                        .then((value) {
                                      if (value) {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  content: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      SizedBox(height: 16),
                                                      Image.asset(
                                                          'assets/icons/tick.png'),
                                                      SizedBox(height: 30),
                                                      Text(
                                                        'You have enrolled successfully\n',
                                                        style:
                                                            secondaryTextStyle(
                                                                deviceInfo),
                                                      ),
                                                      Text(
                                                        'Wait for notification about your meeting time',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            secondaryTextStyle(
                                                                deviceInfo),
                                                      ),
                                                      SizedBox(height: 30),
                                                      defaultButton(
                                                          text: 'OK',
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          width: deviceInfo
                                                                  .screenwidth *
                                                              .3),
                                                    ],
                                                  ),
                                                ));
                                      } else {
                                        if (state
                                            is! JobApplyEmployeeHomeDataErrorState)
                                          defaultSnackBar(context,
                                              content:
                                                  'you already apply for this job',
                                              color: Colors.red);
                                        else
                                          defaultSnackBar(context,
                                              content:
                                                  'Error Happen In Internet !!',
                                              color: Colors.red);
                                      }
                                    });
                                  }
                                },
                                text: 'ENROLL',
                                width: deviceInfo.screenwidth * 0.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            );
          } else if (state is GetJobDetailsEmployeeHomeDataLoadingState)
            return Scaffold(body: loadingProgress());
          else
            return Scaffold(
              body: Center(
                child: Text(
                  'Error Happen Now !!',
                  style:
                      primaryTextStyle(deviceInfo).copyWith(color: Colors.red),
                ),
              ),
            );
        },
      ),
    );
  }
}

void defaultSnackBar(BuildContext context,
    {@required String content,
    @required Color color,
    Duration duration,
    SnackBarAction action}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    action: action,
    duration: duration ?? Duration(seconds: 4),
    backgroundColor: color,
    content: Text(content),
    elevation: 3,
  ));
}
