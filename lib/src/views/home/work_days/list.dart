import 'dart:async';

import 'package:flutter/material.dart';
import 'package:endless/endless.dart';
import 'package:intl/intl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_mensal/src/controllers/index.dart';
import 'package:trabalho_mensal/src/database/index.dart';

class HomeEventList extends StatefulWidget {
  final WorkDaysController controller;

  const HomeEventList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<HomeEventList> createState() => HomeEventListState();
}

class HomeEventListState extends State<HomeEventList> {
  final listController = EndlessPaginationController<WorkDayData>();
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  late Stream<List<WorkDayData>> workDayStream;
  int page = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return EndlessPaginationListView<WorkDayData>(
      headerBuilder: (context) => Center(
        child: Observer(
          builder: (_) => Text(
            'Trabalhos do dia ' +
                dateFormat.format(
                  widget.controller.selectedDate,
                ),
            style: theme.textTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      loadMore: (page) {
        print('load $page');
        final db = context.read<Database>();
        return db.workDayDao.getWorksByDayPaged(
          widget.controller.selectedDate,
          page: page,
        );
      },
      paginationDelegate: EndlessPaginationDelegate(
        pageSize: 1,
      ),
      itemBuilder: (
        context, {
        required index,
        required item,
        required totalItems,
      }) {
        return Card(
          child: ListTile(
            title: Text(item.id.toString()),
            subtitle: Text(item.salary.toString()),
          ),
        );
      },
      emptyBuilder: (context) => Center(
        child: Text(
          'Nenhum trabalho para esse dia!' +
              dateFormat.format(
                widget.controller.selectedDate,
              ),
        ),
      ),
      loadingBuilder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
