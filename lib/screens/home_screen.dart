import 'package:NutriMate/widgets/food_carousel.dart';
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
            overlayColor: WidgetStateProperty.all(Colors.transparent),
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

class food extends StatelessWidget {
  const food({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 300,
                height: 300,
                color: Colors.red,
              ),
              Container(
                width: 300,
                height: 300,
                color: Colors.yellow,
              ),
              Container(
                width: 300,
                height: 300,
                color: Colors.green,
              ),
            ],
          )
        ],
      ),
    );
  }
}
