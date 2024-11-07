import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tracker_app/app_styles.dart';
import 'package:tracker_app/core/utils/app_router.dart';
import 'package:tracker_app/features/home_view/presentation/views/widgets/custom_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Colors.red , Colors.blue];
    return Scaffold(
      body: Container(
        
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
            )
        ),
        child: Column(
          
          children: [
            const SizedBox(height: 180,),
            Center(child: Image.asset("assets/images/logo.png",width: 300,)),
            const SizedBox(height: 20,),
             const Text("Tracker Fitness",style: AppStyles.textStyle36),
             const Text("Track Your Daily Workouts & Watch Your Progress ",style: AppStyles.textStyle20 ,textAlign: TextAlign.center,),
             const SizedBox(height: 50,),
            CustomButton(
               onTap: (){
                GoRouter.of(context).push(AppRouter.kAddEscercise);
               },
             ),
          ],
        ),
      ),
    );
  }
}
