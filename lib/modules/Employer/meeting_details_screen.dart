import 'package:flutter/material.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';
import 'package:hiring_app/shared/style/style.dart';

class MeetingDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context,
        title: 'Live Meeting',
      ),
      body: responsiveWidget(responsive: (context, deviceInfo) {
        double spaceBetweenChild = deviceInfo.screenHeight * 0.1;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: deviceInfo.screenHeight * 0.34,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: deviceInfo.screenHeight * 0.32,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildHeadTitle(title: 'About company'),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Name\n',
                                            style:
                                                secondaryTextStyle(deviceInfo),
                                          ),
                                          Text(
                                            'Address \n',
                                            style:
                                                secondaryTextStyle(deviceInfo),
                                          ),
                                          Text(
                                            'Start from\n',
                                            style:
                                                secondaryTextStyle(deviceInfo),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: spaceBetweenChild),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'VodaFone\n',
                                            style:
                                                secondaryTextStyle(deviceInfo)
                                                    .copyWith(
                                                        color: defaultColor),
                                          ),
                                          Text(
                                            'Cairo , Egypt\n',
                                            style:
                                                secondaryTextStyle(deviceInfo)
                                                    .copyWith(
                                                        color: defaultColor),
                                          ),
                                          Text(
                                            '2015',
                                            style:
                                                secondaryTextStyle(deviceInfo)
                                                    .copyWith(
                                                        color: defaultColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 25,
                        child: Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                'assets/images/vodafone.png',
                                height: deviceInfo.screenHeight * 0.15,
                                width: deviceInfo.screenHeight * 0.15,
                                fit: BoxFit.fill,
                              )),
                        ),
                        height: 80,
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildHeadTitle(title: 'About job Title'),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: 
                                [
                                  Text(
                                    'Job title\n',
                                    style: secondaryTextStyle(deviceInfo),
                                  ),
                                  Text(
                                    'Details \n',
                                    style: secondaryTextStyle(deviceInfo),
                                  ),
                                ],
                              ),
                              SizedBox(width: spaceBetweenChild),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'IOS Developer\n',
                                    style: secondaryTextStyle(deviceInfo)
                                        .copyWith(color: defaultColor),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 10),
                                    width: deviceInfo.screenwidth * 0.48,
                                    child: Text(
                                      'Lorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et doloreLorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et dolore\n',
                                      style: secondaryTextStyle(deviceInfo)
                                          .copyWith(color: defaultColor),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildHeadTitle(title: 'Meeting Details'),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Meeting time \n',
                                    style: secondaryTextStyle(deviceInfo),
                                  ),
                                  Text(
                                    'Meeting date \n',
                                    style: secondaryTextStyle(deviceInfo),
                                  ),
                                ],
                              ),
                              SizedBox(width: 50),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '10:00 am\n',
                                    style: secondaryTextStyle(deviceInfo)
                                        .copyWith(color: defaultColor),
                                  ),
                                  Text(
                                    '12-12-2020\n',
                                    style: secondaryTextStyle(deviceInfo)
                                        .copyWith(color: defaultColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Text buildHeadTitle({String title}) {
    return Text(
      '$title\n',
      style: TextStyle(
          color: defaultColor, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
