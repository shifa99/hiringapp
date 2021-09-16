// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hiring_app/components/colors.dart';
// import 'package:hiring_app/components/components.dart';
// import 'package:hiring_app/modules/Employee/job_details_screen.dart';
// import 'package:hiring_app/modules/Employee/job_title_test_screen.dart';
// import 'package:hiring_app/modules/employee_job_review_screen.dart';
// import 'package:hiring_app/modules/employee_job_summary_screen3.dart';
// import 'package:hiring_app/modules/video_room_screen.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// class WaitingRoomScreen extends StatelessWidget {
//   const WaitingRoomScreen({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: defaultAppBar(context, title: 'Waiting Room'),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Meeting countdown',
//                 style: TextStyle(
//                     color: defaultColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18),
//               ),
//               SizedBox(height: 10),
//               Center(
//                 child: CircularPercentIndicator(
//                   progressColor: Colors.orange,
//                   backgroundColor: Colors.orange.withOpacity(0.5),
//                   percent: 0.9,
//                   animation: true,
//                   radius: 150.0,
//                   lineWidth: 12.0,
//                   circularStrokeCap: CircularStrokeCap.round,
//                   center: Text(
//                     "13 Min",
//                     style: TextStyle(color: Colors.orange, fontSize: 22),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30),
//               Center(child: TextButton(onPressed: ()=> navigateTo(context, VideoRoomScreen()), child: Text('Join'))),
//               Container(
//                 height: 50,
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'You are waiting   ',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       Text(
//                         '2',
//                         style: TextStyle(
//                             color: Colors.orange,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20),
//                       ),
//                       Text(
//                         '  candidates to start ',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 180,
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     Container(
//                       height: 150,
//                       child: GestureDetector(
//                         onTap: () {
//                           navigateTo(context, JobTitleTestScreen());
//                           // navigateTo(context, JobDetailsScreen());
//                         },
//                         child: Card(
//                           elevation: 3,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(25)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(height: 10),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text('Vodafone'),
//                                     Image.asset(
//                                       'assets/images/vodafone.png',
//                                       height: 25,
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 10),
//                                 Divider(),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text('\nJob title'),
//                                     Text(
//                                       '\niOS Developer',
//                                       style: TextStyle(
//                                           color: defaultColor, fontSize: 18),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 15,
//                       left: 25,
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Container(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 10, vertical: 2),
//                           child: Text(
//                             'About interview',
//                             style: TextStyle(
//                                 color: defaultColor,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Others in waiting',
//                 style: TextStyle(
//                     color: defaultColor,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               GridView.builder(
//                   shrinkWrap: true,
//                   itemCount: 4,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     mainAxisExtent: 130,
//                   ),
//                   itemBuilder: (context, index) {
//                     return Card(
//                       elevation: 3,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             CircleAvatar(
//                               radius: 40,
//                             ),
//                             SizedBox(height: 10),
//                             Text(
//                               'Name Here',
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             SizedBox(height: 10),
//                           ],
//                         ),
//                       ),
//                     );
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
