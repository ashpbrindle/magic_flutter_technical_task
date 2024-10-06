import 'package:database/database.dart';
import 'package:entity/entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:repository/repository.dart';

void main() {
  final WorkoutDao dao = MockWorkoutDao();
  const workout = Workout(title: "Workout 1", id: 1);
  when(
    () => dao.deleteWorkout(
      workout: const Workout(title: "Workout 1", id: 1),
    ),
  ).thenAnswer((_) => Future.value());
  when(
    () => dao.createWorkout(name: "Workout 1"),
  ).thenAnswer((_) => Future.value());
  when(
    () => dao.workoutStream(),
  ).thenAnswer(
    (_) => Future.value(
      Stream.value([]),
    ),
  );
  group(
    'Verify WorkoutSetRepository is calling WorkoutSetDao',
    () {
      test(
        'calling repository.createWorkout, calls dao.createWorkout once',
        () {
          final repository = WorkoutsRepository(workoutDao: dao);
          repository.createWorkout(name: "Workout 1");
          verify(() => dao.createWorkout(name: "Workout 1")).called(1);
        },
      );
      test(
        'calling repository.deleteWorkout, calls dao.deleteWorkout once',
        () {
          final repository = WorkoutsRepository(workoutDao: dao);
          repository.deleteWorkout(
            workout: workout,
          );
          verify(() => dao.deleteWorkout(
                workout: workout,
              )).called(1);
        },
      );
    },
  );
}

class MockWorkoutDao extends Mock implements WorkoutDao {}
