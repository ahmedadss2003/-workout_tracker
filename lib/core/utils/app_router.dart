import 'package:go_router/go_router.dart';
import 'package:tracker_app/features/add_exercise_name/persentation/views/add_exercise_view.dart';
import 'package:tracker_app/features/add_sets_view/presentation/view/add_sets_view.dart';
import 'package:tracker_app/features/home_view/presentation/views/home_view.dart';

class AppRouter {
  static const kAddEscercise = "/addexercicenameview" ;
  static const kSetsView = "/setsview" ;
 static final router = GoRouter(
  
  routes: [
    GoRoute(
      path: '/', //Tell The App This is the starting Point Of App
      builder: (context, state) =>const HomeView(),
    ),
     GoRoute(
      path: kAddEscercise,
      builder:(context, state) =>const AddExerciseNameView(),
    ),
    GoRoute(
      path: kSetsView,
      builder:(context, state) =>const AddSetsView(),
    ),
  ],
);
}