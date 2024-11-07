import 'package:flutter/material.dart';
import 'package:tracker_app/app_styles.dart';

class CustomRowContainer extends StatelessWidget {
  const CustomRowContainer({super.key, required this.txt});
  final String txt ;
  @override
  Widget build(BuildContext context) {
    return  Container(
  padding: const EdgeInsets.all(10.0),
  decoration: const BoxDecoration(
  color: Color.fromARGB(255, 69, 198, 4),
  borderRadius: BorderRadius.all(Radius.circular(10))  
  ),
  child:  Text(txt,style: AppStyles.textStyle20,)
  );
  }
}