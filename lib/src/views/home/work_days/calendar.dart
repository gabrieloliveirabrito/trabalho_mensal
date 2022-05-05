import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trabalho_mensal/src/controllers/index.dart';
import 'package:trabalho_mensal/src/database/index.dart';

class HomeCalendar extends StatefulWidget {
  final WorkDaysController controller;

  const HomeCalendar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<HomeCalendar> createState() => _HomeCalendarState();
}

class _HomeCalendarState extends State<HomeCalendar> {
  loadWorkDays() async {
    final date = widget.controller.selectedDate;
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;
  Map<DateTime, Iterable<dynamic>> workDays = {};

  onDateChanged(DateTime selected) async {
    final db = context.read<Database>();
    final works = await db.workDayDao.getWorksByDay(selected);

    Map<DateTime, List<int>> workMap = {};
    for (var work in works) {
      if (workMap.containsKey(work.date)) {
        workMap[work.date]!.add(work.id);
      } else {
        workMap[work.date] = [work.id];
      }
    }

    setState(() => workDays = workMap);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => TableCalendar(
        firstDay: DateTime.utc(2000, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: widget.controller.selectedDate,
        locale: 'pt_BR',
        selectedDayPredicate: (day) {
          return isSameDay(widget.controller.selectedDate, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          widget.controller.selectedDate = focusedDay;
        },
        calendarFormat: _calendarFormat,
        onFormatChanged: (format) {
          setState(() => _calendarFormat = format);
        },
        onPageChanged: (focusedDay) {
          widget.controller.selectedDate = focusedDay;
          onDateChanged(focusedDay);
        },
        eventLoader: (day) {
          List events = [];
          if (workDays.containsKey(day)) events.add(workDays[day]!.length);

          return events;
        },
      ),
    );
  }
}
