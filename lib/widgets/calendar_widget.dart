import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime(2020), // Cambia según tus necesidades
      lastDay: DateTime(2030), // Cambia según tus necesidades
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay; // Actualiza el día enfocado
        });
      },
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Colors.blue, // Color del día seleccionado
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        todayDecoration: BoxDecoration(
          color: Colors.orange, // Color del día actual
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
