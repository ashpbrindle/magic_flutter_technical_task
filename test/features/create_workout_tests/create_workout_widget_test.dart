import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_flutter_technical_task/features/create_workout/presentation/create_workout_bottomsheet_impl.dart';
import 'package:magic_flutter_technical_task/features/create_workout/view_model/create_workout_cubit.dart';
import 'package:magic_flutter_technical_task/features/create_workout/view_model/create_workout_state.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  testWidgets(
      'When loading the CreateWorkoutBottomsheetImpl, verify the correct widgets are present',
      (WidgetTester tester) async {
    final cubit = MockCreateWorkoutCubit();
    when(() => cubit.stream).thenAnswer(
      (_) => const Stream.empty(),
    );
    when(() => cubit.state).thenReturn(
      const CreateWorkoutState(name: "Valid Name"),
    );
    when(() => cubit.createWorkout()).thenAnswer(
      (_) => Future.value(),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CreateWorkoutCubit>(
          create: (_) => cubit,
          child: const CreateWorkoutBottomsheetImpl(),
        ),
      ),
    );

    expect(find.byType(TextField), findsOneWidget);
    expect(find.text("Add Workout"), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    verify(() => cubit.createWorkout()).called(1);
  });
}

class MockCreateWorkoutCubit extends Mock implements CreateWorkoutCubit {
  @override
  Future<void> close() => Future.value();
}
