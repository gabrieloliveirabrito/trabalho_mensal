import 'package:drift/drift.dart';

class WorkDay extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  RealColumn get salary => real()();
}
