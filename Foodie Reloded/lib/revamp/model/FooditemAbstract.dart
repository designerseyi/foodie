
 import 'package:foodie/revamp/model/food_item.dart';
import 'package:foodie/revamp/model/food_type.dart';

abstract class FoodItemAbstract{
    int id;
    String name;
    int price;
    String des;
    bool hasType = false;
    bool hasChoice =false;
    bool hasToppings =false;
    int quantity;
    bool onSelect= false ;
    int numberOfItemsInCart = 0;

    //FoodCombo is a combination of different food items,
    List<FoodItem> list_of_foodToppings;
    List<FoodType> list_of_foodType;

    int increaseQuantity(){

        quantity++;
        return quantity;
    }

    int resetQuantity(){

        quantity = 0;
        return quantity;
    }

    int decreaseQuantity(){

        if(quantity > 1){
            quantity--;
        }

        return quantity;
    }



    int increaseItemsInCart(){

        numberOfItemsInCart++;
        return numberOfItemsInCart;
    }

    int resetItemsInCart(){

        numberOfItemsInCart = 0;
        return numberOfItemsInCart;
    }

    int decreaseItemsInCart(){

        if(numberOfItemsInCart > 1){
            numberOfItemsInCart--;
        }

        return numberOfItemsInCart;
    }

    void setOnSelect(bool select){
        onSelect = select;
    }

 }