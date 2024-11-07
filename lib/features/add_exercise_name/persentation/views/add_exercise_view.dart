import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tracker_app/core/utils/app_router.dart';
import 'package:tracker_app/features/add_exercise_name/persentation/manager/workout_cubit_cubit/workout_cubit_cubit_cubit.dart';
import 'package:tracker_app/features/add_exercise_name/persentation/views/widget/add_workout_dialog.dart';
import 'package:tracker_app/features/add_exercise_name/persentation/views/widget/custom_listtile.dart';

class AddExerciseNameView extends StatelessWidget {
  const AddExerciseNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutCubitCubit()..loadWorkouts(),
      child: Builder(
        builder: (BuildContext newContext) => Scaffold(
          backgroundColor: const Color.fromARGB(255, 163, 151, 159),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Center(
                    child: Image.asset(
                      "assets/images/img2.png",
                      width: 250,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: BlocBuilder<WorkoutCubitCubit, WorkoutCubitState>(
                      builder: (context, state) {
                        if (state is WorkoutCubitLoaded) {
                          return ListView.builder(
                            itemCount: state.workouts.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: CustomListTile(
                                  onTap: (){
                                    GoRouter.of(context).push(AppRouter.kSetsView);
                                  },
                                  txt: state.workouts[index],
                                  onDismissed: (){
                                    context.read<WorkoutCubitCubit>().deleteWorkout(index);
                                  },
                                  ),
                              );
                            },
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: newContext, // Use the parent context here
                  builder: (context) {
                    return AddWorkoutDialog(
                      onAddWorkout: (workoutName) {
                        newContext.read<WorkoutCubitCubit>().addWorkout(workoutName);
                      },
                    );
                  },
                );
              },
              shape: const CircleBorder(),
              backgroundColor: Colors.purple,
              child: const Icon(
                Icons.add,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
