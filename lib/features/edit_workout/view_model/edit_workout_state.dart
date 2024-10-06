import 'package:entity/entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_workout_state.freezed.dart';

@freezed
class EditWorkoutState with _$EditWorkoutState {
  const factory EditWorkoutState.loaded({
    required Workout workout,
  }) = EditWorkoutLoaded;
  const factory EditWorkoutState.loading() = EditWorkoutLoading;
  const factory EditWorkoutState.error() = EditWorkoutError;
}
