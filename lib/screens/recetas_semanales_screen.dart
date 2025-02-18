import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

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
            const DayLabel(day: 'Lunes'),
            SwiperFood(meals: meals),
            const DayLabel(day: 'Martes'),
            SwiperFood(meals: meals),
            const DayLabel(day: 'Miércoles'),
            SwiperFood(meals: meals),
            const DayLabel(day: 'Jueves'),
            SwiperFood(meals: meals),
            const DayLabel(day: 'Viernes'),
            SwiperFood(meals: meals),
            const DayLabel(day: 'Sábado'),
            SwiperFood(meals: meals),
            const DayLabel(day: 'Domingo'),
            SwiperFood(meals: meals),
          ],
        ),
      ),
    );
  }
}

enum MealType { desayuno, almuerzo, cena }

class MealData {
  final String imageUrl;
  final MealType type;
  final String dinner;

  MealData({
    required this.imageUrl,
    required this.type,
    required this.dinner,
  });
}

class DayLabel extends StatelessWidget {
  final String day;
  final String? label;

  const DayLabel({
    super.key,
    required this.day,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Container(
          color: const Color(0xFF00B894).withAlpha(50),
          child: ListTile(
            title: Text(day),
            subtitle: Text(label ?? 'Dieta del día'),
          ),
        ),
      ],
    );
  }
}

class SwiperFood extends StatefulWidget {
  final List<MealData> meals;

  const SwiperFood({
    super.key,
    required this.meals,
  });

  @override
  State<SwiperFood> createState() => _SwiperFoodState();
}

class _SwiperFoodState extends State<SwiperFood> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            widget.meals[currentIndex].type.name.toUpperCase(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00B894),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 200,
            child: Swiper(
              itemCount: widget.meals.length,
              onIndexChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned.fill(
                        child: FadeInImage(
                          placeholder: const AssetImage('assets/loading.gif'),
                          image: NetworkImage(widget.meals[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: CircleAvatar(
                          backgroundColor: Colors.black54,
                          radius: 18,
                          child: IconButton(
                            icon: const Icon(Icons.edit,
                                color: Colors.white, size: 18),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  activeColor: const Color(0xFF00B894),
                  color: const Color(0xFF00B894).withAlpha(50),
                ),
              ),
              control: const SwiperControl(color: Color(0xFF00B894)),
            ),
          ),
        ),
        Text(
          widget.meals[currentIndex].dinner,
        ),
      ],
    );
  }
}
