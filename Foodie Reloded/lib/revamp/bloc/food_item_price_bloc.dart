

import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';


class FoodItemPriceBloc extends BlocBase{





  //create a stream controller
//  var streamController =  BehaviorSubject<int>();
  StreamController<int> streamController= StreamController.broadcast();

//  var unitpriceController =  BehaviorSubject<int>();

  StreamController<int> unitpriceController = StreamController.broadcast();


  int unitp;


  Stream get  getPrice => streamController.stream;
  Stream get getUnitPrice => unitpriceController.stream;

  Sink<int> get unitSink => unitpriceController.sink;
  Sink<int> get priceSink => streamController.sink;

  void getTotalPrice(int totalprice){

    priceSink.add(totalprice);

  }


  void getUnit(int totalprice , int quantity){

    unitp = (totalprice/ quantity).floor();
    unitSink.add(unitp);

  }


  void dispose(){

    streamController.close();
    unitpriceController.close();
  }




}

