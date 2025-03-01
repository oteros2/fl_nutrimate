import 'entities.dart';

final List<Recipe> recipes = [
  Recipe(
    name: "Panqueques de avena",
    imageUrl:
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.rionegro.com.ar%2Fwp-content%2Fuploads%2F2022%2F02%2FPanqueques-de-avena-tres-recetas.jpg&f=1&nofb=1&ipt=e51822a1f52fc193020b20ef7c594d843e11afab4500a392ca8ea3c8f78a8859&ipo=images",
    ingredients: [
      {"ingredientName": "1 taza de avena", "isSelected": false},
      {"ingredientName": "1 huevo", "isSelected": false},
      {"ingredientName": "1/2 taza de leche", "isSelected": false},
      {"ingredientName": "1 cucharadita de polvo de hornear", "isSelected": false},
      {"ingredientName": "1 cucharadita de miel", "isSelected": false},
    ],
    instructions: [
      "Mezclar todos los ingredientes en una licuadora hasta obtener una mezcla homogénea.",
      "Calentar una sartén y verter porciones de la mezcla.",
      "Cocinar hasta que aparezcan burbujas en la superficie, luego voltear.",
      "Servir con frutas o miel al gusto."
    ],
    type: MealType.breakfast,
  ),
  Recipe(
    name: "Tostadas con aguacate y huevo",
    imageUrl:
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.haceloconhuevos.com%2Fwp-content%2Fuploads%2F2022%2F02%2FTOSTADA-DE-AGUACATE-Y-HUEVO-FRITO.jpg&f=1&nofb=1&ipt=aeb0a3157305fe610a3d4cbdbfe5acb4492052f749eaaeb0e3a0536350c68023&ipo=images",
    ingredients: [
      {"ingredientName": "2 rebanadas de pan integral", "isSelected": false},
      {"ingredientName": "1 aguacate maduro", "isSelected": false},
      {"ingredientName": "2 huevos", "isSelected": false},
      {"ingredientName": "Sal y pimienta al gusto", "isSelected": false},
      {"ingredientName": "Aceite de oliva", "isSelected": false}
    ],
    instructions: [
      "Tostar el pan hasta que esté dorado.",
      "Aplastar el aguacate y esparcir sobre las tostadas.",
      "Freír o hervir los huevos y colocarlos sobre las tostadas.",
      "Agregar sal, pimienta y un chorrito de aceite de oliva."
    ],
    type: MealType.breakfast,
  ),
  Recipe(
    name: "Ensalada César con pollo",
    imageUrl:
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Frecetasdepollo.online%2Fwp-content%2Fuploads%2F2017%2F09%2Fensalada-cesar-con-pollo.jpg&f=1&nofb=1&ipt=e9c63aab2eb5e9c95757e23d4e37f085f1ee3c454dd54850cd4c08e596f7a0d4&ipo=images",
    ingredients: [
      {"ingredientName": "1 pechuga de pollo a la parrilla", "isSelected": false},
      {"ingredientName": "1 lechuga romana", "isSelected": false},
      {"ingredientName": "Crutones", "isSelected": false},
      {"ingredientName": "Queso parmesano", "isSelected": false},
      {"ingredientName": "Aderezo César", "isSelected": false}
    ],
    instructions: [
      "Cortar la lechuga y colocarla en un bol.",
      "Añadir crutones, queso parmesano y el pollo en tiras.",
      "Rociar con aderezo César y mezclar bien.",
      "Servir de inmediato."
    ],
    type: MealType.lunch,
  ),
  /*
  Recipe(
    name: "Arroz con pollo",
    imageUrl: "https://example.com/arroz_pollo.jpg",
    ingredients: [
      "1 taza de arroz",
      "1 pechuga de pollo en trozos",
      "1 zanahoria picada",
      "1/2 pimiento rojo picado",
      "1/2 cebolla picada",
      "Sal y especias al gusto",
    ],
    instructions: [
      "Cocinar el arroz según instrucciones.",
      "En una sartén, sofreír la cebolla, pimiento y zanahoria.",
      "Agregar el pollo y cocinar hasta que esté dorado.",
      "Añadir el arroz y mezclar bien.",
      "Cocinar por unos minutos y servir."
    ],
    type: MealType.lunch,
  ),
  Recipe(
    name: "Salmón a la plancha con espárragos",
    imageUrl: "https://example.com/salmon.jpg",
    ingredients: [
      "1 filete de salmón",
      "Espárragos frescos",
      "Aceite de oliva",
      "Sal y pimienta al gusto",
      "Rodajas de limón",
    ],
    instructions: [
      "Sazonar el salmón con sal, pimienta y un poco de aceite de oliva.",
      "Cocinar en una sartén caliente por 3-4 minutos por cada lado.",
      "En la misma sartén, saltear los espárragos con un poco de aceite.",
      "Servir con rodajas de limón al gusto."
    ],
    type: MealType.dinner,
  ),
  Recipe(
    name: "Pasta con salsa de tomate y albóndigas",
    imageUrl: "https://example.com/pasta.jpg",
    ingredients: [
      "200g de pasta",
      "Albóndigas de carne",
      "1 lata de tomate triturado",
      "1 diente de ajo",
      "Sal y orégano al gusto",
    ],
    instructions: [
      "Cocinar la pasta según las instrucciones del paquete.",
      "Dorar las albóndigas en una sartén.",
      "Añadir el ajo picado y el tomate triturado.",
      "Cocinar a fuego lento por 10 minutos.",
      "Mezclar la salsa con la pasta y servir caliente."
    ],
    type: MealType.dinner,
  ),
  Recipe(
    name: "Sopa de lentejas",
    imageUrl: "https://example.com/sopa_lentejas.jpg",
    ingredients: [
      "1 taza de lentejas",
      "1 zanahoria picada",
      "1/2 cebolla picada",
      "1 diente de ajo picado",
      "Caldo de verduras",
      "Sal y especias al gusto",
    ],
    instructions: [
      "En una olla, sofreír la cebolla, zanahoria y ajo.",
      "Añadir las lentejas y el caldo de verduras.",
      "Cocinar a fuego medio hasta que las lentejas estén tiernas.",
      "Sazonar al gusto y servir caliente."
    ],
    type: MealType.dinner,
  ),
  */
];
