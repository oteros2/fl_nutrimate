import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarioWidget extends StatefulWidget {
  const CalendarioWidget({Key? key}) : super(key: key);

  @override
  _CalendarioWidgetState createState() => _CalendarioWidgetState();
}

class _CalendarioWidgetState extends State<CalendarioWidget> {
  DateTime _fechaSeleccionada = DateTime.now();
  DateTime _primerDia = DateTime.now().subtract(const Duration(days: 365));
  DateTime _ultimoDia = DateTime.now().add(const Duration(days: 365));
  CalendarFormat _formatoCalendario = CalendarFormat.month;
  Map<DateTime, List<dynamic>> _eventos = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            locale: 'es_ES',
            firstDay: _primerDia,
            lastDay: _ultimoDia,
            focusedDay: _fechaSeleccionada,
            calendarFormat: _formatoCalendario,
            eventLoader: (day) {
              return _eventos[day] ?? [];
            },
            selectedDayPredicate: (day) {
              return isSameDay(_fechaSeleccionada, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _fechaSeleccionada = selectedDay;
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _formatoCalendario = format;
              });
            },
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: const HeaderStyle(
              formatButtonShowsNext: false,
              titleCentered: true,
              formatButtonDecoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              formatButtonTextStyle: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Fecha seleccionada: ${_fechaSeleccionada.day}/${_fechaSeleccionada.month}/${_fechaSeleccionada.year}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Aquí puedes añadir un evento para la fecha seleccionada
              final evento = 'Nuevo evento';
              setState(() {
                if (_eventos[_fechaSeleccionada] != null) {
                  _eventos[_fechaSeleccionada]!.add(evento);
                } else {
                  _eventos[_fechaSeleccionada] = [evento];
                }
              });
            },
            child: const Text('Añadir evento'),
          ),
        ],
      ),
    );
  }
}
