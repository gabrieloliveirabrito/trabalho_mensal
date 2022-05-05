import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'models/index.dart';
import 'daos/index.dart';

export 'models/index.dart';
export 'daos/index.dart';

part 'index.g.dart';

@DriftDatabase(tables: [Job, WorkDay], daos: [JobsDao, WorkDayDao])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file, logStatements: kDebugMode);
    });
  }
}
