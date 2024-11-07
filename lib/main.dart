import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tracker_app/constant.dart';
import 'package:tracker_app/core/utils/app_router.dart';
import 'package:tracker_app/features/add_sets_view/data/models/exercise_model.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox<String>(AppConstant.kHiveNmae);
  Hive.registerAdapter(ExerciseModelAdapter());
  await Hive.openBox<ExerciseModel>(AppConstant.kexercise);
  runApp(const TrackerApp());
}

class TrackerApp extends StatelessWidget {
  const TrackerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      
    );
  }
}
