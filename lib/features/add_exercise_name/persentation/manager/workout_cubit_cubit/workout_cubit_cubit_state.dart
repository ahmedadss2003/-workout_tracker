part of 'workout_cubit_cubit_cubit.dart';

@immutable
sealed class WorkoutCubitState {}

final class WorkoutCubitInitial extends WorkoutCubitState {}
final class WorkoutCubitLoading extends WorkoutCubitState {}
final class WorkoutCubitLoaded extends WorkoutCubitState {
  final List<String> workouts;

  WorkoutCubitLoaded(this.workouts);
}
