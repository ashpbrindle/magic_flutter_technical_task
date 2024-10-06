import 'package:entity/entity.dart';
import 'package:repository/repository.dart';

class FetchWorkoutsUsecase {
  FetchWorkoutsUsecase({
    required WorkoutsRepository workoutsRepository,
  }) : _workoutsRepository = workoutsRepository;

  final WorkoutsRepository _workoutsRepository;

  /// Usecase used to fetch the stream of all workouts
  Future<Stream<List<Workout>>> call() async => _workoutsRepository.fetchAllWorkouts();
}
