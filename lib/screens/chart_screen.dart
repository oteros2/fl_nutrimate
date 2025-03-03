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
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('recetas').get();
    final List<BarChartGroupData> chartData = [];
    for (int i = 0; i < snapshot.docs.length; i++) {
      final doc = snapshot.docs[i];
      final data = doc.data() as Map<String, dynamic>;
      final String name = data['name'] ?? 'Desconocido';
      final int calories = data['calories'] ?? 0;
      _recipeNames.add(name);

      chartData.add(
        BarChartGroupData(
          x: i,
          barRods: [BarChartRodData(toY: calories.toDouble(), color: Colors.blue)],
          showingTooltipIndicators: [0],
        ),
      );
    }
/**
 * El setState nos va a permitir actualizar el estado del widget con los datos que hemos obtenido de la base de datos
 */
    setState(() {
      _chartData = chartData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calorías por Receta")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _chartData.isEmpty
            ? Center(child: CircularProgressIndicator()) // Si _chartData está vacío, mostramos un indicador de carga infinito :)
            : BarChart(
                BarChartData(
                  barGroups: _chartData,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          int index = value.toInt();
                          if (index >= 0 && index < _recipeNames.length) {
                            return Text(_recipeNames[index].substring(0, 3));
                          }
                          return const Text('');
                        },
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
