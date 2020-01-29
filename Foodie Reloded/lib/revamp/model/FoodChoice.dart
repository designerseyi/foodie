
import 'package:foodie/revamp/model/food_type.dart';

class FoodChoice extends FoodType{
  // choose between two options of the same price;
  // you cannot have choice and food type together;
  // this is more or less like a food type but without price;
  int id;
  String name;

  FoodChoice({this.id,this.name});

}