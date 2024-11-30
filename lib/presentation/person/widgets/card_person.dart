import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
/// [CardPerson] is a widget that shows the person data.
class CardPerson extends StatelessWidget {
  const CardPerson({
    required this.onDelete,
    this.name = 'Alvaro Jimenez',
    this.aviailability = 'Disponibilidad por las mañanas',
    this.age = '18',
    this.pathImage = '',
    super.key,
  });
  final String name;
  final String aviailability;
  final String age;
  final String pathImage;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: padSy16,
          margin: padSy16,
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyleApp.h2.w500),
                  Text(
                    aviailability,
                    style: TextStyleApp.body,
                  ),
                  Text(
                    'Edad: $age',
                    style: TextStyleApp.body,
                  ),
                  gap16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: onDelete,
                        icon: const Icon(
                          Icons.delete_forever_outlined,
                          color: AppColors.blue50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.file(
                  File(pathImage),
                  width: 100,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 32,
          bottom: 0,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.blue50,
            child: Text(
              name[0].toUpperCase(),
              style: TextStyleApp.h2Bold.white,
            ),
          ),
        ),
      ],
    );
  }
}
