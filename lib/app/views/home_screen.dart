// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/spot_rate_controller.dart';
// import '../models/spot_rate_model.dart';
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
//     final SpotRateController spotRateController = Get.find();

//     return Scaffold(
//       body: SafeArea(
//         child: Obx(() {
//           if (spotRateController.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (spotRateController.errorMessage.isNotEmpty) {
//             return Center(
//               child: Text(
//                 'Error: ${spotRateController.errorMessage}',
//                 style: const TextStyle(color: Colors.red),
//               ),
//             );
//           }

//           final spotRates = spotRateController.spotRates;
          
//           // Find specific spot rates
//           final goldSpotRate = spotRates.firstWhere(
//             (rate) => rate.symbol == 'GOLD',
//             orElse: () => SpotRate(symbol: 'GOLD', currentPrice: 0.0, changePercentage: 0.0),
//           );

//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const GoldTitleWidget(),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(12, 0, 0, 0),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
//                     child: Column(
//                       children: [
//                         BidAskPriceWidget(
//                           bidPrice: goldSpotRate.currentPrice.toStringAsFixed(2),
//                           askPrice: (goldSpotRate.currentPrice + 0.10).toStringAsFixed(2),
//                         ),
//                         HighLowPriceWidget(
//                           highPrice: goldSpotRate.currentPrice.toStringAsFixed(2),
//                           lowPrice: (goldSpotRate.currentPrice - 0.10).toStringAsFixed(2),
//                         ),
//                         DiscountWidget(
//                           discountAmount: goldSpotRate.changePercentage.toStringAsFixed(2),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const ProductsTitleWidget(),
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(12, 0, 0, 0),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
//                       child: ListView(
//                         children: spotRates.map((rate) => 
//                           Padding(
//                             padding: const EdgeInsets.only(bottom: 8.0),
//                             child: ProductCard(
//                               title: rate.symbol,
//                               unit: '1GM',
//                               bidPrice: rate.currentPrice.toStringAsFixed(2),
//                               askPrice: (rate.currentPrice + 0.10).toStringAsFixed(2),
//                             ),
//                           )
//                         ).toList(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/spot_rate_controller.dart';
import '../widgets/home/product_card.dart';
import '../widgets/home/bid_ask_widget.dart';
import '../widgets/home/discount.dart';
import '../widgets/home/gold_title.dart';
import '../widgets/home/high_low_price.dart';
import '../widgets/home/product_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SpotRateController spotRateController = Get.find();

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (spotRateController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (spotRateController.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                'Error: ${spotRateController.errorMessage}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final spotRates = spotRateController.spotRates;
          
          // Find the primary gold spot rate (assuming the highest purity)
          final primaryGoldRate = spotRates.isNotEmpty 
            ? spotRates.reduce((a, b) => 
                double.parse(a.symbol.split(' ').last) > 
                double.parse(b.symbol.split(' ').last) 
                  ? a 
                  : b)
            : null;

          return RefreshIndicator(
            onRefresh: () => spotRateController.fetchSpotRates(),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GoldTitleWidget(),
                      
                      // Main Price and Metrics Container
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(12, 0, 0, 0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                          child: primaryGoldRate != null 
                            ? Column(
                                children: [
                                  BidAskPriceWidget(
                                    bidPrice: (primaryGoldRate.currentPrice - 10).toStringAsFixed(2),
                                    askPrice: primaryGoldRate.currentPrice.toStringAsFixed(2),
                                  ),
                                  HighLowPriceWidget(
                                    highPrice: (primaryGoldRate.currentPrice + 50).toStringAsFixed(2),
                                    lowPrice: (primaryGoldRate.currentPrice - 50).toStringAsFixed(2),
                                  ),
                                  const DiscountWidget(
                                    discountAmount: '3.0',
                                  ),
                                ],
                              )
                            : const Center(child: Text('No Gold Rates Available')),
                        ),
                      ),

                      const ProductsTitleWidget(),
                      
                      // Products List
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(12, 0, 0, 0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: spotRates.length,
                            itemBuilder: (context, index) {
                              final rate = spotRates[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ProductCard(
                                  title: rate.symbol,
                                  unit: '1GM',
                                  bidPrice: (rate.currentPrice - 10).toStringAsFixed(2),
                                  askPrice: rate.currentPrice.toStringAsFixed(2),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}