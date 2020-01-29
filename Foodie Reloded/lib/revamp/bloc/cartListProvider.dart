


import 'package:foodie/revamp/helperclass/food_item_wrapper.dart';

class CartListProvider{

//  List<FoodItem> foodItems = [];
  List<FoodItemWrapper> fooditemwrapper = [];

  List<FoodItemWrapper> list_of_fooditemwrapper = [];


  List<FoodItemWrapper> addToList (FoodItemWrapper foodItemWrapper){
  bool isPresent = false;


//  if(foodItemWrapper.foodExtras.length > 0){
//    fooditemwrapper.add(foodItemWrapper);
//  }
    if(foodItemWrapper.foodExtras !=null){
      fooditemwrapper.add(foodItemWrapper);
    }

    if(fooditemwrapper.length > 0 ){

        for(int i =0 ; i < fooditemwrapper.length; i++){

          if(fooditemwrapper[i].foodItem.name == foodItemWrapper.foodItem.name){



            isPresent =true;

            break;



          }
          else{
            isPresent =false;
          }
        }

        if(!isPresent){


          fooditemwrapper.add(foodItemWrapper);
        }








    }
    //when there is nothing in the cart...
    else{
      fooditemwrapper.add(foodItemWrapper);
    }



  return fooditemwrapper;
  }



  List<FoodItemWrapper> removeFromList (FoodItemWrapper foodItemWrapper){




      for(int i =0 ; i < fooditemwrapper.length; i++){



        if(fooditemwrapper[i].foodItem.name == foodItemWrapper.foodItem.name){

          fooditemwrapper.removeAt(i);

          break;
        }

      }


    return fooditemwrapper;
  }


  List<FoodItemWrapper> subtotalList(FoodItemWrapper foodItemWrapper){

    bool isPresent = false;

    if(foodItemWrapper.foodExtras !=null){
      list_of_fooditemwrapper.add(foodItemWrapper);

    }

    if(list_of_fooditemwrapper.length > 0 ){

      for(int i =0 ; i < list_of_fooditemwrapper.length; i++){




        if(list_of_fooditemwrapper[i].foodItem.name == foodItemWrapper.foodItem.name){

          isPresent =true;

          list_of_fooditemwrapper[i].cartItemPrice = foodItemWrapper.cartItemPrice;
//          list_of_fooditemwrapper.removeAt(i);
//          list_of_fooditemwrapper.add(foodItemWrapper);
          break;
        }
        else{
          isPresent =false;
        }
      }

      if(!isPresent){
        list_of_fooditemwrapper.add(foodItemWrapper);
      }
    }

    //not ther at all
    else{
      list_of_fooditemwrapper.add(foodItemWrapper);
    }


    return list_of_fooditemwrapper;

  }



  List<FoodItemWrapper> removesubtotalList(FoodItemWrapper foodItemWrapper){



    if(list_of_fooditemwrapper.length > 0 ) {
      for (int i = 0; i < list_of_fooditemwrapper.length; i++) {


        if (list_of_fooditemwrapper[i].foodItem.name ==
            foodItemWrapper.foodItem.name) {
          list_of_fooditemwrapper.removeAt(i);
//          list_of_fooditemwrapper.add(foodItemWrapper);
          break;
        }
      }
    }



    return list_of_fooditemwrapper;

  }



}





