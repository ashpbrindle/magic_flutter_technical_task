import 'package:entity/entity.dart';
import 'package:repository/repository.dart';

class FetchSetsUsecase {
  FetchSetsUsecase({
    required WorkoutSetRepository workoutSetRepository,
  }) : _workoutSetRepository = workoutSetRepository;

  final WorkoutSetRepository _workoutSetRepository;

  /// Usecase used to fetch the stream of all workout sets for a specific ID
  Future<Stream<List<WorkoutSet>>> call(int workoutId) async =>
      _workoutSetRepository.fetchAllWorkoutSets(workoutId);
}
