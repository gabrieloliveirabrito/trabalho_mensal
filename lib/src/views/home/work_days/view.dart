import 'package:flutter/material.dart';
import 'package:trabalho_mensal/src/controllers/index.dart';

import 'calendar.dart';
import 'list.dart';

class WorkDayView extends StatefulWidget {
  const WorkDayView({Key? key}) : super(key: key);

  @override
  State<WorkDayView> createState() => _WorkDayViewState();
}

class _WorkDayViewState extends State<WorkDayView> {
  final controller = WorkDaysController();

  onDateChanged(DateTime date) {
    controller.selectedDate = date;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        HomeCalendar(
          controller: controller,
        ),
        const Divider(),
        HomeEventList(
          controller: controller,
        ),
      ],
    );
  }
}
