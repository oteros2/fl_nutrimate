import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class ChartScreen extends StatelessWidget {
   
  const ChartScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: ListView(
           children: [
             Container(
               height: 300,
               padding: const EdgeInsets.all(16),
               child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: 245,
                      color: Colors.amber,
                      radius: 40,
                      showTitle: true,
                    ),
                    PieChartSectionData(
                      value: 24,
                      color: Colors.red,
                      radius: 40,
                      showTitle: true,
                    )
                  ],
                  pieTouchData: PieTouchData(
                    enabled: true,
                    mouseCursorResolver: (FlTouchEvent event, PieTouchResponse? response) {
                      return SystemMouseCursors.click;
                    },
                  )
                  )
               )
              ),
           ],
         ),
      ),
    );
  }
}