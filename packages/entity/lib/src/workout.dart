import 'package:entity/src/workout_set.dart';
import 'package:equatable/equatable.dart';

/// Entity representing a Workout for the user
class Workout extends Equatable {
  // Mapped variables from the database layer
  final String title;
  final int id;
  // Containing multiple sets
  final List<WorkoutSet> sets;

  const Workout({
    required this.title,
    required this.id,
    this.sets = const [],
  });

  // Used a copy with method to allow updating the entity in the presentaiton
  // layer without having to make more calls onto the database
  Workout copyWith({
    String? title,
    int? id,
    List<WorkoutSet>? sets,
  }) =>
      Workout(
        title: title ?? this.title,
        id: id ?? this.id,
        sets: sets ?? this.sets,
      );

  @override
  List<Object?> get props => [id, title, sets];
}
