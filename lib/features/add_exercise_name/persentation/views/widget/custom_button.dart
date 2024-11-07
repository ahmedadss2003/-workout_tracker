import 'package:flutter/material.dart';
import 'package:tracker_app/app_styles.dart';

class CustomButtonFroDialog extends StatelessWidget {
  const CustomButtonFroDialog({super.key, this.onPressed, required this.txt});
  final void Function()? onPressed ;
  final String txt ;
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 75,
          color: const Color.fromARGB(255, 32, 26, 33),         
          child: TextButton(onPressed: onPressed, child:Text(txt , style: AppStyles.textStyle14,),
          ),
          );
  }
}