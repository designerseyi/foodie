

import 'package:foodie/revamp/model/FooditemAbstract.dart';

import 'food_extra_wrapper.dart';

class FoodItemWrapper {

  int temp_totalPrice;
  FoodItemAbstract foodItem;
  List<FoodExtraWrapper>foodExtras;
  int cartItemPrice = 0;

  FoodItemWrapper(this.foodItem,this.temp_totalPrice,{this.foodExtras});

  void setCartItemPrice(int itemprice){

    cartItemPrice = itemprice;
  }




}