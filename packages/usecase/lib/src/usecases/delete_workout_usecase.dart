import 'package:entity/entity.dart';
import 'package:repository/repository.dart';

class DeleteWorkoutUsecase {
  DeleteWorkoutUsecase({
    required WorkoutsRepository workoutsRepository,
    required WorkoutSetRepository workoutSetRepository,
  })  : _workoutsRepository = workoutsRepository,
        _workoutSetRepository = workoutSetRepository;

  final WorkoutsRepository _workoutsRepository;
  final WorkoutSetRepository _workoutSetRepository;

  /// Usecase used delete the workout and its associated sets,
  /// This will initially delete all workout sets associated with a workout
  /// and then delete the workout itself
  Future<void> call(
    Workout workout,
  ) async {
    await _workoutSetRepository.deleteSetsForWorkout(
      workout: workout,
    );
    await _workoutsRepository.deleteWorkout(
      workout: workout,
    );
  }
}
