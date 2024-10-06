import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:magic_flutter_technical_task/features/create_workout_set/presentation/create_edit_workout_set_bottomsheet.dart';

class WorkoutSetTile extends StatelessWidget {
  const WorkoutSetTile({
    super.key,
    required this.workoutSet,
    required this.workoutId,
  });

  final WorkoutSet workoutSet;
  final int workoutId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => CreateWorkoutSetBottomsheet(
            workoutId: workoutId,
            workoutSet: workoutSet,
          ),
        );
      },
      leading: const Icon(
        Icons.fitness_center,
        color: Colors.white,
      ),
      title: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              workoutSet.exercise.title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              "${workoutSet.weightKg} Kg",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              "${workoutSet.repetitions} Reps",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
