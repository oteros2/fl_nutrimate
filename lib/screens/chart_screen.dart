import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';

class CaloriasChart extends StatefulWidget {
  @override
  _CaloriasChartState createState() => _CaloriasChartState();
}

class _CaloriasChartState extends State<CaloriasChart> {
  List<BarChartGroupData> _chartData = [];
  List<String> _recipeNames = [];
  int? _selectedIndex;
  int? _hoveredIndex;

/**
 * Estado inicial del widget en el cual vamos a llamar a la función _fetchData que nos va a cargar los datos de la base de datos
 */
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

/**
 * Función que nos va a cargar los datos de la base de datos en la lista _chartData y _recipeNames para poder mostrarlos en el gráfico de barras
 * Buscamos una colección llamada recetas en la base de datos y obtenemos los datos de cada receta para mostrarlos en el gráfico
 * Cada receta tiene un nombre y un número de calorías, los cuales vamos a guardar en la lista _recipeNames y en la lista _chartData respectivamente
 * y recorremos cada receta para obtener los datos y guardarlos en las listas
 */
  Future<void> _fetchData() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('recetas').get();
    final List<BarChartGroupData> chartData = [];
    final List<String> names = [];
    final List<Color> colors = [Colors.blue, Colors.red, Colors.green, Colors.orange, Colors.purple];

    for (int i = 0; i < snapshot.docs.length; i++) {
      final doc = snapshot.docs[i];
      final data = doc.data() as Map<String, dynamic>;
      final String name = data['name'] ?? 'Desconocido'; // si no se encuentra un nombre se pone Desconocido
      final int calories = data['calories'] ?? 0; // si no se encuentra un número de calorías se pone 0
      names.add(name);
      
      chartData.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: calories.toDouble(),
              color: Colors.blue,
              width: 16,
              borderRadius: BorderRadius.circular(4),
            )
          ],
        ),
      );
    }
/**
 * El setState nos va a permitir actualizar el estado del widget con los datos que hemos obtenido de la base de datos
 */
    setState(() {
      _chartData = chartData;
      _recipeNames = names;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Análisis de Calorías")),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text("Calorías por Receta", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BarChart(
                BarChartData(
                  barGroups: _chartData,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          int index = value.toInt();
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                _recipeNames[index].substring(0, 3),
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  barTouchData: BarTouchData( // esto hace posible que se muestre un tooltip al tocar una barra del gráfico de barras con el dedo o el mouse
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        if (_selectedIndex == groupIndex) { 
                          return BarTooltipItem(
                            '${_recipeNames[groupIndex]}: ${rod.toY.toInt()} cal',
                            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          );
                        }
                        return null;
                      },
                    ),
                    touchCallback: (event, response) { 
                      if (response != null && response.spot != null) {
                        setState(() {
                          _selectedIndex = response.spot!.touchedBarGroupIndex;
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
