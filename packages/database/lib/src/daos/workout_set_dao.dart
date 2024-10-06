import 'package:database/src/tables/workout_set_table.dart';
import 'package:database/src/workout_database.dart';
import 'package:drift/drift.dart';
import 'package:entity/entity.dart';

part 'workout_set_dao.g.dart';

@DriftAccessor(tables: [WorkoutSetTable])
class WorkoutSetDao extends DatabaseAccessor<WorkoutDatabase>
    with _$WorkoutSetDaoMixin {
  WorkoutSetDao(super.db);

  /// Deletes all of the WorkoutSets that are associated with a specific Workout ID
  Future<void> deleteSetsForWorkout({
    required Workout workout,
  }) async =>
      (delete(workoutSetTable)..where((t) => t.workoutId.equals(workout.id)))
          .go();

  /// Deletes a specific WorkoutSet based on ID
  Future<void> deleteSet({
    required WorkoutSet workoutSet,
  }) async =>
      (delete(workoutSetTable)..where((t) => t.id.equals(workoutSet.id))).go();

  /// Create a WorkoutSet with the associated Workout, based on WorkoutID
  Future<void> createSetForWorkout({
    required int workoutId,
    required int reps,
    required int weightKg,
    required Exercise exercise,
  }) async =>
      into(workoutSetTable).insert(
        WorkoutSetTableCompanion.insert(
          exercise: exercise,
          weightKg: weightKg,
          repetitions: reps,
          workoutId: workoutId,
        ),
      );

  /// Updates an existing WorkoutSet with new values
  Future<void> updateWorkoutSet({
    required int setId,
    required int reps,
    required int weightKg,
    required Exercise exercise,
  }) async =>
      (update(workoutSetTable)..where((tbl) => tbl.id.equals(setId))).write(
        WorkoutSetTableCompanion(
          exercise: Value(exercise),
          weightKg: Value(weightKg),
          repetitions: Value(reps),
        ),
      );

  /// Fetches a stream of all workoutSets associated with a specific workoutId 
  /// to be listened to for updates to the database
  Future<Stream<List<WorkoutSet>>> workoutSetsStream({
    required int workoutId,
  }) async {
    return (select(workoutSetTable)
          ..where((tbl) => tbl.workoutId.equals(workoutId)))
        .watch()
        .map(
      (workoutSets) {
        return workoutSets.map(
          (workoutSet) {
            return WorkoutSet(
              id: workoutSet.id,
              exercise: workoutSet.exercise,
              weightKg: workoutSet.weightKg,
              repetitions: workoutSet.repetitions,
            );
          },
        ).toList();
      },
    );
  }
}
