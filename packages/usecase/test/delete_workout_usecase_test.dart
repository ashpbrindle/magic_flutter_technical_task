import 'package:entity/entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:repository/repository.dart';
import 'package:usecase/usecase.dart';

void main() {
  final WorkoutSetRepository workoutSetsRepository = MockWorkoutSetRepository();
  final WorkoutsRepository workoutsRepository = MockWorkoutsRepository();
  when(
    () => workoutSetsRepository.deleteSetsForWorkout(
      workout: const Workout(
        title: 'Workout 1',
        id: 1,
      ),
    ),
  ).thenAnswer((_) => Future.value());
  when(
    () => workoutsRepository.deleteWorkout(
      workout: const Workout(
        title: 'Workout 1',
        id: 1,
      ),
    ),
  ).thenAnswer((_) => Future.value());
  test(
    'calling the DeleteWorkoutUsecase, calls WorkoutSetRepository once',
    () {
      final usecase = DeleteWorkoutUsecase(
        workoutsRepository: workoutsRepository,
        workoutSetRepository: workoutSetsRepository,
      );
      usecase.call(
        const Workout(
          title: 'Workout 1',
          id: 1,
        ),
      );
      verify(
        () => workoutSetsRepository.deleteSetsForWorkout(
          workout: const Workout(
            title: 'Workout 1',
            id: 1,
          ),
        ),
      ).called(1);
    },
  );
}

class MockWorkoutSetRepository extends Mock implements WorkoutSetRepository {}

class MockWorkoutsRepository extends Mock implements WorkoutsRepository {}
