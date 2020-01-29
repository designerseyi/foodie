
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:foodie/revamp/bloc/food_extraList_wrapper_provider.dart';
import 'package:foodie/revamp/helperclass/food_extra_wrapper.dart';

import 'package:rxdart/rxdart.dart';


class FoodItemExtraListBloc extends BlocBase{

 var FoodExtralistController = BehaviorSubject<List<FoodExtraWrapper>>.seeded([]);

  Stream<List<FoodExtraWrapper>> get getFoodExtraList => FoodExtralistController.stream;

  Sink<List<FoodExtraWrapper>> get foodExtraSink => FoodExtralistController.sink;

  FoodExtraListProvider foodExtraListProvider = new FoodExtraListProvider();

// food extralink
  void addToFoodExtraList(FoodExtraWrapper foodExtraWrapper){

    foodExtraSink.add(foodExtraListProvider.addToList(foodExtraWrapper));
  }

  void removeFromFoodExtraList(FoodExtraWrapper foodExtraWrapper){

    foodExtraSink.add(foodExtraListProvider.removeFromList(foodExtraWrapper));
  }





}