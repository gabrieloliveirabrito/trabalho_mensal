import 'package:drift/drift.dart';
import '../index.dart';

part 'jobs_dao.g.dart';

@DriftAccessor(tables: [Job])
class JobsDao extends DatabaseAccessor<Database> with _$JobsDaoMixin {
  JobsDao(Database db) : super(db);

  Stream<List<JobData>> getAllJobs() {
    return select(job).watch();
  }
}
