import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_flutter_technical_task/features/edit_workout/presentation/edit_workout_screen.dart';
import 'package:magic_flutter_technical_task/features/edit_workout/view_model/edit_workout_cubit.dart';
import 'package:magic_flutter_technical_task/features/edit_workout/view_model/edit_workout_state.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  testWidgets(
      'When the Edit Workout screen loads, all of the sets are present from the state',
      (WidgetTester tester) async {
    final cubit = MockEditWorkoutCubit();
    final sets = [
      const WorkoutSet(
        id: 10,
        exercise: Exercise.benchPress,
        weightKg: 10,
        repetitions: 5,
      ),
      const WorkoutSet(
        id: 11,
        exercise: Exercise.deadlift,
        weightKg: 100,
        repetitions: 1,
      ),
    ];
    final state = EditWorkoutState.loaded(
      workout: Workout(
        title: "Workout Name",
        id: 0,
        sets: sets,
      ),
    );
    when(() => cubit.stream).thenAnswer(
      (_) => const Stream.empty(),
    );
    when(() => cubit.state).thenReturn(state);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<EditWorkoutCubit>(
          create: (_) => cubit,
          child: const EditWorkoutScreen(),
        ),
      ),
    );

    expect(find.text("View and Update"), findsOneWidget);
    expect(find.text("Workout Name"), findsOneWidget);
    expect(find.text(Exercise.deadlift.title), findsOneWidget);
    expect(find.text(Exercise.benchPress.title), findsOneWidget);
    expect(find.text("10 Kg"), findsOneWidget);
    expect(find.text("100 Kg"), findsOneWidget);
    expect(find.text("5 Reps"), findsOneWidget);
    expect(find.text("1 Reps"), findsOneWidget);
  });
  testWidgets('When there are no sets in the workout, none are shown',
      (WidgetTester tester) async {
    final cubit = MockEditWorkoutCubit();
    const state = EditWorkoutState.loaded(
      workout: Workout(
        title: "Workout Name",
        id: 0,
      ),
    );
    when(() => cubit.stream).thenAnswer(
      (_) => const Stream.empty(),
    );
    when(() => cubit.state).thenReturn(state);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<EditWorkoutCubit>(
          create: (_) => cubit,
          child: const EditWorkoutScreen(),
        ),
      ),
    );

    expect(find.text("No Sets for this Workout Yet"), findsOneWidget);
  });
  testWidgets('When the workout is not provided to the state, an error is shown',
      (WidgetTester tester) async {
    final cubit = MockEditWorkoutCubit();
    const state = EditWorkoutState.error();
    when(() => cubit.stream).thenAnswer(
      (_) => const Stream.empty(),
    );
    when(() => cubit.state).thenReturn(state);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<EditWorkoutCubit>(
          create: (_) => cubit,
          child: const EditWorkoutScreen(),
        ),
      ),
    );

    expect(find.text("Something Went Wrong, Please Try Again"), findsOneWidget);
  });
}

class MockEditWorkoutCubit extends Mock implements EditWorkoutCubit {
  @override
  Future<void> close() => Future.value();
}
