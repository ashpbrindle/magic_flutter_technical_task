import 'package:database/database.dart';
import 'package:get_it/get_it.dart';
import 'package:repository/repository.dart';
import 'package:usecase/usecase.dart';

final I = GetIt.instance;

/// Method called to register dependencies for all of the packages in the project
Future<void> registerDependencies() async {
  // Each package has its own dependency injector, to avoid exposing unnecessary services to other layers in the app
  await Future.wait([
    // Usecase Dependencies
    regsiterUsecaseDependencies(),
    // Repository Dependencies
    regsiterRepositoryDependencies(),
    // Database and Dao Dependencies
    regsiterDatabaseDependencies(),
  ]);
}
