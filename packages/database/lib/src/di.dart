import 'package:database/database.dart';
import 'package:database/src/workout_database.dart';
import 'package:get_it/get_it.dart';

final I = GetIt.instance;

/// Method used to regsiter all necessary dependencies for the database layer
Future<void> regsiterDatabaseDependencies() async {
  // Workout Dao for updating Workout Records
  I.registerFactory<WorkoutDao>(
    () => WorkoutDao(
      I.get(),
    ),
  );
  // Workout Dao for updating WorkoutSet Records
  I.registerFactory<WorkoutSetDao>(
    () => WorkoutSetDao(
      I.get(),
    ),
  );
  // Database registeration as a singleton, as we do not want multiple databases register in the app
  I.registerLazySingleton<WorkoutDatabase>(
    () => WorkoutDatabase(),
  );
}
