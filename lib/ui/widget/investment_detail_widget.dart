import 'package:flutter/material.dart';
import 'package:gaml/ui/common/app_colors.dart';

class InvestmentDetail extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final bool showArrow;

  const InvestmentDetail({
    required this.title,
    required this.value,
    required this.icon,
    this.showArrow = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: AppColors.lightGreen,
          child: Icon(
            icon,
            color: AppColors.primaryGreen,
          ),
        ),
        title: Text(title, style: const TextStyle(fontSize: 12)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                value,
                style: const TextStyle(color: AppColors.primaryGreen),
              ),
            ),
            if (showArrow)
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }
}