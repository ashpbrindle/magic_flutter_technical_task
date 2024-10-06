import 'package:entity/entity.dart';
import 'package:equatable/equatable.dart';

abstract class ViewWorkoutsState {}

class ViewWorkoutsLoaded extends Equatable implements ViewWorkoutsState {
  final List<Workout> workouts;

  const ViewWorkoutsLoaded({
    this.workouts = const [],
  });

  @override
  List<Object?> get props => [workouts];
}

class ViewWorkoutsLoading implements ViewWorkoutsState {
  const ViewWorkoutsLoading();
}
