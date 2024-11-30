import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/components/promo_banner_success.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router_provider.dart';
import 'package:taks_daily_app/core/router/router_provider.gr.dart';
import 'package:taks_daily_app/core/utils/methods/random_alfanumeric.dart';
import 'package:taks_daily_app/presentation/home/providers/coupon_register_provider.dart';
import 'package:taks_daily_app/presentation/home/providers/redeem_promo_provider.dart';
import 'package:taks_daily_app/presentation/home/providers/switch_button_provider.dart';
import 'package:taks_daily_app/presentation/home/providers/task_completed_provider.dart';
import 'package:taks_daily_app/presentation/home/providers/task_pending_provider.dart';
import 'package:taks_daily_app/presentation/home/widgets/widgets.dart';
import 'package:taks_daily_app/src/models/models.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    required this.email,
    super.key,
  });
  final String email;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void copyToClipboard(String code) {
    Clipboard.setData(ClipboardData(text: code)); // Copy to clipboard
  }

  /// List of promos data mock.
  final promosData = [
    {
      'title': 'Descuento de Kfc 50%',
      'discount': '50%',
      'description': '*Este descuento es valido para todos los productos'
          ' de la tienda.',
      'image': 'assets/img/kfc.png',
    },
    {
      'title': 'Descuento de Burger King 50%',
      'discount': '50%',
      'description': '*Este descuento es valido para combos.',
      'image': 'assets/img/burguerking.jpg',
    },
    {
      'title': 'Descuento de McDonalds 20%',
      'discount': '20%',
      'description': '*Este descuento es valido para combos.',
      'image': 'assets/img/macdonals.jpg',
    },
    {
      'title': 'Descuento de Pizza Hut 10%',
      'discount': '10%',
      'description': '*Este descuento es valido para pizzas.',
      'image': 'assets/img/pizzahut.jpg',
    },
    {
      'title': 'Descuento de Starbucks 5%',
      'discount': '5%',
      'description': '*Este descuento es valido para bebidas.',
      'image': 'assets/img/starbucks.jpg',
    },
  ];

  /// Show prize bottom sheet.
  void showCodePopup(BuildContext context, String code) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Código de descuento', style: TextStyleApp.h3),
          content: Container(
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
                  code,
                  style: TextStyleApp.h3,
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    copyToClipboard(code);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Code copied to clipboard'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                autoRouterPop(context);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('Close', style: TextStyleApp.h3),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Reference to the provider.
    final switchState = ref.watch(switchButtonProvider);
    final pendingNotifier = ref.watch(taskPendingNotifierProvider.notifier);
    final completedNotifier = ref.watch(taskCompletedNotifierProvider.notifier);
    final redeemNotifier = ref.watch(redeemPromoProvider.notifier).state;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '¡Bienvenido a Easy Clean!',
          style: Theme.of(context).textTheme.displaySmall!.w500,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(140),
          child: Column(
            children: [
              if (pendingNotifier.getTotalPendings() > 0 &&
                  !redeemNotifier &&
                  completedNotifier.getTotalCmpleted() >= 0)

                /// Promo banner pending.
                PromoBannerPending(
                  title: '¡Completa tus tareas!',
                  description:
                      'Te faltan ${pendingNotifier.getTotalPendings()} '
                      'tareas por completar, puedes ganar un premio.',
                  onTap: () =>
                      autoRouterPush(context, const PromotionsScreenRoute()),
                ),
              if (pendingNotifier.getTotalPendings() == 0 &&
                  !redeemNotifier &&
                  completedNotifier.getTotalCmpleted() == 0)

                /// Promo banner pending.
                PromoBannerPending(
                  title: '¡Empieza a registrar tareas!',
                  description: 'Registra una tarea para hoy y gana un premio.',
                  onTap: () =>
                      autoRouterPush(context, const PromotionsScreenRoute()),
                ),
              if (completedNotifier.getTotalCmpleted() > 0 &&
                  pendingNotifier.getTotalPendings() == 0)

                /// Promo banner success.
                PromoBannerSuccess(
                  title: '¡Felicidades!',
                  description: 'Has completado todas tus tareas de hoy,'
                      ' canjea tu premio.',
                  onTap: () {
                    final promo =
                        promosData[Random.secure().nextInt(promosData.length)];
                    if (redeemNotifier) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              '¡Ya canjeaste tu premio!',
                              style: TextStyleApp.h3.black.w500,
                            ),
                            content: Text(
                              'Agrega más tareas para ganar otro premio.',
                              style: TextStyleApp.body.black,
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Aceptar'),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }

                    /// Show prize bottom sheet.
                    showPrizeBottomSheet(
                      context,
                      () async {
                        final cod = generateAlphanumericCode(8);
                        final coupon = CouponData(
                          id: 0,
                          cod: cod,
                          date: DTForm.formatCurrentDate(),
                          discount: promo['discount'],
                          title: promo['title'],
                          description: promo['description'],
                        );
                        await ref
                            .read(couponRegisterNotifierProvider.notifier)
                            .onRegisterCoupon(
                              couponData: coupon,
                            );
                        ref.read(redeemPromoProvider.notifier).state = true;
                        showCodePopup(context, cod);
                      },
                      promo,
                    );
                  },
                ),
              gap8,
              Text(
                DTForm.formatCurrentDate(),
                style: TextStyleApp.h3.w500,
              ),
              gap8,
              Container(
                margin: padSyH16,
                child: switchButton(switchState),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            margin: padSyH8,
            decoration: const BoxDecoration(
              color: AppColors.blue100,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: AppColors.blue50,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => MenuDialog(
                    email: widget.email,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: buildListContent(switchState),
      floatingActionButton: FloatingActionButton(
        onPressed: () => autoRouterPush(context, const PersonScreenRoute()),
        child: const Icon(
          Icons.add_rounded,
          size: 32,
        ),
      ),
    );
  }

  Widget buildListContent(int index) {
    if (index == 0) {
      return const ListPending();
    }

    /// List completed.
    return const ListCompleted();
  }

  /// Switch button.
  Widget switchButton(int index) {
    if (index == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            height: 32,
            child: ButtonPrimary(
              verticalPadding: 4,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
              onPressed: () {
                ref.read(switchButtonProvider.notifier).state = 0;
              },
              label: 'Pendientes',
            ),
          ),
          SizedBox(
            width: 120,
            height: 32,
            child: ButtonSecondary(
              verticalPadding: 4,
              onPressed: () {
                ref.read(switchButtonProvider.notifier).state = 1;
              },
              label: 'Completados',
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
          ),
        ],
      );
    }

    /// Switch button.
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 120,
          height: 32,
          child: ButtonSecondary(
            verticalPadding: 4,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              bottomLeft: Radius.circular(6),
            ),
            onPressed: () {
              ref.read(switchButtonProvider.notifier).state = 0;
            },
            label: 'Pendientes',
          ),
        ),
        SizedBox(
          width: 120,
          height: 32,
          child: ButtonPrimary(
            verticalPadding: 4,
            onPressed: () {
              ref.read(switchButtonProvider.notifier).state = 1;
            },
            label: 'Completados',
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
          ),
        ),
      ],
    );
  }
}
