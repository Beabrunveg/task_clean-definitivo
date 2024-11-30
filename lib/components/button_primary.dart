import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    required this.onPressed,
    required this.label,
    this.borderRadius,
    this.verticalPadding = 16,
    super.key,
  });
  final VoidCallback onPressed;
  final String label;
  final BorderRadius? borderRadius;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(6),
        color: AppColors.blue50,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(6),
          ),
          backgroundColor: AppColors.blue50,
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyleApp.body.white.w500,
          ),
        ),
      ),
    );
  }
}
