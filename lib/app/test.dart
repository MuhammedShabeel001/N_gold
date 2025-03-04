// // lib/main.dart
// import 'package:flutter/material.dart';
// import 'screens/store_info_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Store App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         fontFamily: 'Roboto',
//       ),
//       home: const StoreInfoScreen(),
//     );
//   }
// }

// // lib/screens/store_info_screen.dart
// import 'package:flutter/material.dart';
// import '../widgets/header_widget.dart';
// import '../widgets/hours_card_widget.dart';
// import '../widgets/contact_info_row_widget.dart';
// import '../widgets/info_card_widget.dart';

// class StoreInfoScreen extends StatelessWidget {
//   const StoreInfoScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header
//               const HeaderWidget(),
//               const SizedBox(height: 16),
              
//               // Hours Section
//               const HoursCardWidget(),
//               const SizedBox(height: 16),
              
//               // Contact Info Section
//               const ContactInfoRowWidget(),
//               const SizedBox(height: 16),
              
//               // More Section Header
//               const Text(
//                 'More',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 12),
              
//               // Additional Info Cards
//               InfoCardWidget(
//                 title: 'Bank Details',
//                 icon: Icons.account_balance,
//               ),
//               const SizedBox(height: 12),
              
//               InfoCardWidget(
//                 title: 'Live Chart',
//                 icon: Icons.insert_chart,
//               ),
//               const SizedBox(height: 12),
              
//               InfoCardWidget(
//                 title: 'Technical Analysis',
//                 icon: Icons.trending_up,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // lib/widgets/header_widget.dart
// import 'package:flutter/material.dart';

// class HeaderWidget extends StatelessWidget {
//   const HeaderWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Text(
//           'Come Visit Our ',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           'Store',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.amber[700],
//           ),
//         ),
//       ],
//     );
//   }
// }

// // lib/widgets/hours_card_widget.dart
// import 'package:flutter/material.dart';
// import 'hour_row_widget.dart';

// class HoursCardWidget extends StatelessWidget {
//   const HoursCardWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Opening Hours:',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.amber[700],
//             ),
//           ),
//           const SizedBox(height: 12),
          
//           const HourRowWidget(days: 'Monday - Thursday', hours: '10 AM - 10 PM'),
//           const SizedBox(height: 8),
          
//           const HourRowWidget(days: 'Friday', hours: '04 PM - 10 PM'),
//           const SizedBox(height: 8),
          
//           const HourRowWidget(days: 'Saturday - Sunday', hours: '10 PM - 10 PM'),
//         ],
//       ),
//     );
//   }
// }

// // lib/widgets/hour_row_widget.dart
// import 'package:flutter/material.dart';

// class HourRowWidget extends StatelessWidget {
//   final String days;
//   final String hours;
  
//   const HourRowWidget({
//     Key? key,
//     required this.days,
//     required this.hours,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Text(
//             days,
//             style: const TextStyle(fontSize: 14),
//           ),
//         ),
//         const Text(
//           ' : ',
//           style: TextStyle(fontSize: 14),
//         ),
//         Expanded(
//           flex: 2,
//           child: Text(
//             hours,
//             textAlign: TextAlign.right,
//             style: const TextStyle(fontSize: 14),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // lib/widgets/contact_info_row_widget.dart
// import 'package:flutter/material.dart';
// import 'contact_card_widget.dart';

// class ContactInfoRowWidget extends StatelessWidget {
//   const ContactInfoRowWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Expanded(
//           child: ContactCardWidget(
//             title: 'WhatsApp',
//             content: '971581416969',
//             icon: Icons.message_outlined,
//             iconColor: Colors.green,
//           ),
//         ),
//         const SizedBox(width: 16),
//         const Expanded(
//           child: ContactCardWidget(
//             title: 'Mail',
//             content: 'Drop us a line',
//             icon: Icons.mail_outline,
//             iconColor: Colors.blue,
//           ),
//         ),
//       ],
//     );
//   }
// }

// // lib/widgets/contact_card_widget.dart
// import 'package:flutter/material.dart';

// class ContactCardWidget extends StatelessWidget {
//   final String title;
//   final String content;
//   final IconData icon;
//   final Color iconColor;
  
//   const ContactCardWidget({
//     Key? key,
//     required this.title,
//     required this.content,
//     required this.icon,
//     required this.iconColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.amber[700],
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 content,
//                 style: const TextStyle(fontSize: 12),
//               ),
//             ],
//           ),
//           Container(
//             width: 36,
//             height: 36,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(18),
//             ),
//             child: Icon(icon, color: iconColor),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // lib/widgets/info_card_widget.dart
// import 'package:flutter/material.dart';

// class InfoCardWidget extends StatelessWidget {
//   final String title;
//   final IconData icon;
  
//   const InfoCardWidget({
//     Key? key,
//     required this.title,
//     required this.icon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Container(
//                 width: 36,
//                 height: 36,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//                 child: Icon(icon, color: Colors.black54),
//               ),
//               const SizedBox(width: 16),
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           const Icon(Icons.arrow_outward, color: Colors.black54),
//         ],
//       ),
//     );
//   }
// }