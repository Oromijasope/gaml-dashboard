import 'package:flutter/material.dart';
import 'package:gaml/ui/common/app_colors.dart';
import 'package:gaml/ui/common/app_strings.dart';
import 'package:gaml/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PortfolioCard extends ViewModelWidget<HomeViewModel> {
  const PortfolioCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/card_gradient.png'),
            fit: BoxFit.contain,
          ),
          color: AppColors.primaryGreen,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.totalPortfolio,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: viewModel.changetext,
                  child: Image.asset(
                    'assets/icons/hide_vector.png',
                    height: 24,
                    width: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            viewModel.currencyValue == "****"
                ? const Text(
                    "****",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: '\$3,150,000.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(0, 5),
                            child: const Text(
                              '00',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            const SizedBox(height: 8),
            Container(
              width: 280,
              height: 32,
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: AppColors.white30,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/arrow_down_vector.png'),
                    const SizedBox(width: 8),
                    const Text(
                      AppStrings.switchCurrency,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}