import 'package:entity/entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_flutter_technical_task/features/create_workout_set/view_model/create_edit_workout_set_state.dart';
import 'package:usecase/usecase.dart';

class CreateEditWorkoutSetCubit extends Cubit<CreateEditWorkoutSetState> {
  // When the Cubit is created, we provide it with the workoutId as well as the WorkoutSet we would like to edit,
  // If the WorkoutSet is null in this case, we will be creating a new WorkoutSet instead of editing
  CreateEditWorkoutSetCubit({
    required int workoutId,
    WorkoutSet? workoutSet,
    required CreateWorkoutSetUsecase createWorkoutSetUsecase,
    required UpdateWorkoutSetUsecase updateWorkoutSetUsecase,
  })  : _createWorkoutSetUsecase = createWorkoutSetUsecase,
        _updateWorkoutSetUsecase = updateWorkoutSetUsecase,
        super(
          CreateEditWorkoutSetState(
            workoutSet: workoutSet,
            workoutId: workoutId,
          ),
        );

  final CreateWorkoutSetUsecase _createWorkoutSetUsecase;
  final UpdateWorkoutSetUsecase _updateWorkoutSetUsecase;

  // When the user submits their choices, this method will be called to update or create the WorkoutSet
  Future<void> createOrUpdateWorkoutSet({
    required String repetition,
    required String weight,
    required Exercise exercise,
  }) async {
    // Converts the String values from the controllers into integers so this can be provided to the usecase layer
    final intReps = int.tryParse(repetition);
    final intWeight = int.tryParse(weight);
    // Validation
    if (intReps != null && intWeight != null) {
      // Determines if the WorkoutSet is being edited or created from scratch
      if (state.workoutSet != null) {
        // If edited, calls the Update WorkoutSet Usecase
        _updateWorkoutSetUsecase.call(
          setId: state.workoutSet!.id,
          exercise: exercise,
          reps: intReps,
          weightKg: intWeight,
        );
      } else {
        // If new, calls the Create WorkoutSet Usecase
        _createWorkoutSetUsecase.call(
          workoutId: state.workoutId,
          exercise: exercise,
          reps: intReps,
          weightKg: intWeight,
        );
      }
    }
    // Could include error states here if needed to notify the user something went wrong
  }
}
