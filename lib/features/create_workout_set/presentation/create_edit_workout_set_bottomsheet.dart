import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:magic_flutter_technical_task/features/create_workout_set/presentation/create_edit_workout_set_bottomsheet_impl.dart';
import 'package:magic_flutter_technical_task/features/create_workout_set/view_model/create_edit_workout_set_cubit.dart';

class CreateWorkoutSetBottomsheet extends StatelessWidget {
  const CreateWorkoutSetBottomsheet({
    super.key,
    required this.workoutId,
    this.workoutSet,
  });

  final WorkoutSet? workoutSet;
  final int workoutId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateEditWorkoutSetCubit(
        workoutSet: workoutSet,
        workoutId: workoutId,
        createWorkoutSetUsecase: GetIt.I.get(),
        updateWorkoutSetUsecase: GetIt.I.get(),
      ),
      child: CreateEditWorkoutSetBottomsheetImpl(
        workoutSet: workoutSet,
      ),
    );
  }
}
