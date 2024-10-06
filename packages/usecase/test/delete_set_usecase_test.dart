import 'package:entity/entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:repository/repository.dart';
import 'package:usecase/usecase.dart';

void main() {
  final WorkoutSetRepository repo = MockWorkoutSetRepository();
  when(
    () => repo.deleteSet(
      workoutSet: const WorkoutSet(
        id: 1,
        exercise: Exercise.barbellRow,
        weightKg: 1,
        repetitions: 1,
      ),
    ),
  ).thenAnswer((_) => Future.value());
  test(
    'calling the DeleteSetUsecase, calls WorkoutSetRepository once',
    () {
      final usecase = DeleteSetUsecase(workoutSetRepository: repo);
      usecase.call(
        const WorkoutSet(
          id: 1,
          exercise: Exercise.barbellRow,
          weightKg: 1,
          repetitions: 1,
        ),
      );
      verify(
        () => repo.deleteSet(
          workoutSet: const WorkoutSet(
            id: 1,
            exercise: Exercise.barbellRow,
            weightKg: 1,
            repetitions: 1,
          ),
        ),
      ).called(1);
    },
  );
}

class MockWorkoutSetRepository extends Mock implements WorkoutSetRepository {}
