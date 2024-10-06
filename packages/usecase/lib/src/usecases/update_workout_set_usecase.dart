import 'package:entity/entity.dart';
import 'package:repository/repository.dart';

class UpdateWorkoutSetUsecase {
  UpdateWorkoutSetUsecase({
    required WorkoutSetRepository workoutSetRepository,
  }) : _workoutSetRepository = workoutSetRepository;

  final WorkoutSetRepository _workoutSetRepository;

  /// Usecase used to update exisiting workout sets
  Future<void> call({
    required int setId,
    required Exercise exercise,
    required int reps,
    required int weightKg,
  }) async =>
      _workoutSetRepository.updateWorkoutSet(
        setId: setId,
        exercise: exercise,
        reps: reps,
        weightKg: weightKg,
      );
}
