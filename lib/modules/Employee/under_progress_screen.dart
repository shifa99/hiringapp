// import 'package:flutter/material.dart';
// import 'package:hiring_app/components/colors.dart';
// import 'package:hiring_app/components/components.dart';
// import 'package:hiring_app/modules/Employee/waiting_room.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// class UnderProgressScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: defaultAppBar(context, title: 'Live Meeting'),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Text(
//                 'Meeting is live now please join the room\n',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               defaultButton(text: 'JOIN', onPressed: () {
//                 navigateTo(context, WaitingRoomScreen());
//               }),
//               SizedBox(height: 30),
//               Container(
//                 height: 210,
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     Container(
//                       height: 180,
//                       child: Card(
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'About company',
//                                 style: TextStyle(
//                                     fontSize: 22,
//                                     color: defaultColor,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(height: 10),
//                               Row(
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Name\n'),
//                                       Text('Address\n'),
//                                       Text('Start from\n'),
//                                     ],
//                                   ),
//                                   SizedBox(width: 50),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Vodafone\n',
//                                           style: TextStyle(
//                                             color: defaultColor,
//                                           )),
//                                       Text('Cairo, Egypt\n',
//                                           style: TextStyle(
//                                             color: defaultColor,
//                                           )),
//                                       Text(
//                                         '2015\n',
//                                         style: TextStyle(
//                                           color: defaultColor,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 10,
//                       right: 25,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.asset(
//                           'assets/images/vodafone.png',
//                           width: 80,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 child: Card(
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'About job Title',
//                           style: TextStyle(
//                               fontSize: 22,
//                               color: defaultColor,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 10),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Text('Job title\n'),
//                                 Text('Details\n'),
//                               ],
//                             ),
//                             SizedBox(width: 50),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text('IOS Developer\n',
//                                     style: TextStyle(
//                                       color: defaultColor,
//                                     )),
//                                 Container(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.5,
//                                   child: Text(
//                                     'Lorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et doloreLorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et dolore\n',
//                                     style: TextStyle(
//                                       color: defaultColor,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
