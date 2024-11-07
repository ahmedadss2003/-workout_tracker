import 'package:hive/hive.dart';
//second steps for create hive object

part 'exercise_model.g.dart';
@HiveType(typeId: 0)// this is unique id for this class in database

//extends-> this is first steps for create hive object
class ExerciseModel extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  String weight;
  @HiveField(2)
  String reps;
  @HiveField(3)
  String sets; 
  ExerciseModel({required this.name,required this.weight,required this.reps,required this.sets});
}

// steps for create hive object
/*
1- make the class extends HiveObject
2- add the @HiveType(typeId: 0) annotation for the class
3- add the @HiveField() annotation for the fields
*/