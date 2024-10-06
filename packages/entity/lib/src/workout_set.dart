import 'package:entity/src/exercise.dart';
import 'package:equatable/equatable.dart';

/// Entity representing a Workout Set for the user
class WorkoutSet extends Equatable {
  // Mapped variables from the database layer
  final int id;
  final Exercise exercise;
  final int weightKg;
  final int repetitions;

  const WorkoutSet({
    required this.id,
    required this.exercise,
    required this.weightKg,
    required this.repetitions,
  });

  // Used a copy with method to allow updating the entity in the presentaiton 
  // layer without having to make more calls onto the database
  WorkoutSet copyWith({
    Exercise? exercise,
    int? weightKg,
    int? repetitions,
  }) =>
      WorkoutSet(
        id: id,
        exercise: exercise ?? this.exercise,
        weightKg: weightKg ?? this.weightKg,
        repetitions: repetitions ?? this.repetitions,
      );

  @override
  List<Object?> get props => [
        id,
        exercise,
        weightKg,
        repetitions,
      ];
}
