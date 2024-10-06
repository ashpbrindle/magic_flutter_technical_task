import 'dart:io';

import 'package:database/src/tables/workout_set_table.dart';
import 'package:database/src/tables/workout_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:entity/entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'workout_database.g.dart';

/// Workout Database to hold all of the users workouts and workout sets
@DriftDatabase(tables: [WorkoutTable, WorkoutSetTable])
class WorkoutDatabase extends _$WorkoutDatabase {
  WorkoutDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

// Method called on to find/create the database in file storage
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();

    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
