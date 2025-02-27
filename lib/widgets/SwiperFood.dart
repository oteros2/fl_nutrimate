import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../models/entities.dart';
import '../screens/screens.dart';

class SwiperFood extends StatefulWidget {
  final List<Recipe> recipes;
  final IconData icon;
  final bool isSelectionMode;
  final Function(Recipe)? onRecipeSelect;
  
  const SwiperFood({
    super.key,
    required this.recipes,
    required this.icon,
    this.isSelectionMode = false,
    this.onRecipeSelect,
  });

  @override
  State<SwiperFood> createState() => _SwiperFoodState();
}

class _SwiperFoodState extends State<SwiperFood> {
  int currentIndex = 0;

  void updateRecipe(Recipe newRecipe) {
    setState(() {
      widget.recipes[currentIndex] = newRecipe;
    });
  }

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
                  index: index,
                  onRecipeChanged: updateRecipe,
                  isSelectionMode: widget.isSelectionMode,
                  onRecipeSelect: widget.onRecipeSelect,
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
  final int index;
  final Function(Recipe) onRecipeChanged;
  final bool isSelectionMode;
  final Function(Recipe)? onRecipeSelect;
  
  const _SwiperImage({
    super.key,
    required this.widget,
    required this.receta,
    required this.index,
    required this.onRecipeChanged,
    this.isSelectionMode = false,
    this.onRecipeSelect,
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
                placeholder: const AssetImage('assets/images/loading.gif'),
                image: NetworkImage(receta.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          _SwiperIcon(
            widget: widget,
            receta: receta,
            index: index,
            onRecipeChanged: onRecipeChanged,
            isSelectionMode: isSelectionMode,
            onRecipeSelect: onRecipeSelect,
          ),
        ],
      ),
    );
  }
}

class _SwiperIcon extends StatelessWidget {
  const _SwiperIcon({
    super.key,
    required this.widget,
    required this.receta,
    required this.index,
    required this.onRecipeChanged,
    required this.isSelectionMode,
    this.onRecipeSelect,
  });

  final SwiperFood widget;
  final Recipe receta;
  final int index;
  final Function(Recipe) onRecipeChanged;
  final bool isSelectionMode;
  final Function(Recipe)? onRecipeSelect;

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
          onPressed: () async {
            if (isSelectionMode && onRecipeSelect != null) {
              onRecipeSelect!(receta);
            } else {
              final recetaSeleccionada = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CambioRecetaScreen(
                    recetaOriginal: receta,
                  ),
                ),
              );
              if (recetaSeleccionada != null) {
                onRecipeChanged(recetaSeleccionada);
              }
            }
          },
        ),
      ),
    );
  }
}
