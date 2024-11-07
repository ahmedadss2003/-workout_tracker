import 'package:flutter/material.dart';
import 'package:tracker_app/features/add_sets_view/data/models/exercise_model.dart';
import 'package:tracker_app/features/add_sets_view/presentation/view/widget/custom_row_container.dart';

class CustomCardRow extends StatelessWidget {
  const CustomCardRow({super.key, required this.exercise});
  final ExerciseModel exercise  ;
  @override
  Widget build(BuildContext context) {
    return  Row(
              children: [
              CustomRowContainer(
                txt: '${exercise.weight} kg"',
               ) ,
               const SizedBox(width: 10,),
              CustomRowContainer(
                txt: '${exercise.reps} reps',
               ) ,
               const SizedBox(width: 10,),
               
              CustomRowContainer(
                txt: '${exercise.sets} sets',
               ) ,
               const Spacer(),
               
              ],
            );
  }
}