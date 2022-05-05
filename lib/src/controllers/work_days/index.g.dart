// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorkDaysController on _WorkDaysController, Store {
  Computed<DateTime>? _$selectedDateComputed;

  @override
  DateTime get selectedDate =>
      (_$selectedDateComputed ??= Computed<DateTime>(() => super.selectedDate,
              name: '_WorkDaysController.selectedDate'))
          .value;

  final _$_selectedDateAtom = Atom(name: '_WorkDaysController._selectedDate');

  @override
  DateTime? get _selectedDate {
    _$_selectedDateAtom.reportRead();
    return super._selectedDate;
  }

  @override
  set _selectedDate(DateTime? value) {
    _$_selectedDateAtom.reportWrite(value, super._selectedDate, () {
      super._selectedDate = value;
    });
  }

  @override
  String toString() {
    return '''
selectedDate: ${selectedDate}
    ''';
  }
}
