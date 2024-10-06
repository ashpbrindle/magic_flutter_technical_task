import 'package:entity/entity.dart';
import 'package:repository/repository.dart';

class DeleteSetUsecase {
  DeleteSetUsecase({
    required WorkoutSetRepository workoutSetRepository,
  }) : _workoutSetRepository = workoutSetRepository;

  final WorkoutSetRepository _workoutSetRepository;
  
  /// Usecase used to delete a workout set
  Future<void> call(
    WorkoutSet workoutSet,
  ) async {
    await _workoutSetRepository.deleteSet(
      workoutSet: workoutSet,
    );
  }
}
