import 'package:repository/repository.dart';

class CreateWorkoutUsecase {
  CreateWorkoutUsecase({
    required WorkoutsRepository workoutsRepository,
  }) : _workoutsRepository = workoutsRepository;

  final WorkoutsRepository _workoutsRepository;

  /// Usecase used to create a workout
  Future<void> call({
    required String name,
  }) async =>
      _workoutsRepository.createWorkout(
        name: name,
      );
}
