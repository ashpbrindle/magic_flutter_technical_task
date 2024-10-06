import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:repository/repository.dart';
import 'package:usecase/usecase.dart';

void main() {
  final WorkoutsRepository repo = MockWorkoutsRepository();
  when(
    () => repo.createWorkout(name: "Workout 1"),
  ).thenAnswer((_) => Future.value());
  test(
    'calling the CreateWorkoutUsecase, calls WorkoutsRepository once',
    () {
      final usecase = CreateWorkoutUsecase(workoutsRepository: repo);
      usecase.call(name: "Workout 1");
      verify(
        () => repo.createWorkout(name: "Workout 1"),
      ).called(1);
    },
  );
}

class MockWorkoutsRepository extends Mock implements WorkoutsRepository {}
