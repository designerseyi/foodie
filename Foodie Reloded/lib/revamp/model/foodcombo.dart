

import 'package:foodie/revamp/model/FooditemAbstract.dart';
import 'package:foodie/revamp/model/food_type.dart';
import 'package:foodie/revamp/model/food_item.dart';

class FoodCombo extends FoodItemAbstract {

  String name;
  String imgPath;
  String des;
  int price;
  //FoodType Objects are of two types one with and without price
  bool hasType;
  bool hasChoice;
  bool hasToppings;
  int quantity;
  bool onSelect;

  //FoodCombo is a combination of different food items,

  //List of food items for toppings
  List<FoodItem> list_of_foodToppings;
  //List of FoodType/FoodChioce either of the two cos they are of the same type
  List<FoodType> list_of_foodType;



  //Constructor
  // no price cos price will set to the price of the first type
  FoodCombo(this.name,this.imgPath,this.des,{this.quantity=0 ,this.hasType = false,this.hasChoice = false,this.hasToppings= false,this.list_of_foodToppings,this.list_of_foodType,this.onSelect=false});

  //adds food item to list
  void addFoodItem(FoodItem  mfooditem){

    this.list_of_foodToppings.add(mfooditem);

  }

  //adds food type  to list
  void addFoodType(FoodType mfoodtype){

    this.list_of_foodType.add(mfoodtype);

  }



//  int increaseQuantity(){
//
//    quantity++;
//    return quantity;
//  }
//
//  int resetQuantity(){
//
//    quantity = 0;
//    return quantity;
//  }
//
//  int decreaseQuantity(){
//
//    if(quantity > 1){
//      quantity--;
//    }
//
//    return quantity;
//  }


}