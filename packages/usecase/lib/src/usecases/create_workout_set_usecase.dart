import 'package:entity/entity.dart';
import 'package:repository/repository.dart';

class CreateWorkoutSetUsecase {
  CreateWorkoutSetUsecase({
    required WorkoutSetRepository workoutSetRepository,
  }) : _workoutSetRepository = workoutSetRepository;

  final WorkoutSetRepository _workoutSetRepository;

  /// Usecase used to create a workout set for an existing workout
  Future<void> call({
    required int workoutId,
    required Exercise exercise,
    required int reps,
    required int weightKg,
  }) async =>
      _workoutSetRepository.createWorkoutSet(
        workoutId: workoutId,
        exercise: exercise,
        reps: reps,
        weightKg: weightKg,
      );
}
