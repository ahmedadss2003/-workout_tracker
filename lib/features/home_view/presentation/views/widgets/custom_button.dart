
import 'package:flutter/material.dart';
import 'package:tracker_app/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap});
  final void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        decoration:  const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 8),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Get Start",style: AppStyles.textStyle30,),
              SizedBox(width: 20,),
              Icon(Icons.trending_flat,size: 50,color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}