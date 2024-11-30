import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

class ButtonSecondary extends StatelessWidget {
  const ButtonSecondary({
    required this.onPressed,
    required this.label,
    this.borderRadius,
    this.backgroundColor = AppColors.gray50,
    this.verticalPadding = 16,
    super.key,
  });
  final VoidCallback onPressed;
  final String label;

  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: 50,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: padSy16.copyWith(
            bottom: verticalPadding,
            top: verticalPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(6),
            side: const BorderSide(
              color: AppColors.blue50,
              width: 0.5,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(label, style: TextStyleApp.body.blue50.w500),
      ),
    );
  }
}
