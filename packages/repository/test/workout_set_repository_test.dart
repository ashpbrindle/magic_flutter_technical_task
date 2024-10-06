import 'package:database/database.dart';
import 'package:entity/entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:repository/repository.dart';

void main() {
  final WorkoutSetDao dao = MockWorkoutSetDao();
  const workout = Workout(title: "Workout 1", id: 1);
  const workoutSet = WorkoutSet(
    id: 1,
    exercise: Exercise.barbellRow,
    weightKg: 1,
    repetitions: 10,
  );
  when(() => dao.deleteSetsForWorkout(workout: workout))
      .thenAnswer((_) => Future.value());
  when(
    () => dao.updateWorkoutSet(
      setId: 1,
      reps: 1,
      weightKg: 1,
      exercise: Exercise.barbellRow,
    ),
  ).thenAnswer((_) => Future.value());
  when(
    () => dao.deleteSet(
      workoutSet: workoutSet,
    ),
  ).thenAnswer((_) => Future.value());
  when(
    () => dao.createSetForWorkout(
      workoutId: 1,
      reps: 1,
      weightKg: 1,
      exercise: Exercise.barbellRow,
    ),
  ).thenAnswer((_) => Future.value());
  when(
    () => dao.workoutSetsStream(workoutId: 1),
  ).thenAnswer((_) => Future.value(Stream.value([])));
  group(
    'Verify WorkoutSetRepository is calling WorkoutSetDao',
    () {
      test(
        'calling repository.deleteSetsForWorkout, calls dao.deleteSetsForWorkout once',
        () {
          final repository = WorkoutSetRepository(workoutSetDao: dao);
          repository.deleteSetsForWorkout(workout: workout);
          verify(() => dao.deleteSetsForWorkout(workout: workout)).called(1);
        },
      );
      test(
        'calling repository.deleteSet, calls dao.deleteSet once',
        () {
          final repository = WorkoutSetRepository(workoutSetDao: dao);
          repository.deleteSet(workoutSet: workoutSet);
          verify(() => dao.deleteSet(workoutSet: workoutSet)).called(1);
        },
      );
      test(
        'calling repository.createWorkoutSet, calls dao.createSetForWorkout once',
        () {
          final repository = WorkoutSetRepository(workoutSetDao: dao);
          repository.createWorkoutSet(
            workoutId: 1,
            reps: 1,
            weightKg: 1,
            exercise: Exercise.barbellRow,
          );
          verify(
            () => dao.createSetForWorkout(
              workoutId: 1,
              reps: 1,
              weightKg: 1,
              exercise: Exercise.barbellRow,
            ),
          ).called(1);
        },
      );
      test(
        'calling repository.updateWorkoutSet, calls dao.updateWorkoutSet once',
        () {
          final repository = WorkoutSetRepository(workoutSetDao: dao);
          repository.updateWorkoutSet(
            setId: 1,
            reps: 1,
            weightKg: 1,
            exercise: Exercise.barbellRow,
          );
          verify(
            () => dao.updateWorkoutSet(
              setId: 1,
              reps: 1,
              weightKg: 1,
              exercise: Exercise.barbellRow,
            ),
          ).called(1);
        },
      );
      test(
        'calling repository.fetchAllWorkoutSets, calls dao.updateWorkoutSet once',
        () {
          final repository = WorkoutSetRepository(workoutSetDao: dao);
          repository.fetchAllWorkoutSets(1);
          verify(
            () => dao.workoutSetsStream(workoutId: 1),
          ).called(1);
        },
      );
    },
  );
}

class MockWorkoutSetDao extends Mock implements WorkoutSetDao {}
