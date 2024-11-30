//create showDialog with congratulation promo win.

import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

void showPrizeBottomSheet(
  BuildContext context,
  Function() onRedeem,
  Map<String, String> promo,
) {
  Confetti.launch(
    context,
    options: const ConfettiOptions(
      particleCount: 300,
      spread: 80,
      y: 0.8,
    ),
  );
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Padding(
            padding: padSy16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                gap10,
                Text(
                  '¡Felicidades! Ganaste un Premio',
                  style: TextStyleApp.h1.black.w600,
                ),
                gap20,
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    promo['image']!,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                gap20,
                Text(
                  promo['title']!,
                  style: TextStyleApp.h3.green.w600,
                ),
                gap16,
                Text(
                  '¡Disfruta de un increíble ${promo['discount']} de '
                  'descuento en nuestra tienda por tiempo limitado!',
                  style: TextStyleApp.h3.gray,
                  textAlign: TextAlign.center,
                ),
                gap20,
                ElevatedButton(
                  onPressed: onRedeem,
                  child: Text(
                    'Canjear Premio',
                    style: TextStyleApp.h3.blue200.w700,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cerrar'),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
