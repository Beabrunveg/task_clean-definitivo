import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

@RoutePage()
class TipsCleanScreen extends ConsumerStatefulWidget {
  const TipsCleanScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TipsCleanScreenState();
}

class _TipsCleanScreenState extends ConsumerState<TipsCleanScreen> {
  /// List of tips.
  final tips = [
    {
      'title': 'Organiza tu espacio de trabajo',
      'category': 'Organización',
      'description': 'Dedica 10 minutos cada día a ordenar tu escritorio.'
          ' Un espacio limpio mejora la productividad.',
      'image': 'assets/img/org1.png',
    },
    {
      'title': 'Planifica tus compras',
      'category': 'Compras',
      'description': 'Antes de ir al supermercado, haz una lista de los '
          'productos que realmente necesitas para evitar compras innecesarias.',
      'image': 'assets/img/planifica.jpg',
    },
    {
      'title': 'Limpia mientras cocinas',
      'category': 'Limpieza',
      'description': 'Ahorra tiempo limpiando los utensilios y superficies '
          'mientras cocinas, en lugar de dejarlo todo para después.',
      'image': 'assets/img/limpia_cocina.jpeg',
    },
    {
      'title': 'Usa un calendario para las tareas del hogar',
      'category': 'Organización',
      'description': 'Asignar días específicos para limpiar distintas '
          'áreas de la casa te ayudará a mantener todo bajo control'
          ' sin abrumarte.',
      'image': 'assets/img/calendario.jpg',
    },
    {
      'title': 'Compra productos a granel',
      'category': 'Compras',
      'description': 'Comprar a granel puede ser más económico y te'
          ' ayuda a reducir el uso de envases plásticos, beneficiando'
          ' al medio ambiente.',
      'image': 'assets/img/granel.jpeg',
    },
    {
      'title': 'Limpia ventanas con vinagre',
      'category': 'Limpieza',
      'description': 'Utiliza una mezcla de agua y vinagre para limpiar'
          ' vidrios y ventanas de manera ecológica y efectiva.',
      'image': 'assets/img/l_vinagre.jpg',
    },
    {
      'title': 'Decluttering mensual',
      'category': 'Organización',
      'description': 'Cada mes, revisa tus pertenencias y deshazte de'
          ' lo que ya no necesitas para evitar la acumulación de objetos.',
      'image': 'assets/img/decluttering.jpeg',
    },
    {
      'title': 'Usa bolsas reutilizables',
      'category': 'Compras',
      'description': 'Lleva tus propias bolsas reutilizables cuando'
          ' vayas de compras para reducir el uso de plástico.',
      'image': 'assets/img/bolsas_reuzables.jpg',
    },
    {
      'title': 'Limpia tu nevera semanalmente',
      'category': 'Limpieza',
      'description': 'Revisa y limpia tu refrigerador una vez a la'
          ' semana para evitar malos olores y desperdicio de alimentos.',
      'image': 'assets/img/l_nevera.jpeg',
    },
    {
      'title': 'Prioriza tareas pequeñas',
      'category': 'Organización',
      'description': 'Completar pequeñas tareas rápidamente te da '
          'una sensación de logro y te ayuda a mantener la motivación '
          'para abordar tareas más grandes.',
      'image': 'assets/img/tareas_pe.jpeg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consejos Útiles', style: TextStyleApp.h2BSmall.w500),
      ),
      body: ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, index) {
          final tip = tips[index];
          return TipCard(
            title: tip['title']!,
            description: tip['description']!,
            image: tip['image']!,
            category: tip['category']!,
          );
        },
      ),
    );
  }
}

class TipCard extends StatelessWidget {
  const TipCard({
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    super.key,
  });

  final String title;
  final String description;
  final String image;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: padSy12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: padSy16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyleApp.h3.w700,
                ),
                gap10,
                Text(
                  category.toUpperCase(),
                  style: TextStyleApp.body,
                ),
                gap10,
                Text(
                  description,
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
                gap10,
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.tips_and_updates_rounded,
                    color: AppColors.white,
                  ),
                  label: Text(
                    'Gran consejo',
                    style: TextStyleApp.body.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
