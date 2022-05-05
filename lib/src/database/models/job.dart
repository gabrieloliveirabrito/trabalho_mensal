import 'package:drift/drift.dart';

class Job extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  RealColumn get dailySalary => real()();
}
