import 'dart:async';

import 'package:entity/entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_flutter_technical_task/features/view_workouts/view_model/view_workouts_state.dart';
import 'package:usecase/usecase.dart';

class ViewWorkoutsCubit extends Cubit<ViewWorkoutsState> {
  ViewWorkoutsCubit({
    required FetchWorkoutsUsecase fetchWorkoutsUsecase,
    required DeleteWorkoutUsecase deleteWorkoutUsecase,
  })  : _fetchWorkoutsUsecase = fetchWorkoutsUsecase,
        _deleteWorkoutUsecase = deleteWorkoutUsecase,
        super(const ViewWorkoutsLoading());

  final FetchWorkoutsUsecase _fetchWorkoutsUsecase;
  final DeleteWorkoutUsecase _deleteWorkoutUsecase;
  StreamSubscription<List<Workout>>? _workoutsStream;

  /// When the Cubit is created we call init (Called from where we use the BlocProvider in AppRoutes)
  Future<void> init() async {
    // Feetch the stream of workouts from the database layer using the Fetch Workouts Usecase
    final workouts = await _fetchWorkoutsUsecase.call();
    // Listens and assigns the stream to a StreamSubscription to be later disposed
    _workoutsStream = workouts.listen((workouts) {
      // Whenever we have a new Workout in the database we update the state automatically
      emit(
        ViewWorkoutsLoaded(
          workouts: workouts,
        ),
      );
    });
  }

  /// Called against a workout when we need to delete a specific workout, calls the Delete Workout Usecase
  Future<void> deleteWorkout(Workout workout) =>
      _deleteWorkoutUsecase.call(workout);

  @override
  Future<void> close() async {
    // Cancels the stream when the Cubit is closed
    _workoutsStream?.cancel();
    return super.close();
  }
}
