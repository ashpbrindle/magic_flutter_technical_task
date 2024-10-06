import 'package:entity/entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:repository/repository.dart';
import 'package:usecase/usecase.dart';

void main() {
  final WorkoutSetRepository repo = MockWorkoutSetRepository();
  when(
    () => repo.createWorkoutSet(
      workoutId: 1,
      exercise: Exercise.barbellRow,
      reps: 1,
      weightKg: 1,
    ),
  ).thenAnswer((_) => Future.value());
  test(
    'calling the CreateWorkoutSetUsecase, calls WorkoutSetRepository once',
    () {
      final usecase = CreateWorkoutSetUsecase(workoutSetRepository: repo);
      usecase.call(
        workoutId: 1,
        exercise: Exercise.barbellRow,
        reps: 1,
        weightKg: 1,
      );
      verify(
        () => repo.createWorkoutSet(
          workoutId: 1,
          exercise: Exercise.barbellRow,
          reps: 1,
          weightKg: 1,
        ),
      ).called(1);
    },
  );
}

class MockWorkoutSetRepository extends Mock implements WorkoutSetRepository {}
