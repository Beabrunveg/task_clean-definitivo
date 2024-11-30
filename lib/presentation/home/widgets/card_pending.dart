import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

///  CardPending is a widget that shows a card with the pending task information.
class CardPending extends StatelessWidget {
  const CardPending({
    required this.onTapCompleted,
    required this.onDelete,
    this.name = 'Alvaro jimenex',
    this.date = '27-10-2024',
    this.taskTitle = 'Nombre de la tarea',
    this.color = AppColors.blue50,
    super.key,
  });
  final String? name;
  final String? date;
  final String? taskTitle;
  final Color? color;
  final Function() onTapCompleted;

  final Function() onDelete;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onDelete();
        }
      },
      child: Container(
        margin: padSy8,
        padding: padSyV16.copyWith(right: 16),
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
            Expanded(
              flex: 2,
              child: CircleAvatar(
                backgroundColor: color,
                child: Text(
                  name![0].toUpperCase(),
                  style: TextStyleApp.h2Bold.white,
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          taskTitle ?? '',
                          style: TextStyleApp.h3.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.edit_rounded, color: color),
                      space8,
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    name ?? '',
                    style: TextStyleApp.body,
                    overflow:
                        TextOverflow.ellipsis, // Para evitar desbordamientos
                  ),
                  Text(
                    date ?? '',
                    style: TextStyleApp.body.gray,
                    overflow: TextOverflow
                        .ellipsis, // Evita desbordamientos en la fecha
                  ),
                ],
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: onTapCompleted,
                child: const Center(
                  child: Icon(
                    Icons.check_box_outline_blank_rounded,
                    color: AppColors.gray,
                    size: 34,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
