
import 'package:foodie/revamp/model/FooditemAbstract.dart';

class FoodItem extends FoodItemAbstract{

  FoodItem({this.name,this.imgPath,this.des,this.price,this.quantity=0});
  String name;
  String imgPath;
  String des;
  int price;
  int quantity = 0;





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
//  quantity--;
//    }
//
//    return quantity;
//  }


}