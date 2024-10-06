import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_flutter_technical_task/features/create_workout/view_model/create_workout_state.dart';
import 'package:usecase/usecase.dart';

class CreateWorkoutCubit extends Cubit<CreateWorkoutState> {
  CreateWorkoutCubit({
    required CreateWorkoutUsecase createWorkoutUsecase,
  })  : _createWorkoutUsecase = createWorkoutUsecase,
        super(const CreateWorkoutState());

  final CreateWorkoutUsecase _createWorkoutUsecase;

  void updateName(String name) {
    emit(
      CreateWorkoutState(
        name: name,
      ),
    );
  }

  /// This method is called when the user wants to create a workout
  Future<void> createWorkout() async {
    // Even though we have validation in the widget for the name, we have extra validation here
    if (state.isValidName) {
      // Call the usecase to create a workout, using the name saved in the state
      _createWorkoutUsecase.call(
        name: state.name!,
      );
    }
  }
}
