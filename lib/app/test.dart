// import 'package:flutter/material.dart';

// import '../widgets/home/product_card.dart';
// import '../widgets/home/bid_ask_widget.dart';
// import '../widgets/home/discount.dart';
// import '../widgets/home/gold_title.dart';
// import '../widgets/home/high_low_price.dart';
// import '../widgets/home/product_title.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             spacing: 16,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const GoldTitleWidget(),
//               Container(
//                   decoration: BoxDecoration(
//                       color: const Color.fromARGB(12, 0, 0, 0),
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 20, horizontal: 12),
//                     child: Column(
//                       spacing: 16,
//                       children: [
//                         const BidAskPriceWidget(),
//                         const HighLowPriceWidget(),
//                         const DiscountWidget(),
//                       ],
//                     ),
//                   )),
//               const ProductsTitleWidget(),
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: const Color.fromARGB(12, 0, 0, 0),
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.only(left: 12, right: 12, top: 20),
//                     child: ListView(
//                       children: const [
//                         ProductCard(
//                           title: 'TEN TOLA BAR',
//                           unit: '1TTB',
//                           bidPrice: '40137',
//                           askPrice: '40137',
//                         ),
//                         SizedBox(height: 8),
//                         ProductCard(
//                           title: 'GOLD 22 KT',
//                           unit: '1GM',
//                           bidPrice: '316.98',
//                           askPrice: '317.09',
//                         ),
//                         SizedBox(height: 8),
//                         ProductCard(
//                           title: 'GOLD 9999',
//                           unit: '1GM',
//                           bidPrice: '344.45',
//                           askPrice: '344.56',
//                         ),
//                         SizedBox(height: 8),
//                         ProductCard(
//                           title: 'KILOBAR 995',
//                           unit: '1KG',
//                           bidPrice: '342790',
//                           askPrice: '342889',
//                         ),
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


// import 'package:flutter/material.dart';

// class BidAskPriceWidget extends StatelessWidget {
//   const BidAskPriceWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'BID',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       '2919.49',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                       child: const Text(
//                         'USD',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(width: 12),
//         Expanded(
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'ASK',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       '2919.39',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                       child: const Text(
//                         'USD',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class HighLowPriceWidget extends StatelessWidget {
//   const HighLowPriceWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//             decoration: BoxDecoration(
//               color: const Color(0xFF9AEA9A),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Highest',
//                   style: TextStyle(
//                     fontSize: 12,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   '\$ 2919.49',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(width: 12),
//         Expanded(
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//             decoration: BoxDecoration(
//               color: const Color(0xFFF8A7A7),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Lowest',
//                   style: TextStyle(
//                     fontSize: 12,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   '\$ 2919.49',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class DiscountWidget extends StatelessWidget {
//   const DiscountWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 12),
//       decoration: BoxDecoration(
//         color: Colors.amber,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: const Center(
//         child: Text(
//           'DISCOUNT  3.0  USD',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class ProductCard extends StatelessWidget {
//   final String title;
//   final String unit;
//   final String bidPrice;
//   final String askPrice;

//   const ProductCard({
//     super.key,
//     required this.title,
//     required this.unit,
//     required this.bidPrice,
//     required this.askPrice,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             child: Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Container(
//             decoration: const BoxDecoration(
//               border: Border(
//                 top: BorderSide(color: Colors.grey, width: 0.5),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     child: Column(
//                       children: [
//                         const Text(
//                           'UNIT',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.amber,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           unit,
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 0.5,
//                   height: 50,
//                   color: Colors.grey,
//                 ),
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     child: Column(
//                       children: [
//                         const Text(
//                           'BID',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.amber,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           bidPrice,
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 0.5,
//                   height: 50,
//                   color: Colors.grey,
//                 ),
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     child: Column(
//                       children: [
//                         const Text(
//                           'ASK',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.amber,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           askPrice,
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }