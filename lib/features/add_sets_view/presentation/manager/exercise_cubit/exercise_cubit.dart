import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:tracker_app/constant.dart';
import 'package:tracker_app/features/add_sets_view/data/models/exercise_model.dart';

part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit() : super(ExerciseInitial());
  
  void addExercise(ExerciseModel exercise) {
    emit(ExerciseLoading());
    final box = Hive.box<ExerciseModel>(AppConstant.kexercise);
    box.add(exercise);
    emit(ExerciseLoaded(exercises: box.values.toList()));
  }

  void loadExercises() {
    emit(ExerciseLoading());
    final box = Hive.box<ExerciseModel>(AppConstant.kexercise);

    emit(ExerciseLoaded(exercises: box.values.toList()));
  }
  void deleteExercise(int index) {
    final box = Hive.box<ExerciseModel>(AppConstant.kexercise);
    box.deleteAt(index);
    emit(ExerciseLoaded(exercises: box.values.toList()));
  }
}
