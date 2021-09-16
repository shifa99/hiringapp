import 'package:flutter/material.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/models/employer/emplyer_home_model.dart';

class JobDetailsEmployerScreen extends StatelessWidget {
  final MyJob detailsJob;
  JobDetailsEmployerScreen(this.detailsJob);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar1(context,
          title: detailsJob.title, actionWidget: Container()),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildHeadLine(title: 'About Company\n'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    buildRowJobDetailsEmployer(context,
                                        title: 'Name\n', job: '${detailsJob.employer.companyName}\n'),
                                    buildRowJobDetailsEmployer(context,
                                        title: 'Address \n',
                                        job: '${detailsJob.employer.city}, ${detailsJob.employer.country}\n'),
                                    buildRowJobDetailsEmployer(context,
                                        title: 'Start from\n', job: '${detailsJob.employer.establishedAt}\n'),
                                  ],
                                ),
                                Flexible(
                                  child: Image.asset(
                                    'assets/images/vodafone.png',
                                  ),
                                ),
                              ],
                            ),
                            myDivider(context),
                            buildHeadLine(title: 'About job Title\n'),
                            buildRowJobDetails(context,
                                title: 'Job title\n', job: '${detailsJob.title}\n'),
                            buildRowJobDetails(context,
                                title: 'Details\n',
                                job:
                                    '${detailsJob.details}\n'),
                            buildRowJobDetails(context,
                                title: 'Experience\n', job: '${detailsJob.experience} years\n'),
                            buildRowJobDetails(context,
                                title: 'Start from\n', job: '2015\n'),
                            myDivider(context),
                            buildHeadLine(title: 'Meeting Details\n'),
                            buildRowJobDetails(context,
                                title: 'Meeting time \n',
                                job: '${detailsJob.meetingEnd}\n'),
                            buildRowJobDetails(context,
                                title: 'Meeting date\n', job: '${detailsJob.meetingDate}\n'),
                            buildRowJobDetails(context,
                                title: 'Notes\n',
                                job:
                                    '${detailsJob.note}\n'),
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
            defaultButton(
              text: 'SHARE',
              onPressed: () {},
              height: 50.0,
              width: MediaQuery.of(context).size.width * 0.9,
            )
          ],
        ),
      ),
    );
  }
}
