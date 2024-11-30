import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/presentation/history_cod_redeem/providers/history_cod_redeem_provider.dart';

/// Widget to display the list of redeemed codes.
class ListHistoryCodRedeem extends ConsumerWidget {
  const ListHistoryCodRedeem({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(historyCodRedeemNotifierProvider.notifier);
    final state = ref.watch(historyCodRedeemNotifierProvider);
    return state.when(
      data: (data) {
        final coupons = data ?? [];
        if (coupons.isEmpty) {
          return Center(
            child: Text(
              'No has canjeado códigos',
              style: TextStyleApp.body.blue50.w500,
            ),
          );
        }
        return ListView.builder(
          padding: padSy16,
          itemCount: coupons.length,
          itemBuilder: (context, index) {
            final coupon = coupons[index];
            return Card(
              margin: padSy16,
              elevation: 4,
              child: Stack(
                children: [
                  Column(
                    children: [
                      ListTile(
                        title: Text(
                          coupon.title ?? '',
                          style: TextStyleApp.bodyBold.w500,
                        ),
                        subtitle: Text(
                          coupon.description ?? '',
                          style: TextStyleApp.body,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.blue100,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            space16,
                            Text(
                              'Código: ${coupon.cod ?? ''}',
                              style: TextStyleApp.h3,
                            ),
                            IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(text: coupon.cod ?? ''),
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Código copiado',
                                      style: TextStyleApp.body,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: padSy8,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: AppColors.green50,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          coupon.discount ?? '',
                          style: TextStyleApp.h1.white.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(
            'Error: $error',
            style: TextStyleApp.body.red.w500,
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
