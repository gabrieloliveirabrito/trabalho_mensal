import 'package:drift/drift.dart';
import '../index.dart';

part 'work_day_dao.g.dart';

@DriftAccessor(tables: [WorkDay])
class WorkDayDao extends DatabaseAccessor<Database> with _$WorkDayDaoMixin {
  WorkDayDao(Database db) : super(db);

  Future<List<WorkDayData>> getAllWorks() {
    final query = select(workDay);

    return query.get();
  }

  Future<List<WorkDayData>> getWorksByDay(DateTime date) {
    final query = select(workDay)
      ..where(
        (wd) =>
            wd.date.month.equals(date.month) &
            wd.date.year.equals(
              (date.year),
            ),
      );

    return query.get();
  }

  Future<List<WorkDayData>> getWorksByDayPaged(
    DateTime date, {
    int page = 0,
    int pageSize = 1,
  }) {
    final query = select(workDay)
      ..where((wd) => wd.date.equals(date))
      ..limit(pageSize, offset: page * pageSize);

    return query.get();
  }
}
