
import 'package:foodie/revamp/model/FooditemAbstract.dart';


class FoodCategory{

  // cannot have food item and food combo together
  // because food item and food combo extend from the same classs
  // either of them can be put in the field

  String name;
  List<FoodItemAbstract> generalfoodItem;
  FoodCategory({this.name,this.generalfoodItem});
}