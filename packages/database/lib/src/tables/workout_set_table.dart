import 'package:database/src/tables/workout_table.dart';
import 'package:drift/drift.dart';
import 'package:entity/entity.dart';

class WorkoutSetTable extends Table {
  // Unique ID for the WorkoutSet
  IntColumn get id => integer().autoIncrement()();
  // Enum to store the Exercise value
  IntColumn get exercise =>
      integer().map(const EnumIndexConverter<Exercise>(Exercise.values))();
  // Weight selected in Kg
  IntColumn get weightKg => integer()();
  // Number of Repetitions for the set
  IntColumn get repetitions => integer()();

  // Reference to the Workout Tables ID which this set is associated with
  IntColumn get workoutId => integer().references(WorkoutTable, #id)();
}
