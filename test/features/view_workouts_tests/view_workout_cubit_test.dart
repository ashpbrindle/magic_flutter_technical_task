import 'package:bloc_test/bloc_test.dart';
import 'package:entity/entity.dart';
import 'package:magic_flutter_technical_task/features/view_workouts/view_model/view_workouts_cubit.dart';
import 'package:magic_flutter_technical_task/features/view_workouts/view_model/view_workouts_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:usecase/usecase.dart';

void main() {
  FetchWorkoutsUsecase fetchWorkoutsUsecase = MockFetchWorkoutsUsecase();
  DeleteWorkoutUsecase deleteWorkoutUsecase = MockDeleteWorkoutUsecase();

  blocTest<ViewWorkoutsCubit, ViewWorkoutsState>(
    'When init is called, and a there are workouts in the database, ViewWorkoutsLoaded state',
    setUp: () {
      when(
        () => fetchWorkoutsUsecase.call(),
      ).thenAnswer(
        (_) => Future.value(
          Stream.value(
            [
              const Workout(title: "Workout 1", id: 1),
            ],
          ),
        ),
      );
    },
    build: () => ViewWorkoutsCubit(
      fetchWorkoutsUsecase: fetchWorkoutsUsecase,
      deleteWorkoutUsecase: deleteWorkoutUsecase,
    ),
    act: (cubit) {
      cubit.init();
    },
    verify: (_) => verify(
      () => fetchWorkoutsUsecase.call(),
    ).called(1),
    expect: () => [
      const ViewWorkoutsLoaded(
        workouts: [
          Workout(title: "Workout 1", id: 1),
        ],
      ),
    ],
  );
  blocTest<ViewWorkoutsCubit, ViewWorkoutsState>(
    'When deleteWorkout is called, verify _deleteWorkoutUsecase is called once',
    setUp: () {
      when(
        () => deleteWorkoutUsecase.call(
          const Workout(title: "Workout 1", id: 1),
        ),
      ).thenAnswer(
        (_) => Future.value(),
      );
    },
    build: () => ViewWorkoutsCubit(
      fetchWorkoutsUsecase: fetchWorkoutsUsecase,
      deleteWorkoutUsecase: deleteWorkoutUsecase,
    ),
    act: (cubit) {
      cubit.deleteWorkout(
        const Workout(title: "Workout 1", id: 1),
      );
    },
    verify: (_) => verify(
      () => deleteWorkoutUsecase.call(
        const Workout(title: "Workout 1", id: 1),
      ),
    ).called(1),
  );
}

class MockFetchWorkoutsUsecase extends Mock implements FetchWorkoutsUsecase {}

class MockDeleteWorkoutUsecase extends Mock implements DeleteWorkoutUsecase {}
