import 'package:entity/entity.dart';
import 'package:database/database.dart';

class WorkoutSetRepository {
  WorkoutSetRepository({
    required WorkoutSetDao workoutSetDao,
  }) : _workoutSetDao = workoutSetDao;

  final WorkoutSetDao _workoutSetDao;

  /// This method is used when we need to delete all sets associated with a specific workout
  Future<void> deleteSetsForWorkout({
    required Workout workout,
  }) async =>
      _workoutSetDao.deleteSetsForWorkout(
        workout: workout,
      );

  /// This method is used when we need to delete all sets associated with a specific workout
  Future<void> deleteSet({
    required WorkoutSet workoutSet,
  }) async =>
      _workoutSetDao.deleteSet(
        workoutSet: workoutSet,
      );

  /// This method is used when we initially create a workout, set, the workout 
  /// ID is provided here to link this with an existing workout
  Future<void> createWorkoutSet({
    required int workoutId,
    required int reps,
    required int weightKg,
    required Exercise exercise,
  }) async =>
      _workoutSetDao.createSetForWorkout(
        workoutId: workoutId,
        reps: reps,
        weightKg: weightKg,
        exercise: exercise,
      );

  /// when we need to update a sets attributes, we will call this method
  Future<void> updateWorkoutSet({
    required int setId,
    required int reps,
    required int weightKg,
    required Exercise exercise,
  }) async =>
      _workoutSetDao.updateWorkoutSet(
        setId: setId,
        reps: reps,
        weightKg: weightKg,
        exercise: exercise,
      );

  /// Returns a stream for all workout sets based on the specific workout ID
  Future<Stream<List<WorkoutSet>>> fetchAllWorkoutSets(int workoutId) =>
      _workoutSetDao.workoutSetsStream(
        workoutId: workoutId,
      );
}
