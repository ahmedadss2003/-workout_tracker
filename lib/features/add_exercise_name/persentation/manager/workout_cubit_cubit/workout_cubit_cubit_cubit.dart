import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:tracker_app/constant.dart';

part 'workout_cubit_cubit_state.dart';

class WorkoutCubitCubit extends Cubit<WorkoutCubitState> {
  WorkoutCubitCubit() : super(WorkoutCubitInitial());
  void loadWorkouts(){
    emit(WorkoutCubitLoading());
    final box = Hive.box<String>(AppConstant.kHiveNmae);
    final workouts = box.values.toList();
    emit(WorkoutCubitLoaded(workouts));
  }
  void addWorkout(String workoutName){
        final box = Hive.box<String>(AppConstant.kHiveNmae);
        box.add(workoutName);
        emit(WorkoutCubitLoaded(box.values.toList()));

  }

  void deleteWorkout(int index){
    final box = Hive.box<String>(AppConstant.kHiveNmae);
    box.deleteAt(index);
    emit(WorkoutCubitLoaded(box.values.toList()));
  }
}
