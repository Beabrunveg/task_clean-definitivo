import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

/// Promotions Screen widget.
@RoutePage()
class PromotionsScreen extends ConsumerStatefulWidget {
  const PromotionsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PromotionsScreenState();
}

class _PromotionsScreenState extends ConsumerState<PromotionsScreen> {
  /// List of promotions.
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Promociones',
          style: TextStyleApp.h2BSmall.w500,
        ),
      ),
      body: ListView.builder(
        itemCount: promosData.length,
        itemBuilder: (context, index) {
          final promo = promosData[index];
          return CardPromo(
            title: promo['title']!,
            description: promo['description']!,
            image: promo['image']!,
            discount: promo['discount']!,
          );
        },
      ),
    );
  }
}

/// Card promo widget.
class CardPromo extends StatelessWidget {
  const CardPromo({
    required this.title,
    required this.description,
    required this.image,
    required this.discount,
    super.key,
  });

  final String title;
  final String description;
  final String image;
  final String discount;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: padSy16,
      elevation: 4,
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Text(title),
                subtitle: Text(description),
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
                  discount,
                  style: TextStyleApp.h1.white.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
