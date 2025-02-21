import 'package:NutriMate/widgets/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<ChartScreen> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00B894).withAlpha(100),
        title: const Text('Estadísticas'),
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
      backgroundColor: const Color(0xFFF7F7F7),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCard(child: _buildPieChart()),
            const SizedBox(height: 16),
            _buildCard(child: _buildBarChart()),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }

  Widget _buildPieChart() {
    return Column(
      children: [
        const Text(
          "Consumo Calórico por Día",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          touchedIndex = (event.isInterestedForInteractions &&
                                  pieTouchResponse?.touchedSection != null)
                              ? pieTouchResponse!.touchedSection!.touchedSectionIndex
                              : -1;
                        });
                      },
                    ),
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 3,
                    centerSpaceRadius: 50,
                    sections: _showingPieSections(),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            _infoPie(),
          ],
        ),
      ],
    );
  }
/**
 * Un widget que devuelve una lista con texto y colores que corresponden al diagrama de torta
 */
  Widget _infoPie() {
    const List<Map<String, dynamic>> textoItems = [
      {'color': Colors.blue, 'text': 'Lunes'},
      {'color': Colors.red, 'text': 'Martes'},
      {'color': Colors.yellow, 'text': 'Miércoles'},
      {'color': Colors.green, 'text': 'Jueves'},
      {'color': Colors.purple, 'text': 'Viernes'},
      {'color': Colors.pinkAccent, 'text': 'Sábado'},
      {'color': Colors.grey, 'text': 'Domingo'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: textoItems
          .map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Indicator(color: item['color'], text: item['text'], isSquare: true),
              ))
          .toList(),
    );
  }
/**
 *  Creamos las propiedades del diagrama de torta, usando List como nos recomienda en la doc
 * posteriormente creamos una variable lista de tipo map String el cual no servirá para mapear su contenido(valores del diagrama)
 * 
*/
  List<PieChartSectionData> _showingPieSections() {
    final List<Map<String, dynamic>> sections = [
      {'color': Colors.blue, 'value': 40, 'label': '40Kcal'},
      {'color': Colors.red, 'value': 30, 'label': '30Kcal'},
      {'color': Colors.yellow, 'value': 15, 'label': '15Kcal'},
      {'color': Colors.green, 'value': 15, 'label': '15Kcal'},
      {'color': Colors.purple, 'value': 50, 'label': '50Kcal'},
      {'color': Colors.pinkAccent, 'value': 97, 'label': '97Kcal'},
      {'color': Colors.grey, 'value': 13, 'label': '13Kcal'},
    ];

    return List.generate(sections.length, (i) {
  // Verifica si la sección actual está siendo tocada
  final isTouched = i == touchedIndex;

  return PieChartSectionData(
    color: sections[i]['color'], // obtiene el color de la sección de la list sections que hemos creado
    value: sections[i]['value'].toDouble(), // El valor del pieChart es el que está en section pero hay que pasarlo a double
    title: sections[i]['label'], // Coge el titulo del chart
    radius: isTouched ? 60.0 : 50.0, // Si se detecta que el índice que está tocando el usuario es correcto, el radio aumenta a 60
    titleStyle: TextStyle(
      fontSize: isTouched ? 22.0 : 16.0, // si el usuario está tocando aumenta el tamaño
      fontWeight: FontWeight.bold, // Hace el texto en negrita para mejor visibilidad
      color: Colors.white, // Color del texto en blanco para contraste con los colores de la gráfica
      shadows: const [Shadow(color: Colors.black, blurRadius: 2)], // Agrega una sombra negra para mejorar la legibilidad
    ),
  );
});

  }

// Widget del diagrama de barras
  Widget _buildBarChart() {
    return Column(
      children: [
        const Text(
          "Consumo Calórico Semanal",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: BarChart( // construcción del diagrama de barras, bordes, titulos, colores etc...
            BarChartData(
              barGroups: _showingBarGroups(),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!),
                  left: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              titlesData: FlTitlesData( // configuración y estilizado de los títulos
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false, reservedSize: 10),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: _bottomTitles, // parámetro para obtener el widget a parte de los titulos
                  ),
                ),
              ),
              gridData: FlGridData(show: true),
              barTouchData: BarTouchData(enabled: true),
            ),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
          ),
        ),
      ],
    );
  }
/**
 * Para empezar el paquete nos dice que para añadir datos a las tablas lo más óptimo es realizar un list en una función a parte
 * , después meterlos en un map posteriormente mapear y sacar sus valores e insertarlos en el chart que vamos a crear
 */
  List<BarChartGroupData> _showingBarGroups() {
    final List<Map<String, dynamic>> bars = [
      {'x': 1, 'value': 40, 'color': Colors.blue},
      {'x': 2, 'value': 30, 'color': Colors.red},
      {'x': 3, 'value': 15, 'color': Colors.yellow},
      {'x': 4, 'value': 15, 'color': Colors.green},
    ];

    return bars
        .map((bar) => BarChartGroupData(
              x: bar['x'],
              barRods: [BarChartRodData(toY: bar['value'].toDouble(), color: bar['color'], width: 15)],
            ))
        .toList();
  }

/**
 * Widget que pone los textos inferiores del chart de barras.
 */
Widget _bottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(fontSize: 10, fontWeight: FontWeight.bold);
  final Map<int, String> days = {
    1: 'Semana 1',
    2: 'Semana 2',
    3: 'Semana 3',
    4: 'Semana 4',

  };
    return Text(days[value.toInt()] ?? '', style: style);
  }
}
