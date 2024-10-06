import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_flutter_technical_task/features/edit_workout/presentation/edit_workout_screen.dart';
import 'package:magic_flutter_technical_task/features/edit_workout/view_model/edit_workout_cubit.dart';
import 'package:magic_flutter_technical_task/features/view_workouts/presentation/view_workouts_screen.dart';
import 'package:magic_flutter_technical_task/features/view_workouts/view_model/view_workouts_cubit.dart';

/// Class containing all of the app routes for the app
class AppRoutes {
  // String constants for the app routes, including subroute definitions
  static const String viewWorkouts = "/view-workouts";
  // Allows navigation directly to editWorkouts without having to type the full route path in everytime we navigate
  static const String editWorkouts = "$viewWorkouts/edit-workouts";

  // List of all app routes with the defined BlocProviders for each screen and subroutes for each screen
  List<RouteBase> get routes => <RouteBase>[
        GoRoute(
          path: viewWorkouts,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (_) => ViewWorkoutsCubit(
                fetchWorkoutsUsecase: GetIt.I.get(),
                deleteWorkoutUsecase: GetIt.I.get(),
              )..init(),
              child: const ViewWorkoutsScreen(),
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: editWorkouts.subRouteKey,
              builder: (BuildContext context, GoRouterState state) {
                // When navigating to the Edit Workout Screen, you can provide the Workout to edit in the extra
                // If this is not provided, null will be provided to the Cubit, resulting in an error state
                final Workout? workout =
                    state.extra != null && state.extra is Workout
                        ? state.extra as Workout
                        : null;
                return BlocProvider(
                  create: (_) => EditWorkoutCubit(
                    fetchSetsUsecase: GetIt.I.get(),
                    deleteSetUsecase: GetIt.I.get(),
                  )..init(workout),
                  child: const EditWorkoutScreen(),
                );
              },
            ),
          ],
        ),
      ];
}

extension _SubRouteKeyFetcher on String {
  String get subRouteKey => split("/").last;
}
