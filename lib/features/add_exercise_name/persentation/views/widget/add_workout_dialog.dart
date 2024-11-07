import 'package:flutter/material.dart';
import 'package:tracker_app/app_styles.dart';
import 'package:tracker_app/features/add_exercise_name/persentation/views/widget/custom_button.dart';

class AddWorkoutDialog  extends StatefulWidget {
  const AddWorkoutDialog ({super.key, required this.onAddWorkout});
  final Function(String) onAddWorkout;
  @override
  State<AddWorkoutDialog> createState() => _AddWorkoutDialogState();
}

class _AddWorkoutDialogState extends State<AddWorkoutDialog> {
  final TextEditingController controller = TextEditingController() ;
  
  @override

  Widget build(BuildContext context) {
    return  Form(

      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
        ),
        backgroundColor: const Color.fromARGB(255, 22, 21, 21),
        content:  TextField(      
          controller: controller,  
          decoration:  InputDecoration(
            border:  const OutlineInputBorder(),
            labelText: 'Enter Workout Name',
            
            labelStyle: AppStyles.textStyle14.copyWith(color: const Color.fromARGB(107, 255, 255, 255)),
          ),
        
        ),
        actions: [
          CustomButtonFroDialog(txt: "Save",
          onPressed: (){
            widget.onAddWorkout(controller.text);
            Navigator.of(context).pop();
          }
          ),
          CustomButtonFroDialog(txt: "Cancel",
          onPressed: (){
            
            Navigator.of(context).pop();
          },
          ),
        ],
      ),
    );
  }
}