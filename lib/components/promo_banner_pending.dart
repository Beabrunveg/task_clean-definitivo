import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:ticket_clippers/ticket_clippers.dart';

class PromoBannerPending extends StatelessWidget {
  const PromoBannerPending({
    required this.title,
    required this.description,
    required this.onTap,
    super.key,
  });
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padSyH16,
      child: Align(
        child: TicketClipper(
          clipper: PointedEdgeClipper(
            edge: Edge.horizontal,
            points: 8,
          ),
          shadow: const BoxShadow(
            color: AppColors.gray50,
            offset: Offset(0, 2),
          ),
          shadowRadius: ShadowRadius.circular(2),
          child: Container(
            height: 68,
            decoration: BoxDecoration(
              color: AppColors.blue50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: padSyH16,
              child: Row(
                children: [
                  const Expanded(
                    child: Icon(Icons.check_circle, color: AppColors.white),
                  ),
                  space8,
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding: padSyV4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyleApp.h3.white.w600,
                          ),
                          Text(
                            description,
                            style: TextStyleApp.caption.white.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: onTap,
                      child: Container(
                        padding: padSy4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.white.withOpacity(0.7),
                            width: 2,
                          ),
                        ),
                        child: Text(
                          'ver más',
                          style: TextStyleApp.body.white.w700.copyWith(
                            color: AppColors.white.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
