part of 'exercise_cubit.dart';

@immutable
sealed class ExerciseState {}

final class ExerciseInitial extends ExerciseState {}
final class ExerciseLoading extends ExerciseState {}
final class ExerciseLoaded extends ExerciseState {
  final List<ExerciseModel> exercises;

  ExerciseLoaded({required this.exercises});
}
