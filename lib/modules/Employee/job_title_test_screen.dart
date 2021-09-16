import 'package:flutter/material.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';

class JobTitleTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar1(context,
          title: 'iOS Developer', actionWidget: Container()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                        Row(
                          children: [
                            Column(
                              children: [
                                buildRowJobDetailsEmployer(context,
                                    title: 'Name\n', job: 'Vodafone\n'),
                                buildRowJobDetailsEmployer(context,
                                    title: 'Address \n', job: 'Cairo, Egypt\n'),
                                buildRowJobDetailsEmployer(context,
                                    title: 'Website\n',
                                    job: 'www.vodafone.com\n'),
                              ],
                            ),
                            Image.asset(
                              'assets/images/vodafone.png',
                              width: 100,
                              height: 100,
                            ),
                          ],
                        ),
                        myDivider(context),
                        buildHeadLine(title: 'Job  details\n'),
                        buildRowJobDetails(context,
                            title: 'Job title\n', job: 'IOS Developer\n'),
                        buildRowJobDetails(context,
                            title: 'Industry\n', job: 'Software\n'),
                        buildRowJobDetails(context,
                            title: 'Details\n',
                            job:
                                'Lorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et doloreLorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et dolore\n'),
                        buildRowJobDetails(context,
                            title: 'Salary\n', job: '10.000\n'),
                        buildRowJobDetails(context,
                            title: 'Gender\n', job: 'Male\n'),
                        buildRowJobDetails(context,
                            title: 'Experience\n', job: '5 years\n'),
                        buildRowJobDetails(context,
                            title: 'Qualification\n',
                            job: 'Bachelor’s Degree\n'),
                        myDivider(context),
                        buildHeadLine(title: 'Meeting Details\n'),
                        buildRowJobDetails(context,
                            title: 'Meeting time \n',
                            job: '9:00 am  -  12:00 pm\n'),
                        buildRowJobDetails(context,
                            title: 'Meeting date\n', job: '2-2-2020\n'),
                        buildRowJobDetails(context,
                            title: 'Note\n',
                            job:
                                'You can join online meeting when your cv accepted by HR\n'),
                      ],
                    )
                  ],
                ),
              ),
            ),
            elevation: 3,
          ),
        ),
      ),
    );
  }
}
