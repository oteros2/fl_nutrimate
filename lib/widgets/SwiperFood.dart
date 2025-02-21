import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../screens/screens.dart';

enum MealType { desayuno, almuerzo, cena }

class MealData {
  final String imageUrl;
  final MealType? type;
  final String dinner;

  MealData({
    required this.imageUrl,
    this.type,
    required this.dinner,
  });
}

class SwiperFood extends StatefulWidget {
  final List<MealData> meals;
  final IconData icon;
  const SwiperFood({
    super.key,
    required this.meals,
    required this.icon,
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
            widget.meals[currentIndex].type?.name.toUpperCase() ?? '',
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RecetaDiariaScreen(),
                              ),
                            );
                          },
                          child: FadeInImage(
                            placeholder:
                                const AssetImage('assets/images/loading.gif'),
                            image: NetworkImage(widget.meals[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: CircleAvatar(
                          backgroundColor: Colors.black54,
                          radius: 18,
                          child: IconButton(
                            icon: Icon(widget.icon,
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
