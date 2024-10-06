import 'package:bloc_test/bloc_test.dart';
import 'package:entity/entity.dart';
import 'package:magic_flutter_technical_task/features/create_workout_set/view_model/create_edit_workout_set_cubit.dart';
import 'package:magic_flutter_technical_task/features/create_workout_set/view_model/create_edit_workout_set_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:usecase/usecase.dart';

void main() {
  CreateWorkoutSetUsecase createWorkoutSetUsecase =
      MockCreateWorkoutSetUsecase();
  UpdateWorkoutSetUsecase updateWorkoutSetUsecase =
      MockUpdateWorkoutSetUsecase();
  blocTest<CreateEditWorkoutSetCubit, CreateEditWorkoutSetState>(
    'When no Workout set is supplied, call Create Usecase instead',
    setUp: () {
      when(
        () => createWorkoutSetUsecase.call(
          workoutId: 1,
          exercise: Exercise.benchPress,
          reps: 1,
          weightKg: 10,
        ),
      ).thenAnswer((_) async {});
    },
    build: () => CreateEditWorkoutSetCubit(
      workoutId: 1,
      createWorkoutSetUsecase: createWorkoutSetUsecase,
      updateWorkoutSetUsecase: updateWorkoutSetUsecase,
    ),
    act: (cubit) => cubit.createOrUpdateWorkoutSet(
      exercise: Exercise.benchPress,
      repetition: "1",
      weight: "10",
    ),
    verify: (_) {
      verify(
        () => createWorkoutSetUsecase.call(
          workoutId: 1,
          exercise: Exercise.benchPress,
          reps: 1,
          weightKg: 10,
        ),
      ).called(1);
    },
  );
  blocTest<CreateEditWorkoutSetCubit, CreateEditWorkoutSetState>(
    'When a Workout set is supplied, call Update Usecase instead',
    setUp: () {
      when(
        () => updateWorkoutSetUsecase.call(
          setId: 1,
          exercise: Exercise.benchPress,
          reps: 1,
          weightKg: 10,
        ),
      ).thenAnswer((_) async {});
    },
    build: () => CreateEditWorkoutSetCubit(
      workoutId: 1,
      workoutSet: const WorkoutSet(
        id: 1,
        exercise: Exercise.benchPress,
        repetitions: 1,
        weightKg: 10,
      ),
      createWorkoutSetUsecase: createWorkoutSetUsecase,
      updateWorkoutSetUsecase: updateWorkoutSetUsecase,
    ),
    act: (cubit) => cubit.createOrUpdateWorkoutSet(
      exercise: Exercise.benchPress,
      repetition: "1",
      weight: "10",
    ),
    verify: (_) {
      verify(
        () => updateWorkoutSetUsecase.call(
          setId: 1,
          exercise: Exercise.benchPress,
          reps: 1,
          weightKg: 10,
        ),
      ).called(1);
    },
  );
}

class MockCreateWorkoutSetUsecase extends Mock
    implements CreateWorkoutSetUsecase {}

class MockUpdateWorkoutSetUsecase extends Mock
    implements UpdateWorkoutSetUsecase {}
