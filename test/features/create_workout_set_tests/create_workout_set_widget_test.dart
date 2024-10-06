import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_flutter_technical_task/features/create_workout_set/presentation/create_edit_workout_set_bottomsheet_impl.dart';
import 'package:magic_flutter_technical_task/features/create_workout_set/view_model/create_edit_workout_set_cubit.dart';
import 'package:magic_flutter_technical_task/features/create_workout_set/view_model/create_edit_workout_set_state.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  testWidgets('When loading the CreateEditWorkoutSetBottomsheetImpl, verify the correct widgets are present', (WidgetTester tester) async {
    final cubit = MockCreateEditWorkoutSetCubit();
    when(() => cubit.stream).thenAnswer(
      (_) => const Stream.empty(),
    );
    when(() => cubit.state).thenReturn(
      const CreateEditWorkoutSetState(
        workoutId: 0,
        workoutSet: WorkoutSet(
          id: 1,
          exercise: Exercise.squat,
          weightKg: 10,
          repetitions: 1,
        ),
      ),
    );
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CreateEditWorkoutSetCubit>(
          create: (_) => cubit,
          child: const CreateEditWorkoutSetBottomsheetImpl(),
        ),
      ),
    );

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(DropdownButton<Exercise>), findsOneWidget);

    expect(find.text("Add Workout Set"), findsOneWidget);
  });
}

class MockCreateEditWorkoutSetCubit extends Mock
    implements CreateEditWorkoutSetCubit {
  @override
  Future<void> close() => Future.value();
}
