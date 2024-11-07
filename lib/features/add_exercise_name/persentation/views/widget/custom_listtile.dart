import 'package:flutter/material.dart';
import 'package:tracker_app/app_styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.txt,required this.onDismissed, this.onTap,} );
  final String txt ;
  final VoidCallback onDismissed ;
  final void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return  Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onDismissed() ;
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: InkWell(
        onTap:onTap ,
        child: Container(
        decoration: const BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: ListTile(
            contentPadding: const EdgeInsets.all(15.0),
            trailing: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
            leading: Image.asset("assets/images/img2.png",width: 50,),
            title: Text(txt,style: AppStyles.textStyle25,
          )),
                  
                ),
      ),
    );
  }
}