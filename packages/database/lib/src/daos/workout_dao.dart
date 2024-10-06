import 'package:database/src/tables/workout_set_table.dart';
import 'package:database/src/tables/workout_table.dart';
import 'package:database/src/workout_database.dart';
import 'package:drift/drift.dart';
import 'package:entity/entity.dart';

part 'workout_dao.g.dart';

/// Generated Dao for the Workout Table
/// Requires both WorkoutTable and WorkoutSetTable, for when retrieving all of the Workout(s)
@DriftAccessor(tables: [WorkoutTable, WorkoutSetTable])
class WorkoutDao extends DatabaseAccessor<WorkoutDatabase>
    with _$WorkoutDaoMixin {
  WorkoutDao(super.db);

  // Fetches all of the workouts in the database and their respective WorkoutSets
  Future<List<Workout>> fetchAllWorkouts() async {
    final workoutRows = await select(workoutTable).get();

    // Calls a mapper to map to the Entity `Workout`
    final workouts = await Future.wait(
      workoutRows.map(_mapToWorkout).toList(),
    );

    return workouts;
  }

  /// Initially inserts a Workout into the database with no sets and only a name
  Future<void> createWorkout({
    required String name,
  }) =>
      into(workoutTable).insert(
        WorkoutTableCompanion.insert(
          name: name,
        ),
      );

  /// Fetches a stream of all workouts to be listened to for updates to the database
  Future<Stream<List<Workout>>> workoutStream() async {
    return select(workoutTable).watch().asyncMap(
          (workouts) async =>
              await Future.wait(workouts.map(_mapToWorkout).toList()),
        );
  }

  /// Deletes a workout based on the ID
  Future<void> deleteWorkout({
    required Workout workout,
  }) async =>
      (delete(workoutTable)..where((t) => t.id.equals(workout.id))).go();

  /// Mapper used to map a Workout, as well as fetching WorkoutSets
  Future<Workout> _mapToWorkout(WorkoutTableData workout) async {
    final sets = await (select(workoutSetTable)
          ..where((workoutSet) => workoutSet.workoutId.equals(workout.id)))
        .get()
        .then(
          (workoutSets) => workoutSets
              .map(
                (workoutSet) => WorkoutSet(
                  id: workoutSet.id,
                  exercise: workoutSet.exercise,
                  weightKg: workoutSet.weightKg,
                  repetitions: workoutSet.repetitions,
                ),
              )
              .toList(),
        );
    return Workout(
      title: workout.name,
      id: workout.id,
      sets: sets,
    );
  }
}
