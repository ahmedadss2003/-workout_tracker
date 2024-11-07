import 'package:flutter/material.dart';
import 'package:tracker_app/app_styles.dart';
import 'package:tracker_app/features/add_exercise_name/persentation/views/widget/custom_button.dart';

class AddExcerciseNameDialog  extends StatefulWidget {
  const AddExcerciseNameDialog ({super.key, required this.onAddWorkout});
  final Function(String name , String weight , String reps , String sets ) onAddWorkout;
  @override
  State<AddExcerciseNameDialog> createState() => _AddExcerciseNameDialogState();
}

class _AddExcerciseNameDialogState extends State<AddExcerciseNameDialog> {
  final TextEditingController nameExerciseController = TextEditingController() ;
  final TextEditingController weightController = TextEditingController() ;
  final TextEditingController repsController = TextEditingController() ;
  final TextEditingController setsController = TextEditingController() ;
  @override

  Widget build(BuildContext context) {
    return  AlertDialog(
      
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      ),
      backgroundColor: const Color.fromARGB(255, 22, 21, 21),
      content: SizedBox(
        height: 280,
        child: Column(
          children: [
          CustomTextField(controller: nameExerciseController,txt: "Enter Exercise Name"),
          const SizedBox(height: 10,),
          CustomTextField(controller: weightController , txt: "Enter Weight (Kg)"),
          const SizedBox(height: 10,),
          CustomTextField(controller: repsController, txt: "Enter Reps"),
          const SizedBox(height: 10,),
          CustomTextField(controller: setsController, txt: "Enter Sets"),
          ],
        ),
      ),
      actions: [
        CustomButtonFroDialog(txt: "Save",
        onPressed: (){
          widget.onAddWorkout(nameExerciseController.text,weightController.text,repsController.text,setsController.text);
          Navigator.of(context).pop();
        }
        ),
        CustomButtonFroDialog(txt: "Cancel",
        onPressed: (){
          
          Navigator.of(context).pop();
        },
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key ,required  this.controller, required this.txt});
  final TextEditingController controller ;
  final String txt ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(      
        validator: (value) => value!.isEmpty ? "Enter $txt" : null,
        controller: controller,  
        decoration:  InputDecoration(
          border:   const OutlineInputBorder(),
          labelText: txt,
          
          labelStyle: AppStyles.textStyle14.copyWith(color: const Color.fromARGB(107, 255, 255, 255)),
        ),
      
      );
  }
}