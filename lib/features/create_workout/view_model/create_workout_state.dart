import 'package:equatable/equatable.dart';

class CreateWorkoutState extends Equatable {
  final String? name;

  const CreateWorkoutState({
    this.name,
  });

  /// Validation used here for when the user submits the Workout. 
  /// This is between 3 and 20 characters, but that can be changes based on product decision
  bool get isValidName => name != null && name!.length >= 3;

  @override
  List<Object?> get props => [name];
}
