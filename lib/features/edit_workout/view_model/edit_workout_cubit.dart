import 'dart:async';

import 'package:entity/entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_flutter_technical_task/features/edit_workout/view_model/edit_workout_state.dart';
import 'package:usecase/usecase.dart';

class EditWorkoutCubit extends Cubit<EditWorkoutState> {
  EditWorkoutCubit({
    required FetchSetsUsecase fetchSetsUsecase,
    required DeleteSetUsecase deleteSetUsecase,
  })  : _fetchSetsUsecase = fetchSetsUsecase,
        _deleteSetUsecase = deleteSetUsecase,
        super(const EditWorkoutLoading());

  final FetchSetsUsecase _fetchSetsUsecase;
  final DeleteSetUsecase _deleteSetUsecase;
  StreamSubscription<List<WorkoutSet>>? _workoutSetsStream;

  /// When the Cubit is created we call init (Called from where we use the BlocProvider in AppRoutes)
  /// The workout is nullable here as it could be null if not passed through the route in AppRoutes
  Future<void> init(
    Workout? workout,
  ) async {
    if (workout != null) {
      // Listens to the stream of Workout Sets and assigns to a stream variable so this can be disposed of when the cubit is closed
      _workoutSetsStream = (await _fetchSetsUsecase.call(workout.id)).listen(
        (sets) {
          // Whenever a new set is added to the database for the currently selected workout
          // We will enter a loading state and update the selected workout in the UI with the new sets after editing/adding
          emit(const EditWorkoutLoading());
          emit(
            EditWorkoutLoaded(
              workout: workout.copyWith(
                sets: sets,
              ),
            ),
          );
        },
      );
    } else {
      // Error state for if the workout is not provided when navigating
      emit(const EditWorkoutError());
    }
  }

  /// Called against a workoutSet when we need to delete a specific set, calls the Delete Set Usecase
  Future<void> deleteSet(WorkoutSet workoutSet) async =>
      _deleteSetUsecase.call(workoutSet);

  @override
  Future<void> close() async {
    // When the Cubit is closed, the stream will be cancelled
    _workoutSetsStream?.cancel();
    return super.close();
  }
}
