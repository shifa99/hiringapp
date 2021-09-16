import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employee/home/cubit/meeting_summery_cubit/meeting_summery_cubit.dart';
import 'package:hiring_app/modules/Employee/home/cubit/meeting_summery_cubit/meeting_summery_states.dart';
import 'package:hiring_app/modules/Employer/home_employee/screens/meeting_summery_screen/build_item_meeting_summery.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:hiring_app/shared/style/style.dart';

import '../../../../Employee/job_details_screen.dart';
import '../../../job_summary_screen.dart';

class MeetingSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: responsiveWidget(
        responsive: (context, deviceInfo) => BlocProvider(
          create: (context) => MeetingSummeryCubit()..getMeetingSummeryData(),
          child: SafeArea(
            child: BlocBuilder<MeetingSummeryCubit, MeetingSummeryStates>(
                builder: (context, state) {
              if (state is MeetingSummerySuccessState) {
                var meetingSummeryDate =
                    MeetingSummeryCubit.get(context).meetingSummeryModel.schedule;
                return Stack(
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: defaultColor,
                          borderRadius: borderRadiusBottom()),
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
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              // SizedBox(width:MediaQuery.of(context).size.width*0.3),
                              Text(
                                'Meetings summary',
                                style: primaryTextStyle(deviceInfo)
                                    .copyWith(color: secondColor),
                              ),
                              Icon(
                                Icons.add,
                                color: defaultColor,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Container(
                                height: 40,
                                child:
                                    /* cubit.currentIndex == 1
                                ? Card(
                                    child: TextButton.icon(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12)),
                                                    content: Padding(
                                                      padding:
                                                          const EdgeInsets.all(8.0),
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
                                                                  value: false,
                                                                  onChanged:
                                                                      (val) {}),
                                                            ],
                                                          ),
                                                          SizedBox(height: 20),
                                                          defaultButton(
                                                              text: 'Filter',
                                                              onPressed: () {
                                                                navigateTo(context,
                                                                    JobSummaryScreen());
                                                              })
                                                        ],
                                                      ),
                                                    ),
                                                  ));
                                        },
                                        icon: Image.asset('assets/icons/filter.png'),
                                        label: Text(
                                          'Filter',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 15),
                                        )),
                                  )
                                : */
                                    Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: TextButton.icon(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  content: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                                value: false,
                                                                onChanged:
                                                                    (val) {}),
                                                          ],
                                                        ),
                                                        SizedBox(height: 20),
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
                                            color: Colors.black, fontSize: 15),
                                      )),
                                )),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 115),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child:meetingSummeryDate.length==0? Center(child: Text('No Available Meeting Summery Untill Now',
                            style: primaryTextStyle(deviceInfo).copyWith(color: Colors.red,),)):GridView.builder(
                                physics: BouncingScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent:
                                      deviceInfo.screenHeight * 0.25,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                ),
                                itemCount: meetingSummeryDate.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => InkWell(
                                      onTap: () 
                                      {
                                        navigateTo(context, JobSummaryScreen(meetingSummeryDate[index].id,meetingSummeryDate[index].title));
                                      },
                                      child:
                                          BuildItemMeetingSummery(deviceInfo,meetingSummeryDate[index]),
                                    )),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is MeetingSummeryLoadingState)
                return loadingProgress();
              else
                return Center(
                  child: Text(
                    'Error Happen',
                    style: primaryTextStyle(deviceInfo)
                        .copyWith(color: Colors.red),
                  ),
                );
            }),
          ),
        ),
      ),
      /*SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          // height: MediaQuery.of(context).size.height * 0.66,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 170,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: 8,
                shrinkWrap: true,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        print('pressed');
                        navigateTo(context, JobDetailsScreen());
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        elevation: 3,
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'iOS Developer\n',
                                style: TextStyle(
                                    color: defaultColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Cairo,Egypt\n',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              Text(
                                '12 candidate\n',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    'Meeting date ',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '24 - 4 ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: defaultColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
        ),
      ),*/
    );
  }
}
