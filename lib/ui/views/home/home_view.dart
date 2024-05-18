import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:gaml/ui/common/app_colors.dart';
import 'package:gaml/ui/common/app_strings.dart';
import 'package:gaml/ui/widget/portfolio_card_widget.dart';
import 'package:gaml/ui/widget/investment_detail_widget.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Reduced padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.lightGreen,
                    child: Text('JD', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.welcome, style: TextStyle(color: AppColors.greyText)),
                      Text(AppStrings.name, style: TextStyle(fontSize: 18,  color: AppColors.darkText)),
                    ],
                  ),
                  const Spacer(),
                  Image.asset('assets/icons/Clip path group.png'),
                ],
              ),
              const SizedBox(height: 16),

              // Portfolio Card
              const PortfolioCard(),
              const SizedBox(height: 16),

              // KYC and Transactions
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 250, // Reduced width
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        AppStrings.completeKYC,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 150, 
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        AppStrings.transactionPin,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // KYC Information
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 280, // Reduced width
                      height: 50,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(8.0), // Reduced padding
                      decoration: const BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.info, color: AppColors.yellow),
                          SizedBox(width: 8),
                          Text(AppStrings.updateKYC),
                        ],
                      ),
                    ),

                    // Transaction Pin
                    Container(
                      width: 280, // Reduced width
                      height: 50,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(8.0), // Reduced padding
                      decoration: const BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.info, color: AppColors.yellow),
                          SizedBox(width: 8),
                          Text(AppStrings.updatePin),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Investment Details
              // Mutual Fund
              const InvestmentDetail(
                title: AppStrings.mutualFund,
                value: AppStrings.mutualFundValue,
                icon: Icons.account_balance_wallet,
              ),
              const Divider(color: Color(0xFFDDDDDD), height: 4),
              const InvestmentDetail(
                title: AppStrings.placement,
                value: AppStrings.placementValue,
                icon: Icons.attach_money,
              ),
              const Divider(color: Color(0xFFDDDDDD), height: 4),
              const InvestmentDetail(
                title: AppStrings.totalAccruedInterest,
                value: AppStrings.accruedInterestValue,
                icon: Icons.money,
                showArrow: false,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 13),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.totalDividendPaid, style: TextStyle(fontSize: 10, color: AppColors.greyText)),
                        SizedBox(height: 4),
                        Text(
                          AppStrings.dividendPaidValue,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.darkText),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.totalInterestPaid, style: TextStyle(fontSize: 10, color: AppColors.greyText)),
                        SizedBox(height: 4),
                        Text(
                          AppStrings.interestPaidValue,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.darkText),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/home_vector.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/menu_vector.png')),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/vector_settings.png')),
            label: 'Settings',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: AppColors.primaryGreen,
        unselectedItemColor: const Color(0xFFDDDDDD),
        // handle navigation
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
