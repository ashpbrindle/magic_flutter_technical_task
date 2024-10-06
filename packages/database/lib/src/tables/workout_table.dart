import 'package:drift/drift.dart';

class WorkoutTable extends Table {
  // Unique ID for the Workout
  IntColumn get id => integer().autoIncrement()();
  // Name of the Workout
  TextColumn get name => text()();
}
