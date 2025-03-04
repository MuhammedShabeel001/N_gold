import 'package:flutter/material.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GoldTitleWidget(),
              const BidAskPriceWidget(),
              const HighLowPriceWidget(),
              const DiscountWidget(),
              const ProductsTitleWidget(),
              Expanded(
                child: ListView(
                  children: const [
                    ProductCard(
                      title: 'TEN TOLA BAR',
                      unit: '1TTB',
                      bidPrice: '40137',
                      askPrice: '40137',
                    ),
                    SizedBox(height: 8),
                    ProductCard(
                      title: 'GOLD 22 KT',
                      unit: '1GM',
                      bidPrice: '316.98',
                      askPrice: '317.09',
                    ),
                    SizedBox(height: 8),
                    ProductCard(
                      title: 'GOLD 9999',
                      unit: '1GM',
                      bidPrice: '344.45',
                      askPrice: '344.56',
                    ),
                    SizedBox(height: 8),
                    ProductCard(
                      title: 'KILOBAR 995',
                      unit: '1KG',
                      bidPrice: '342790',
                      askPrice: '342889',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
