import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  // CalendarScreen({Key? key}) : super(key: key);

  static const routName = '/CalendarScreen';
  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime? _selectedDay;
  var _focusedDay = DateTime.now();
  var _format = CalendarFormat.week;

  // DateTime changeSelectedDate(DateTime dateSelectedByUser) {
  //   today = dateSelectedByUser;
  //   return today;
  // }

  // @override
  // void initState() {
  //   super.initState();
  // }

  // CalendarController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: TableCalendar(
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay; // update `_focusedDay` here as well
            });
          },
          calendarStyle: CalendarStyle(
            weekendTextStyle: TextStyle(color: Theme.of(context).errorColor),
            todayDecoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
                color: Theme.of(context).accentColor, shape: BoxShape.circle),
          ),
          headerStyle: const HeaderStyle(
            formatButtonShowsNext: false,
            formatButtonVisible: false,
            titleCentered: true,
          ),
          availableCalendarFormats: const {
            CalendarFormat.month: 'Month',
            CalendarFormat.week: 'Week'
          },
          calendarFormat: _format,
          onFormatChanged: (format) => setState(() {
                _format = format;
              }),
          focusedDay: _focusedDay,
          firstDay: DateTime.utc(2010, 3, 14),
          lastDay: DateTime.now()),
    );
  }
}
