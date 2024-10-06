import 'package:get_it/get_it.dart';
import 'package:usecase/usecase.dart';

final I = GetIt.instance;

/// Registration of all usecases
Future<void> regsiterUsecaseDependencies() async {
  I.registerFactory<CreateWorkoutUsecase>(
    () => CreateWorkoutUsecase(
      workoutsRepository: I.get(),
    ),
  );
  I.registerFactory<FetchWorkoutsUsecase>(
    () => FetchWorkoutsUsecase(
      workoutsRepository: I.get(),
    ),
  );
  I.registerFactory<DeleteWorkoutUsecase>(
    () => DeleteWorkoutUsecase(
      workoutsRepository: I.get(),
      workoutSetRepository: I.get(),
    ),
  );
  I.registerFactory<CreateWorkoutSetUsecase>(
    () => CreateWorkoutSetUsecase(
      workoutSetRepository: I.get(),
    ),
  );
  I.registerFactory<FetchSetsUsecase>(
    () => FetchSetsUsecase(
      workoutSetRepository: I.get(),
    ),
  );
  I.registerFactory<DeleteSetUsecase>(
    () => DeleteSetUsecase(
      workoutSetRepository: I.get(),
    ),
  );
  I.registerFactory<UpdateWorkoutSetUsecase>(
    () => UpdateWorkoutSetUsecase(
      workoutSetRepository: I.get(),
    ),
  );
}
