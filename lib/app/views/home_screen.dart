import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gold/app/utils/app_assets.dart';
import '../controllers/spot_rate_controller.dart';
import '../widgets/custom_loading.dart';
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
            return custom_loading( icon: khomeloading,);
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

          final primaryGoldRate = spotRates.isNotEmpty
              ? spotRates.reduce((a, b) =>
                  double.parse(a.symbol.split(' ').last) >
                          double.parse(b.symbol.split(' ').last)
                      ? a
                      : b)
              : null;

          return RefreshIndicator(
            onRefresh: () => spotRateController.fetchSpotRates(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GoldTitleWidget(),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(12, 0, 0, 0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 12),
                          child: primaryGoldRate != null
                              ? Column(
                                  spacing: 12,
                                  children: [
                                    BidAskPriceWidget(
                                      bidPrice:
                                          (primaryGoldRate.currentPrice - 10)
                                              .toStringAsFixed(2),
                                      askPrice: primaryGoldRate.currentPrice
                                          .toStringAsFixed(2),
                                    ),
                                    HighLowPriceWidget(
                                      highPrice:
                                          (primaryGoldRate.currentPrice + 50)
                                              .toStringAsFixed(2),
                                      lowPrice:
                                          (primaryGoldRate.currentPrice - 50)
                                              .toStringAsFixed(2),
                                    ),
                                    const DiscountWidget(
                                      discountAmount: '3.0',
                                    ),
                                  ],
                                )
                              : const Center(
                                  child: Text('No Gold Rates Available')),
                        ),
                      ),
                      const ProductsTitleWidget(),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(12, 0, 0, 0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 20),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: spotRates.length,
                            itemBuilder: (context, index) {
                              final rate = spotRates[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ProductCard(
                                  title: rate.symbol,
                                  unit: '1GM',
                                  bidPrice: (rate.currentPrice - 10)
                                      .toStringAsFixed(2),
                                  askPrice:
                                      rate.currentPrice.toStringAsFixed(2),
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


