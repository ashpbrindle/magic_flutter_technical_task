/// Enum for the Type of Exercise used in a WorkoutSet
enum Exercise {
  barbellRow,
  benchPress,
  shoulderPress,
  deadlift,
  squat;

  // Getter for the String to be used for the Exercise when displayed to the user
  String get title => switch (this) {
        Exercise.barbellRow => "Barbell Row",
        Exercise.benchPress => "Bench Press",
        Exercise.shoulderPress => "Shoulder Press",
        Exercise.deadlift => "Deadlift",
        Exercise.squat => "Squat",
      };
}
