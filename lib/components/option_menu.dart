import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

class OptionMenu extends StatelessWidget {
  const OptionMenu({
    required this.title,
    required this.onPressed,
    required this.icon,
    super.key,
  });
  final String title;
  final Function() onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padSy16.copyWith(
        top: 14,
        left: 28,
        right: 28,
        bottom: 0,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Row(
              children: [
                icon,
                space16,
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge!.w300,
                ),
              ],
            ),
            const Divider(
              height: 8,
              color: AppColors.gray200,
              thickness: 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
