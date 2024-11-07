
import 'package:flutter/material.dart';
import 'package:tracker_app/app_styles.dart';
import 'package:tracker_app/features/add_sets_view/data/models/exercise_model.dart';
import 'package:tracker_app/features/add_sets_view/presentation/view/widget/custom_card_row.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.exercise, required this.onDismissed});
  final ExerciseModel exercise ;
  final VoidCallback onDismissed;
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isChecked = false;
  Color cardColor = const Color.fromARGB(255, 218, 214, 214);
  Color txtColor = Colors.black;
  
  @override
  Widget build(BuildContext context) {
    return  Dismissible(
      key: Key(widget.exercise.name),
      onDismissed: (_){
        widget.onDismissed();
      },
      background: Container(color: Colors.red),
      child: GestureDetector(
        onTap: (){
          setState(() {
            isChecked = !isChecked;
            if(isChecked){
            cardColor = const Color.fromARGB(255, 11, 157, 14);
            txtColor = Colors.white;
            }
            else{
            cardColor = const Color.fromARGB(255, 218, 214, 214); // Default color
            txtColor = Colors.black; // Default text color
            }
          });
        },
        child: Card(
        color: cardColor ,
        child:  Padding(
          padding:  const EdgeInsets.all(30.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.exercise.name,style: AppStyles.textStyle30.copyWith(color: txtColor),),
              
              Align(
                  alignment: Alignment.centerRight,
                  child:  Checkbox(
                    value: isChecked, 
                    onChanged: (value){},
                    
                    ),
                 ),
              CustomCardRow(exercise: widget.exercise,),
              
            ],
          ),
        ),
            ),
      ),
    );
  }
}