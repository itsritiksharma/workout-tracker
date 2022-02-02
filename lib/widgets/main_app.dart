import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/card_with_list_widget.dart';
import '../widgets/card_with_chart_widget.dart';

class MainApp extends StatefulWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  DateTime? _selectedDay;

  var _focusedDay = DateTime.now();

  var _format = CalendarFormat.week;

  Future<String> getData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    return 'it works';
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Colors.white,
      onRefresh: getData,
      child: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        // dragStartBehavior: DragStartBehavior.down,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TableCalendar(
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay =
                          focusedDay; // update `_focusedDay` here as well
                    });
                  },
                  calendarStyle: CalendarStyle(
                    weekendTextStyle:
                        TextStyle(color: Theme.of(context).errorColor),
                    todayDecoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        shape: BoxShape.circle),
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
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'Today',
                  textAlign: TextAlign.center,
                  textScaleFactor: 5,
                ),
                width: double.infinity,
              ),
              CardWithChart(title: 'Today\'s workout', reps: 10),
              CardWithChart(title: 'Previous workout', reps: 10),
              CardWithList(title: 'Recommended workout', reps: 10),
            ],
          ),
        ),
      ),
    );
  }
}
