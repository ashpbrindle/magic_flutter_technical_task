import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_flutter_technical_task/features/create_workout_set/presentation/create_edit_workout_set_bottomsheet.dart';
import 'package:magic_flutter_technical_task/features/edit_workout/presentation/widgets/workout_set_tile.dart';
import 'package:magic_flutter_technical_task/features/edit_workout/view_model/edit_workout_cubit.dart';
import 'package:magic_flutter_technical_task/features/edit_workout/view_model/edit_workout_state.dart';

class EditWorkoutScreen extends StatelessWidget {
  const EditWorkoutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditWorkoutCubit, EditWorkoutState>(
      builder: (context, state) {
        return state.when(
          loaded: (workout) => Scaffold(
            backgroundColor: Colors.blueGrey.shade700,
            appBar: AppBar(
              title: const Text(
                "View and Update",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.blueGrey.shade700,
            ),
            body: _body(context, workout),
          ),
          loading: () => Scaffold(
            backgroundColor: Colors.blueGrey.shade700,
            body: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
          error: () => Scaffold(
            backgroundColor: Colors.blueGrey.shade700,
            body: const Center(
              child: Text(
                "Something Went Wrong, Please Try Again",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _body(BuildContext context, Workout workout) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              workout.title,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => CreateWorkoutSetBottomsheet(
                    workoutId: workout.id,
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          ]),
          Center(
            child: workout.sets.isNotEmpty
                ? ListView(
                    shrinkWrap: true,
                    children: workout.sets
                        .map(
                          (workoutSet) => Dismissible(
                            direction: DismissDirection.startToEnd,
                            resizeDuration: const Duration(milliseconds: 200),
                            key: ObjectKey(workout),
                            onDismissed: (direction) {
                              context
                                  .read<EditWorkoutCubit>()
                                  .deleteSet(workoutSet);
                            },
                            background: Container(
                              padding: const EdgeInsets.only(left: 28.0),
                              alignment: AlignmentDirectional.centerStart,
                              color: Colors.red,
                              child: const Icon(
                                Icons.delete_forever,
                                color: Colors.white,
                              ),
                            ),
                            child: WorkoutSetTile(
                              workoutSet: workoutSet,
                              workoutId: workout.id,
                            ),
                          ),
                        )
                        .toList(),
                  )
                : const Text(
                    "No Sets for this Workout Yet",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
