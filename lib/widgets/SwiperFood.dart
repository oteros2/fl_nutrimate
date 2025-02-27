import 'package:card_swiper/card_swiper.dart';
import 'package:fl_nutrimate/entities/entities.dart';
import 'package:fl_nutrimate/screens/cambio_receta_screen.dart';
import 'package:fl_nutrimate/screens/receta_diaria_screen.dart';
import 'package:flutter/material.dart';

class SwiperFood extends StatefulWidget {
  final List<Recipe> recipes;
  final IconData icon;
  const SwiperFood({
    super.key,
    required this.recipes,
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
          child:
              _SwiperTimeFoodLabel(widget: widget, currentIndex: currentIndex),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 200,
            child: Swiper(
              itemCount: widget.recipes.length,
              onIndexChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return _SwiperImage(
                  widget: widget,
                  receta: widget.recipes[index],
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
          widget.recipes[currentIndex].name,
        ),
        const Divider(),
      ],
    );
  }
}

class _SwiperTimeFoodLabel extends StatelessWidget {
  const _SwiperTimeFoodLabel({
    super.key,
    required this.widget,
    required this.currentIndex,
  });

  final SwiperFood widget;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.recipes[currentIndex].type.name.toUpperCase(),
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF00B894),
      ),
    );
  }
}

class _SwiperImage extends StatelessWidget {
  final Recipe receta;
  const _SwiperImage({
    super.key,
    required this.widget,
    required this.receta,
  });

  final SwiperFood widget;

  @override
  Widget build(BuildContext context) {
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
                    builder: (context) => RecetaDiariaScreen(receta: receta),
                  ),
                );
              },
              child: FadeInImage(
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(receta.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          _SwiperIcon(widget: widget),
        ],
      ),
    );
  }
}

class _SwiperIcon extends StatelessWidget {
  const _SwiperIcon({
    super.key,
    required this.widget,
  });

  final SwiperFood widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: CircleAvatar(
        backgroundColor: Colors.black54,
        radius: 18,
        child: IconButton(
          icon: Icon(widget.icon, color: Colors.white, size: 18),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CambioRecetaScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
