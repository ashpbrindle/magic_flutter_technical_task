import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_flutter_technical_task/di.dart';
import 'package:magic_flutter_technical_task/app_routes.dart';

Future<void> main() async {
  // Initial call to setup the dependencies
  await registerDependencies();
  // Define the router using the routes defined in AppRoutes
  final router = GoRouter(
    initialLocation: AppRoutes.viewWorkouts,
    routes: AppRoutes().routes,
  );

  runApp(
    MaterialApp.router(
      routerConfig: router,
    ),
  );
}
