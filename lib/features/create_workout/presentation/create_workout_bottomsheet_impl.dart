import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_flutter_technical_task/features/create_workout/view_model/create_workout_cubit.dart';
import 'package:magic_flutter_technical_task/features/create_workout/view_model/create_workout_state.dart';

class CreateWorkoutBottomsheetImpl extends StatefulWidget {
  const CreateWorkoutBottomsheetImpl({super.key});

  @override
  State<CreateWorkoutBottomsheetImpl> createState() =>
      _CreateWorkoutBottomsheetImplState();
}

class _CreateWorkoutBottomsheetImplState
    extends State<CreateWorkoutBottomsheetImpl> {
  TextEditingController workoutNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateWorkoutCubit, CreateWorkoutState>(
        builder: (context, state) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    onChanged: (name) =>
                        context.read<CreateWorkoutCubit>().updateName(name),
                    controller: workoutNameController,
                    maxLength: 20,
                    decoration: const InputDecoration(
                      hintText: "Please Enter Your Workout Name",
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: state.isValidName
                      ? () {
                          context.read<CreateWorkoutCubit>().createWorkout();
                          Navigator.of(context).pop();
                        }
                      : null,
                  child: const Text("Add Workout"),
                )
              ],
            ),
          );
        },
      );
    });
  }
}
