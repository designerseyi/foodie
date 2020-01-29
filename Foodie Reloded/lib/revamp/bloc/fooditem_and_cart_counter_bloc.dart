
import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:foodie/revamp/helperclass/food_item_wrapper.dart';
import 'package:foodie/revamp/model/FooditemAbstract.dart';


import 'package:rxdart/rxdart.dart';

import 'cartListProvider.dart';

class FoodItemAndCartCounterBloc extends BlocBase{


  //create a stream controller
  //food item controller for fooditemQuantity;
  var fooditemController = BehaviorSubject<int>();

 //create a stram or a box where u can add data to and pass it to the maistram
  Stream<int>  get  getCount => fooditemController.stream;


// listCOntroller for  cartList
//  var listController = BehaviorSubject<List<FoodItem>>.seeded([]);
  var listController = BehaviorSubject<List<FoodItemWrapper>>.seeded([]);

//  Stream<List<FoodItem>> get getcartList => listController.stream;
  Stream<List<FoodItemWrapper>> get getcartList => listController.stream;

  //list Provider is an object that helps the stream
  // perform  some operation before passing data to the sink
  CartListProvider listProvider = CartListProvider();

//  Sink<List<FoodItem>> get listSink => listController.sink;
  Sink<List<FoodItemWrapper>> get listSink => listController.sink;

  Sink<int> get foodControllerSink => fooditemController.sink;


 StreamController<List<FoodItemWrapper>> subtotalController = StreamController.broadcast();

  Stream<List<FoodItemWrapper>> get SubTotal => subtotalController.stream;

  Sink<List<FoodItemWrapper> > get subtotalSink => subtotalController.sink;


  // foodextra list streams and controller




  void addSubTotal(FoodItemWrapper fooditemwrapper){

    subtotalSink.add( listProvider.subtotalList(fooditemwrapper));

  }

  void removeSubTotal(FoodItemWrapper fooditemwrapper){

    subtotalSink.add( listProvider.removesubtotalList(fooditemwrapper));

  }


  void addToList(FoodItemWrapper foodItemWrapper){

    listSink.add(listProvider.addToList(foodItemWrapper));
  }

  void removeFromList(FoodItemWrapper foodItemWrapper){

    listSink.add(listProvider.removeFromList(foodItemWrapper));
  }




  void updateCount(FoodItemAbstract provider){

   provider.increaseQuantity();

//   add the update data to the stream

  foodControllerSink.add(provider.quantity);

  }

  void resetCount(FoodItemAbstract provider){

    provider.resetQuantity();

//   add the update data to the stream

    foodControllerSink.add(provider.quantity);

  }



  void decreaseCount(FoodItemAbstract provider){

    provider.decreaseQuantity();

//   add the update data to the stream

    fooditemController.sink.add(provider.quantity);

  }


    var foodComboCountConroller = BehaviorSubject<int>();
    Stream<int>  get  getFoodComboCount => foodComboCountConroller.stream;
     Sink<int> get foodComboControllerSink => foodComboCountConroller .sink;


  void updateFoodComboCount(FoodItemAbstract provider){

    
    provider.increaseItemsInCart();

//   add the update data to the stream

    foodComboControllerSink.add(provider.numberOfItemsInCart);

  }

  void resetFoodComboCount(FoodItemAbstract provider){

    provider.resetItemsInCart();

//   add the update data to the stream

    foodComboControllerSink.add(provider.numberOfItemsInCart);

  }



  void decreaseFoodComboCount(FoodItemAbstract provider){

    provider.decreaseItemsInCart();

//   add the update data to the stream

    foodComboControllerSink.add(provider.numberOfItemsInCart);

  }












  var checkstateController = BehaviorSubject<bool>();
  Stream get getcheckState => checkstateController.stream;

  void changeState(FoodItemAbstract provider,bool select){
    provider.setOnSelect(select);
    checkstateController.sink.add(provider.onSelect);
  }



  //for radio button state

  var RadioStateController = BehaviorSubject<int>();

  Stream<int> get getRadioState => RadioStateController.stream;

  Sink<int> get addRadioStateSink => RadioStateController.sink;

  int radioState;

// food extralink
  void addRadioState(int mRadio){

    radioState = mRadio;
    addRadioStateSink.add(radioState);
  }



  //for radio button state

  var tempCounterController = BehaviorSubject<int>.seeded(1);


  Stream<int> get  getTempCounterState => tempCounterController.stream;

  Sink<int> get addTempCounterSink => tempCounterController.sink;

  int tempCounterState;

// food extralink
  void addTempCounter(int mtempCounterState){

    tempCounterState = mtempCounterState;
    addTempCounterSink.add(tempCounterState);
  }

  void resetTempCounter(){
    addTempCounterSink.add(1);
  }










  void dispose(){

    fooditemController.close();
    listController.close();
    checkstateController.close();
    RadioStateController.close();
  }




}

