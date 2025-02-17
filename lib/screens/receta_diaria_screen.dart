import 'package:flutter/material.dart';

class RecetaDiariaScreen extends StatefulWidget {
  const RecetaDiariaScreen({super.key});

  @override
  _RecetaDiariaScreenState createState() => _RecetaDiariaScreenState();
}

class _RecetaDiariaScreenState extends State<RecetaDiariaScreen> {
  final List<Map<String, dynamic>> _ingredientes = [
    {"nombre": "Harina", "seleccionado": false},
    {"nombre": "Huevos", "seleccionado": false},
    {"nombre": "Leche", "seleccionado": false},
    {"nombre": "Azúcar", "seleccionado": false},
    {"nombre": "anchoas", "seleccionado": false}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00B894).withAlpha(100),
        title: const Text('receta.nombre'),
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
            const _FoodImage(),
            const Text(
              'Prepara estos ingredientes',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: const Color(0xFF00B894).withAlpha(50),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: _ingredientes.map((ingrediente) {
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
            const Text(
              'Preparación',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const _RecipePreparation()
          ],
        ),
      ),
    );
  }
}

class _RecipePreparation extends StatelessWidget {
  const _RecipePreparation({
    super.key,
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
          child: const Text(
              'Irure quis ut quis occaecat qui do nulla consequat nostrud. Anim non occaecat velit nostrud cupidatat laborum aliquip velit mollit officia aliquip dolore. Est aliqua eu sint laborum quis esse. Dolore qui minim amet eu occaecat aliqua dolor labore est quis nisi incididunt occaecat. Ipsum mollit occaecat exercitation proident. Ea ex ullamco dolore sunt consectetur sunt duis dolor elit incididunt dolor magna. Deserunt magna tempor aliqua adipisicing officia ex mollit. Veniam proident ut nisi proident ex eiusmod sunt incididunt mollit reprehenderit. Nulla officia consequat fugiat voluptate voluptate anim magna nisi officia dolor veniam. Duis quis incididunt Lorem in. Commodo eiusmod dolore minim dolore culpa reprehenderit pariatur cillum. Laboris anim minim velit laborum dolor in consequat culpa. Occaecat ad sint magna sit. Et mollit esse sint do cillum eiusmod commodo tempor amet pariatur sint eu pariatur veniam. Nostrud elit cupidatat id sit anim laboris velit nostrud. Dolore laboris cillum commodo consequat incididunt nostrud amet elit amet ipsum fugiat ut. Irure minim et commodo sunt nisi nostrud esse non ut ea fugiat incididunt ipsum. Cupidatat laborum cillum cupidatat aute nisi exercitation esse ex aliquip aliquip magna id. Duis velit aliquip duis cillum. Consectetur ut reprehenderit sit culpa deserunt ea excepteur proident labore voluptate dolor ullamco cillum.'),
        ),
      ),
    );
  }
}

class _FoodImage extends StatelessWidget {
  const _FoodImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 15, left: 15, bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
              'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fbuenprovecho.hn%2Fwp-content%2Fuploads%2F2022%2F03%2FSalsa-BBQ-Hunt%25C2%25B4s-2.png&f=1&nofb=1&ipt=0665fff2f033993c951704f3bc57c8826a2e2291b3f2ba98e1cc5f68c426ec75&ipo=images'),
          width: double.infinity,
          height: 260,
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 700),
        ),
      ),
    );
  }
}
