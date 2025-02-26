import 'package:flutter/material.dart';
import '../models/entities.dart';

class RecetaDiariaScreen extends StatefulWidget {
  const RecetaDiariaScreen({super.key, required this.receta});
  final Recipe receta;

  @override
  _RecetaDiariaScreenState createState() => _RecetaDiariaScreenState();
}

class _RecetaDiariaScreenState extends State<RecetaDiariaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00B894).withAlpha(100),
        title: Text(widget.receta.name),
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
            _FoodImage(imageUrl: widget.receta.imageUrl),
            const Text(
              'Prepara estos ingredientes',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  color: const Color(0xFF00B894).withAlpha(50),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: widget.receta.ingredients.map((ingrediente) {
                      return CheckboxListTile(
                        activeColor: const Color(0xFF00B894),
                        title: Text(ingrediente["nombre"] as String),
                        value: ingrediente["seleccionado"],
                        onChanged: (bool? nuevoValor) {
                          setState(() {
                            ingrediente["seleccionado"] = nuevoValor!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            const Text(
              'Preparación',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _RecipePreparation(instructions: widget.receta.instructions),
          ],
        ),
      ),
    );
  }
}

class _RecipePreparation extends StatelessWidget {
  final List<String> instructions;

  const _RecipePreparation({
    super.key,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          color: const Color(0xFF00B894).withAlpha(50),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(instructions.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${index + 1}. ",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        instructions[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _FoodImage extends StatelessWidget {
  final String imageUrl;
  const _FoodImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 15, left: 15, bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(imageUrl),
          width: double.infinity,
          height: 260,
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 700),
        ),
      ),
    );
  }
}
