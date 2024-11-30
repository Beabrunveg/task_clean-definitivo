import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
///  [CardCompleted] is a widget that shows the completed tasks.
class CardCompleted extends StatelessWidget {
  const CardCompleted({
    this.name = 'Alvaro jimenex',
    this.date = '27-10-2024',
    this.taskTitle = 'Nombre de la tarea',
    this.color = AppColors.blue50,
    this.comment,
    this.pathImage,
    super.key,
  });
  final String? taskTitle;
  final String? name;
  final String? date;
  final Color? color;
  final String? comment;
  final String? pathImage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: padSy16,
      padding: padSy16.copyWith(
        left: 0,
        top: 0,
        bottom: 0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray50.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 10,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  bottomLeft: Radius.circular(6),
                ),
                child: ColoredBox(color: color!),
              ),
            ),
            Expanded(
              child: Padding(
                padding: padSy16.copyWith(
                  right: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.47,
                              child: Text(
                                taskTitle ?? '',
                                style: TextStyleApp.h3.w500.copyWith(
                                  color: color,
                                ),
                              ),
                            ),
                            Text(
                              name ?? '',
                              style: TextStyleApp.body,
                            ),
                            Text(
                              date ?? '',
                              style: TextStyleApp.body.gray,
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.file(
                            File(pathImage!),
                            width: 130,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    gap16,
                    Container(
                      height: 80,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: AppColors.bg,
                        border: Border.all(
                          color: AppColors.gray50,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        comment ?? '',
                        style: TextStyleApp.body,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
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
