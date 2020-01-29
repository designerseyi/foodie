


import 'package:foodie/revamp/helperclass/food_extra_wrapper.dart';

class FoodExtraListProvider{

   List<FoodExtraWrapper> foodextrawrapper = [];




  List<FoodExtraWrapper> addToList (FoodExtraWrapper foodExtraWrapper){
    bool isPresent = false;

    if(foodextrawrapper.length > 0 ){

      for(int i =0 ; i < foodextrawrapper.length; i++){

        if(foodextrawrapper[i].name == foodExtraWrapper.name){

          isPresent =true;

          break;
        }
        else{
          isPresent =false;

        }
      }

      if(!isPresent){
        foodextrawrapper.add(foodExtraWrapper);
      }
    }
    else{
      foodextrawrapper.add(foodExtraWrapper);
    }


    return foodextrawrapper;
  }



  List<FoodExtraWrapper> removeFromList (FoodExtraWrapper foodExtraWrapper){


    for(int i =0 ; i < foodextrawrapper.length; i++){

      if(foodextrawrapper[i].name == foodExtraWrapper.name){

        foodextrawrapper.removeAt(i);

        break;
      }

    }


    return foodextrawrapper;
  }










}





