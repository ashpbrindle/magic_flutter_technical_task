import 'package:entity/entity.dart';
import 'package:database/database.dart';

class WorkoutsRepository {
  WorkoutsRepository({
    required WorkoutDao workoutDao,
  }) : _workoutDao = workoutDao;

  final WorkoutDao _workoutDao;

  /// Returns a stream for all workouts
  Future<Stream<List<Workout>>> fetchAllWorkouts() =>
      _workoutDao.workoutStream();

  /// Initially used to create a new Workout with only a name and no sets
  Future<void> createWorkout({
    required String name,
  }) async {
    _workoutDao.createWorkout(
      name: name,
    );
  }

  /// Will be used to delete an existing workout
  Future<void> deleteWorkout({
    required Workout workout,
  }) async =>
      _workoutDao.deleteWorkout(
        workout: workout,
      );
}
