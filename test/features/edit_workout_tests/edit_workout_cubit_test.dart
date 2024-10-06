import 'package:bloc_test/bloc_test.dart';
import 'package:entity/entity.dart';
import 'package:magic_flutter_technical_task/features/edit_workout/view_model/edit_workout_cubit.dart';
import 'package:magic_flutter_technical_task/features/edit_workout/view_model/edit_workout_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:usecase/usecase.dart';

void main() {
  FetchSetsUsecase fetchSetsUsecase = MockFetchSetsUsecase();
  DeleteSetUsecase deleteSetUsecase = MockDeleteSetUsecase();
  blocTest<EditWorkoutCubit, EditWorkoutState>(
      'When init is called, and no workout is provided, EditWorkoutError state',
      build: () => EditWorkoutCubit(
            fetchSetsUsecase: fetchSetsUsecase,
            deleteSetUsecase: deleteSetUsecase,
          ),
      act: (cubit) {
        cubit.init(null);
      },
      expect: () => [const EditWorkoutError()]);
  blocTest<EditWorkoutCubit, EditWorkoutState>(
    'When init is called, and a workout is provided, EditWorkoutLoaded state',
    setUp: () {
      when(
        () => fetchSetsUsecase.call(1),
      ).thenAnswer((_) => Future.value(Stream.value([])));
    },
    build: () => EditWorkoutCubit(
      fetchSetsUsecase: fetchSetsUsecase,
      deleteSetUsecase: deleteSetUsecase,
    ),
    act: (cubit) {
      cubit.init(
        const Workout(
          title: "Edit Work",
          id: 1,
        ),
      );
    },
    verify: (_) {
      verify(
        () => fetchSetsUsecase.call(1),
      ).called(1);
    },
    expect: () => [
      const EditWorkoutLoading(),
      const EditWorkoutLoaded(workout: Workout(title: "Edit Work", id: 1))
    ],
  );
  blocTest<EditWorkoutCubit, EditWorkoutState>(
    'When deleteSet is called, verify the deleteSetUsecase is called',
    setUp: () {
      when(
        () => deleteSetUsecase.call(
          const WorkoutSet(
            id: 1,
            exercise: Exercise.barbellRow,
            weightKg: 10,
            repetitions: 1,
          ),
        ),
      ).thenAnswer((_) => Future.value());
    },
    build: () => EditWorkoutCubit(
      fetchSetsUsecase: fetchSetsUsecase,
      deleteSetUsecase: deleteSetUsecase,
    ),
    act: (cubit) {
      cubit.deleteSet(
        const WorkoutSet(
          id: 1,
          exercise: Exercise.barbellRow,
          weightKg: 10,
          repetitions: 1,
        ),
      );
    },
    verify: (_) {
      verify(
        () => deleteSetUsecase.call(
          const WorkoutSet(
            id: 1,
            exercise: Exercise.barbellRow,
            weightKg: 10,
            repetitions: 1,
          ),
        ),
      ).called(1);
    },
  );
}

class MockFetchSetsUsecase extends Mock implements FetchSetsUsecase {}

class MockDeleteSetUsecase extends Mock implements DeleteSetUsecase {}
