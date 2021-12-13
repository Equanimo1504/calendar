import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'events.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
        centerTitle: true,
      ),
      body: TableCalendar(
        focusedDay: selectedDay,
        firstDay: DateTime(1990),
        lastDay: DateTime(2030),
        calendarFormat: format,
        onFormatChanged: (CalendarFormat _format) {
          setState(() {
            format = _format;
          });
        },
        startingDayOfWeek: StartingDayOfWeek.sunday,
        onDaySelected: (DateTime selectDay, DateTime focusDay) {
          setState(() {
            selectedDay = selectDay;
            focusedDay = focusDay;
          });
        },
        calendarStyle: CalendarStyle(
            isTodayHighlighted: true,
            selectedDecoration: BoxDecoration(
              color: Colors.blue.shade900,
              shape: BoxShape.circle,
            ),
            selectedTextStyle: TextStyle(color: Colors.white)),
        selectedDayPredicate: (DateTime date) {
          return isSameDay(selectedDay, date);
        },
        headerStyle:
            HeaderStyle(formatButtonVisible: false, titleCentered: true),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Events();
          }));
        },
      ),
    );
  }
}
// onPressed: ()  {
// Navigator.push(context,
// MaterialPageRoute(builder: (context) {
// return CityScreen();
// }));
