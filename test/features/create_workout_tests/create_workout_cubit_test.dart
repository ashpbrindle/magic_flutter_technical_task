import 'package:bloc_test/bloc_test.dart';
import 'package:magic_flutter_technical_task/features/create_workout/view_model/create_workout_cubit.dart';
import 'package:magic_flutter_technical_task/features/create_workout/view_model/create_workout_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:usecase/usecase.dart';

void main() {
  CreateWorkoutUsecase createWorkoutUsecase = MockCreateWorkoutUsecase();
  blocTest<CreateWorkoutCubit, CreateWorkoutState>(
    'When createWorkout is called, and the name is valid, call _createWorkoutUsecase',
    setUp: () {
      when(
        () => createWorkoutUsecase.call(
          name: "Workout Name",
        ),
      ).thenAnswer((_) async {});
    },
    build: () => CreateWorkoutCubit(
      createWorkoutUsecase: createWorkoutUsecase,
    ),
    act: (cubit) {
      cubit.updateName("Workout Name");
      cubit.createWorkout();
    },
    verify: (_) {
      verify(
        () => createWorkoutUsecase.call(name: "Workout Name"),
      ).called(1);
    },
  );
  blocTest<CreateWorkoutCubit, CreateWorkoutState>(
    'When createWorkout is called, and the name is invalid, _createWorkoutUsecase is not called',
    build: () => CreateWorkoutCubit(
      createWorkoutUsecase: createWorkoutUsecase,
    ),
    act: (cubit) {
      cubit.createWorkout();
    },
    verify: (_) {
      verifyNever(
        () => createWorkoutUsecase.call(name: ""),
      );
    },
  );
}

class MockCreateWorkoutUsecase extends Mock implements CreateWorkoutUsecase {}
