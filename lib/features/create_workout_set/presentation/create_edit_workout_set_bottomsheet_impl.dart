import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_flutter_technical_task/features/create_workout_set/view_model/create_edit_workout_set_cubit.dart';
import 'package:magic_flutter_technical_task/features/create_workout_set/view_model/create_edit_workout_set_state.dart';

class CreateEditWorkoutSetBottomsheetImpl extends StatefulWidget {
  const CreateEditWorkoutSetBottomsheetImpl({
    super.key,
    this.workoutSet,
  });

  final WorkoutSet? workoutSet;

  @override
  State<CreateEditWorkoutSetBottomsheetImpl> createState() =>
      _CreateEditWorkoutSetBottomsheetImplState();
}

class _CreateEditWorkoutSetBottomsheetImplState
    extends State<CreateEditWorkoutSetBottomsheetImpl> {
  TextEditingController weightController = TextEditingController();
  TextEditingController repetitionController = TextEditingController();
  Exercise? selectedExercise;

  @override
  void initState() {
    super.initState();
    weightController.text = widget.workoutSet?.weightKg.toString() ?? '';
    repetitionController.text = widget.workoutSet?.repetitions.toString() ?? '';
    selectedExercise = widget.workoutSet?.exercise;
    weightController.addListener(_listener);
    repetitionController.addListener(_listener);
  }

  @override
  void dispose() {
    weightController.removeListener(_listener);
    repetitionController.removeListener(_listener);
    super.dispose();
  }

  void _listener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEditWorkoutSetCubit, CreateEditWorkoutSetState>(
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
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    decoration: const InputDecoration(
                      hintText: "Please Enter Weight",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    controller: repetitionController,
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Please Enter Repetitions",
                    ),
                  ),
                ),
                DropdownButton<Exercise>(
                  value: selectedExercise,
                  onChanged: (Exercise? newValue) {
                    setState(() {
                      selectedExercise = newValue;
                    });
                  },
                  hint: const Text("Please Enter Exercise Type"),
                  items: Exercise.values.map(
                    (Exercise exercise) {
                      return DropdownMenuItem<Exercise>(
                        value: exercise,
                        child:
                            Text(exercise.title), // Displays only the enum name
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: weightController.text.isNotEmpty &&
                          repetitionController.text.isNotEmpty &&
                          selectedExercise != null
                      ? () {
                          context
                              .read<CreateEditWorkoutSetCubit>()
                              .createOrUpdateWorkoutSet(
                                repetition: repetitionController.text,
                                weight: weightController.text,
                                exercise: selectedExercise!,
                              );
                          Navigator.of(context).pop();
                        }
                      : null,
                  child: const Text("Add Workout Set"),
                )
              ],
            ),
          );
        },
      );
    });
  }
}
