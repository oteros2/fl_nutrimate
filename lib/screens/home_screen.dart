import 'package:NutriMate/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/entities.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});

  final Usuario user;

  @override
  Widget build(BuildContext context) {
    final Usuario usuario = Provider.of<UserProvider>(context).usuario!;
    final String nombre = usuario.name;
    final String apellido = usuario.lastName.split(" ")[0];

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppbar(
              title: "Hola" + " " + nombre + " " + apellido,
              user: usuario), // Asegúrate de que este sea un SliverAppBar
        ],
        body: SingleChildScrollView(
          child: Wrap(
            children: [
              const SwiperFoodLabel(day: 'Lunes', label: "Dieta del día"),
              SwiperFood(recipes: recipes, icon: Icons.edit),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 200,
                  child: Column(
                    children: [
                      CalendarioWidget(),
                    ],
                  ))
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
    return Column(
      children: [
        SizedBox(
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
        ),
      ],
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
