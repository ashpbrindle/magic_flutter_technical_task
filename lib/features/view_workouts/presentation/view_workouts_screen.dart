import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_flutter_technical_task/features/create_workout/presentation/create_workout_bottomsheet.dart';
import 'package:magic_flutter_technical_task/features/view_workouts/presentation/widgets/workout_tile.dart';
import 'package:magic_flutter_technical_task/features/view_workouts/view_model/view_workouts_cubit.dart';
import 'package:magic_flutter_technical_task/features/view_workouts/view_model/view_workouts_state.dart';

class ViewWorkoutsScreen extends StatelessWidget {
  const ViewWorkoutsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: const Text(
          "My Workouts",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey.shade700,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => const CreateWorkoutBottomsheet(),
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: BlocBuilder<ViewWorkoutsCubit, ViewWorkoutsState>(
          builder: (context, state) {
        if (state is ViewWorkoutsLoaded) {
          return state.workouts.isEmpty
              ? const Center(
                  child: Text(
                    "No Workouts, Please Press the Add Button to Add a Workout",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              : ListView(
                  children: state.workouts
                      .map(
                        (workout) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Dismissible(
                            direction: DismissDirection.startToEnd,
                            resizeDuration: Duration(milliseconds: 200),
                            key: ObjectKey(workout),
                            onDismissed: (direction) {
                              context
                                  .read<ViewWorkoutsCubit>()
                                  .deleteWorkout(workout);
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
                            child: WorkoutTile(
                              workout: workout,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
        } else if (state is ViewWorkoutsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
