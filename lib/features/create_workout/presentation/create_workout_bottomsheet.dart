import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:magic_flutter_technical_task/features/create_workout/presentation/create_workout_bottomsheet_impl.dart';
import 'package:magic_flutter_technical_task/features/create_workout/view_model/create_workout_cubit.dart';

class CreateWorkoutBottomsheet extends StatefulWidget {
  const CreateWorkoutBottomsheet({
    super.key,
  });

  @override
  State<CreateWorkoutBottomsheet> createState() =>
      _CreateWorkoutBottomsheetState();
}

class _CreateWorkoutBottomsheetState extends State<CreateWorkoutBottomsheet> {
  TextEditingController workoutNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateWorkoutCubit(
        createWorkoutUsecase: GetIt.I.get(),
      ),
      child: const CreateWorkoutBottomsheetImpl(),
    );
  }
}
