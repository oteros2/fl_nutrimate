import 'package:NutriMate/widgets/workfine.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../models/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppbar(
              title: 'Inicio',
              user: user), // Asegúrate de que este sea un SliverAppBar
        ],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DialogFb1(),
              HorizontalCategoriesView(),
              Food(),
            ],
          ),
        ),
      ),
    );
  }
}

class Category {
  final String title;
  bool isSelected;
  Category(this.title, this.isSelected);
}

List<Category> categoryList = [
  Category("Desayuno", true),
  Category("Almuerzo", false),
  Category("Merienda", false),
  Category("Cena", false),
];

class HorizontalCategoriesView extends StatefulWidget {
  const HorizontalCategoriesView({Key? key}) : super(key: key);

  @override
  State<HorizontalCategoriesView> createState() =>
      _HorizontalCategoriesViewState();
}

class _HorizontalCategoriesViewState extends State<HorizontalCategoriesView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            category: categoryList[index],
            onPressed: (b) {
              categoryList.forEach((category) {
                category.isSelected = false;
              });
              setState(() {
                categoryList[index].isSelected = true;
              });
            },
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  final Category category;
  final Function(bool) onPressed;

  const CategoryCard(
      {required this.category, required this.onPressed, Key? key})
      : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color:
              widget.category.isSelected ? Colors.white : Colors.transparent),
      child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            widget.onPressed(true);
          },
          child: Text(widget.category.title,
              style: TextStyle(
                  color: widget.category.isSelected
                      ? Colors.black
                      : Colors.grey))),
    );
  }
}

class Food extends StatelessWidget {
  const Food({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/images/cocktel.png',
      'assets/images/ensalada.png',
      'assets/images/spaguetis.png',
      'assets/images/tarta.png',
    ];

    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 8.0), // Espaciado
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), // Bordes redondeados
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15), // Bordes en la imagen
              child: Image.asset(
                imagePaths[index],
                fit: BoxFit.cover, // Ajusta la imagen
              ),
            ),
          );
        },
      ),
    );
  }
}
