import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_flutter_technical_task/app_routes.dart';

class WorkoutTile extends StatelessWidget {
  const WorkoutTile({
    super.key,
    required this.workout,
  });

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.go(
          AppRoutes.editWorkouts,
          extra: workout,
        );
      },
      leading: const Icon(
        Icons.fitness_center,
        color: Colors.white,
      ),
      title: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          workout.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
