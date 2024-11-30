import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taks_daily_app/presentation/history_cod_redeem/widgets/widgets.dart';

/// Screen widget to display the history of redeemed codes.
@RoutePage()
class HistoryCodRedeemScreen extends ConsumerWidget {
  const HistoryCodRedeemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Historial de códigos canjeados',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: const ListHistoryCodRedeem(),
    );
  }
}
