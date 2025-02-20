import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class RecetasSemanalesScreen extends StatelessWidget {
  const RecetasSemanalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MealData> meals = [
      MealData(
        imageUrl:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fgourmetdemexico.com.mx%2Fwp-content%2Fuploads%2F2022%2F12%2Fpiedras-cocina-mexicana-1024x597.jpg&f=1&nofb=1&ipt=e14e9f81db134b342169c81535ff2e15b900c41c1b92b07697ac6ae629a9d48c&ipo=images',
        type: MealType.desayuno,
        dinner: 'Huevos con frijoles',
      ),
      MealData(
        imageUrl:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Festoyhechouncocinillas.com%2Fwp-content%2Fuploads%2F2017%2F12%2Fpizza-de-anchoas.jpg&f=1&nofb=1&ipt=ad72bf75e8b12554ee2057e27c406fde9b3102ef3370038b0b806d58c7daa4a9&ipo=images',
        type: MealType.almuerzo,
        dinner: 'Pizza de anchoas',
      ),
      MealData(
        imageUrl:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Felgourmet.s3.amazonaws.com%2Frecetas%2Fcover%2Fpizza_pJzhoGXteBP8HmSf6r1jQlZ49MLRy5.png&f=1&nofb=1&ipt=a86f5fb3db39a5ec82795ad398155a1263a4ed9e00fdf2a33de4e7308b632256&ipo=images',
        type: MealType.cena,
        dinner: 'Paninis de peperoni',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00B894).withAlpha(100),
        title: const Text('Recetas Semanales'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              child: Text("A16"),
              backgroundColor: Colors.green,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SwiperFoodLabel(day: 'Lunes', label: "Dieta del día"),
            SwiperFood(meals: meals, icon: Icons.edit),
            const SwiperFoodLabel(day: 'Martes', label: "Dieta del día"),
            SwiperFood(meals: meals, icon: Icons.edit),
            const SwiperFoodLabel(day: 'Miércoles', label: "Dieta del día"),
            SwiperFood(meals: meals, icon: Icons.edit),
            const SwiperFoodLabel(day: 'Jueves', label: "Dieta del día"),
            SwiperFood(meals: meals, icon: Icons.edit),
            const SwiperFoodLabel(day: 'Viernes', label: "Dieta del día"),
            SwiperFood(meals: meals, icon: Icons.edit),
            const SwiperFoodLabel(day: 'Sábado', label: "Dieta del día"),
            SwiperFood(meals: meals, icon: Icons.edit),
            const SwiperFoodLabel(day: 'Domingo', label: "Dieta del día"),
            SwiperFood(meals: meals, icon: Icons.edit),
          ],
        ),
      ),
    );
  }
}
