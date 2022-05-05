// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class JobData extends DataClass implements Insertable<JobData> {
  final int id;
  final String title;
  final double dailySalary;
  JobData({required this.id, required this.title, required this.dailySalary});
  factory JobData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return JobData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      dailySalary: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}daily_salary'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['daily_salary'] = Variable<double>(dailySalary);
    return map;
  }

  JobCompanion toCompanion(bool nullToAbsent) {
    return JobCompanion(
      id: Value(id),
      title: Value(title),
      dailySalary: Value(dailySalary),
    );
  }

  factory JobData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JobData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      dailySalary: serializer.fromJson<double>(json['dailySalary']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'dailySalary': serializer.toJson<double>(dailySalary),
    };
  }

  JobData copyWith({int? id, String? title, double? dailySalary}) => JobData(
        id: id ?? this.id,
        title: title ?? this.title,
        dailySalary: dailySalary ?? this.dailySalary,
      );
  @override
  String toString() {
    return (StringBuffer('JobData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('dailySalary: $dailySalary')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, dailySalary);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JobData &&
          other.id == this.id &&
          other.title == this.title &&
          other.dailySalary == this.dailySalary);
}

class JobCompanion extends UpdateCompanion<JobData> {
  final Value<int> id;
  final Value<String> title;
  final Value<double> dailySalary;
  const JobCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.dailySalary = const Value.absent(),
  });
  JobCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required double dailySalary,
  })  : title = Value(title),
        dailySalary = Value(dailySalary);
  static Insertable<JobData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? dailySalary,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (dailySalary != null) 'daily_salary': dailySalary,
    });
  }

  JobCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<double>? dailySalary}) {
    return JobCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      dailySalary: dailySalary ?? this.dailySalary,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (dailySalary.present) {
      map['daily_salary'] = Variable<double>(dailySalary.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('dailySalary: $dailySalary')
          ..write(')'))
        .toString();
  }
}

class $JobTable extends Job with TableInfo<$JobTable, JobData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _dailySalaryMeta =
      const VerificationMeta('dailySalary');
  @override
  late final GeneratedColumn<double?> dailySalary = GeneratedColumn<double?>(
      'daily_salary', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, dailySalary];
  @override
  String get aliasedName => _alias ?? 'job';
  @override
  String get actualTableName => 'job';
  @override
  VerificationContext validateIntegrity(Insertable<JobData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('daily_salary')) {
      context.handle(
          _dailySalaryMeta,
          dailySalary.isAcceptableOrUnknown(
              data['daily_salary']!, _dailySalaryMeta));
    } else if (isInserting) {
      context.missing(_dailySalaryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JobData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return JobData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $JobTable createAlias(String alias) {
    return $JobTable(attachedDatabase, alias);
  }
}

class WorkDayData extends DataClass implements Insertable<WorkDayData> {
  final int id;
  final DateTime date;
  final double salary;
  WorkDayData({required this.id, required this.date, required this.salary});
  factory WorkDayData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return WorkDayData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      salary: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}salary'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['salary'] = Variable<double>(salary);
    return map;
  }

  WorkDayCompanion toCompanion(bool nullToAbsent) {
    return WorkDayCompanion(
      id: Value(id),
      date: Value(date),
      salary: Value(salary),
    );
  }

  factory WorkDayData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkDayData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      salary: serializer.fromJson<double>(json['salary']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'salary': serializer.toJson<double>(salary),
    };
  }

  WorkDayData copyWith({int? id, DateTime? date, double? salary}) =>
      WorkDayData(
        id: id ?? this.id,
        date: date ?? this.date,
        salary: salary ?? this.salary,
      );
  @override
  String toString() {
    return (StringBuffer('WorkDayData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('salary: $salary')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, salary);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkDayData &&
          other.id == this.id &&
          other.date == this.date &&
          other.salary == this.salary);
}

class WorkDayCompanion extends UpdateCompanion<WorkDayData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<double> salary;
  const WorkDayCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.salary = const Value.absent(),
  });
  WorkDayCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required double salary,
  })  : date = Value(date),
        salary = Value(salary);
  static Insertable<WorkDayData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<double>? salary,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (salary != null) 'salary': salary,
    });
  }

  WorkDayCompanion copyWith(
      {Value<int>? id, Value<DateTime>? date, Value<double>? salary}) {
    return WorkDayCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      salary: salary ?? this.salary,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (salary.present) {
      map['salary'] = Variable<double>(salary.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkDayCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('salary: $salary')
          ..write(')'))
        .toString();
  }
}

class $WorkDayTable extends WorkDay with TableInfo<$WorkDayTable, WorkDayData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkDayTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _salaryMeta = const VerificationMeta('salary');
  @override
  late final GeneratedColumn<double?> salary = GeneratedColumn<double?>(
      'salary', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, date, salary];
  @override
  String get aliasedName => _alias ?? 'work_day';
  @override
  String get actualTableName => 'work_day';
  @override
  VerificationContext validateIntegrity(Insertable<WorkDayData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('salary')) {
      context.handle(_salaryMeta,
          salary.isAcceptableOrUnknown(data['salary']!, _salaryMeta));
    } else if (isInserting) {
      context.missing(_salaryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkDayData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return WorkDayData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $WorkDayTable createAlias(String alias) {
    return $WorkDayTable(attachedDatabase, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $JobTable job = $JobTable(this);
  late final $WorkDayTable workDay = $WorkDayTable(this);
  late final JobsDao jobsDao = JobsDao(this as Database);
  late final WorkDayDao workDayDao = WorkDayDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [job, workDay];
}
