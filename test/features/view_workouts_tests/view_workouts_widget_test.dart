import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_flutter_technical_task/features/view_workouts/presentation/view_workouts_screen.dart';
import 'package:magic_flutter_technical_task/features/view_workouts/view_model/view_workouts_cubit.dart';
import 'package:magic_flutter_technical_task/features/view_workouts/view_model/view_workouts_state.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  testWidgets(
      'When loading the ViewWorkoutsScreen and there are no workouts, show a message',
      (WidgetTester tester) async {
    final cubit = MockViewWorkoutsCubit();
    const state = ViewWorkoutsLoaded(
      workouts: [],
    );
    when(() => cubit.stream).thenAnswer(
      (_) => const Stream.empty(),
    );
    when(() => cubit.state).thenReturn(state);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ViewWorkoutsCubit>(
          create: (_) => cubit,
          child: const ViewWorkoutsScreen(),
        ),
      ),
    );

    expect(
        find.text("No Workouts, Please Press the Add Button to Add a Workout"),
        findsOneWidget);
  });
  testWidgets(
      'When loading the ViewWorkoutsScreen and there are workouts, all workouts are shown by title',
      (WidgetTester tester) async {
    final cubit = MockViewWorkoutsCubit();
    final workouts = [
      const Workout(
        title: "Workout 1",
        id: 1,
      ),
      const Workout(
        title: "Workout 2",
        id: 2,
      )
    ];
    final state = ViewWorkoutsLoaded(
      workouts: workouts,
    );
    when(() => cubit.stream).thenAnswer(
      (_) => const Stream.empty(),
    );
    when(() => cubit.state).thenReturn(state);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ViewWorkoutsCubit>(
          create: (_) => cubit,
          child: const ViewWorkoutsScreen(),
        ),
      ),
    );

    expect(find.byIcon(Icons.fitness_center), findsNWidgets(2));
    expect(find.text(workouts.first.title), findsOneWidget);
    expect(find.text(workouts.last.title), findsOneWidget);
  });
}

class MockViewWorkoutsCubit extends Mock implements ViewWorkoutsCubit {
  @override
  Future<void> close() => Future.value();
}
