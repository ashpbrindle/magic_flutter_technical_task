import 'package:get_it/get_it.dart';
import 'package:repository/repository.dart';

final I = GetIt.instance;

/// Method used to regsiter all necessary dependencies for the repository layer
Future<void> regsiterRepositoryDependencies() async {
  // Repository for interfacing with Workouts in the datasource layer
  I.registerFactory<WorkoutsRepository>(
    () => WorkoutsRepository(
      workoutDao: I.get(),
    ),
  );
  
  // Repository for interfacing with Workout Sets in the datasource layer
  I.registerFactory<WorkoutSetRepository>(
    () => WorkoutSetRepository(
      workoutSetDao: I.get(),
    ),
  );
}
