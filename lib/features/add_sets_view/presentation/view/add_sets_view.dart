import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker_app/features/add_sets_view/data/models/exercise_model.dart';
import 'package:tracker_app/features/add_sets_view/presentation/manager/exercise_cubit/exercise_cubit.dart';
import 'package:tracker_app/features/add_sets_view/presentation/view/widget/add_excercise_name_dialog.dart';
import 'package:tracker_app/features/add_sets_view/presentation/view/widget/custom_card.dart';

class AddSetsView extends StatelessWidget {
  const AddSetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseCubit()..loadExercises(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 163, 151, 159),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Expanded(
            child: BlocBuilder<ExerciseCubit, ExerciseState>(
              builder: (context, state) {
                if (state is ExerciseLoading){
                  return const Center(child: CircularProgressIndicator(),);
                }
                else if (state is ExerciseLoaded){
                  return Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ListView.builder(
                      itemCount: state.exercises.length,
                      itemBuilder: (context,index){
                        return CustomCard(
                          exercise: state.exercises[index],
                          onDismissed: () {
                            context.read<ExerciseCubit>().deleteExercise(index);
                          },
                          );
                      }
                      
                    ),
                  ); 
                }
                else{
                  return const Center(child: Text("No exercises found"));
                }
              },
            ),
          ),
        ),
        floatingActionButton: Builder(
          builder: (buttonContext)=> SizedBox(
          width: 75,
          height: 75,
          child: FloatingActionButton(
            
            shape: const CircleBorder(),
            backgroundColor: Colors.white,
            onPressed: () {
              showDialog(
                  context: buttonContext,
                  builder: (dialogcontext) {
                    return AddExcerciseNameDialog(
                        onAddWorkout: (name, weight, reps, sets) {
                      final exercise = ExerciseModel(
                        name: name,
                        weight: weight,
                        reps: reps,
                        sets: sets,
                      );
                      buttonContext.read<ExerciseCubit>().addExercise(exercise);
                    }
                    );
                  });
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 35,
            ),
          ),
        ),
        )
      ),
    );
  }
}
