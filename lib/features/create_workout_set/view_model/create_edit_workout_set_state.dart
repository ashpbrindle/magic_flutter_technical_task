import 'package:entity/entity.dart';
import 'package:equatable/equatable.dart';

class CreateEditWorkoutSetState extends Equatable {
  final WorkoutSet? workoutSet;
  final int workoutId;

  const CreateEditWorkoutSetState({
    required this.workoutSet,
    required this.workoutId,
  });

  @override
  List<Object?> get props => [workoutSet, workoutId];
}
