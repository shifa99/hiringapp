import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employer/live_details_screen.dart';

import '../employee_job_review_screen.dart';

class MyJobsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar1(context,
          title: 'iOS Developer', actionWidget: Container()),
      body: SafeArea(
        child: Center(
          // child: cubit.internetConnect ?
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            color: defaultColor,
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Center(child: Text('Under progress'))),
                          )),
                ),
                Expanded(
                  child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 200,
                      ),
                      itemCount: 8,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              // navigateTo(context, EmployeeJobSummaryScreen());
                              navigateTo(context, LiveDetailsScreen());


                            },
                            child: Stack(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12)),
                                  elevation: 3,
                                  // color: Colors.grey[100],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 20),
                                        Text(
                                          'Vodafone',
                                          style: TextStyle(
                                              color: defaultColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'iOS developer ',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          '5 years experience',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          'Under progress',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          '21-12-2021',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey),
                                        ),
                                        SizedBox(height: 20),
                                        defaultButton(
                                          text: 'ACCEPT',
                                          onPressed: () {},
                                          radius: 5,
                                          height: 40.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 20,
                                  child: Container(
                                    height: 20,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadiusBottom(),
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 30,
                                  right: 12,
                                  child: Image.asset(
                                    'assets/images/vodafone.png',
                                    height: 30,
                                    width: 30,
                                  ),
                                )
                              ],
                            ),
                          )),
                )
              ],
            ),
          ),
          // : Text('Internet Not Connected !'),
        ),
      ),
    );
  }
}
