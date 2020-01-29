

import 'package:foodie/revamp/model/food_category.dart';

// class Resturant {

//   Resturant({this.name,this.details,this.logoPath,this.foodCategories,this.acct,this.state});

//   String name;
//   String details;
//   String logoPath;
//   List<FoodCategory> foodCategories;
//   String acct;
// //  List<Delivery> deliveryPrice;
//   String city;
//   String state;
// //  String orders;

// }



import 'package:foodie/revamp/model/menu_category.dart';


class Restaurant{


  String _name;
  String _address;
  List _products;
  List _menu_categories;
  

  Restaurant(this._name,this._address,this._products,this._menu_categories);

  String get name => this._name;
  String get address => this._address;
  List get products => this._products;
  List get menu_categories => this._menu_categories;



  Map<String,dynamic> tomap(){

    Map<String,dynamic> map = new Map<String,dynamic>();

    map['name'] = this._name;
    map['address'] = this._address;
    map['products'] = this.products;
    map['menu_categories'] = this._menu_categories;


    return map;

  }


  Restaurant.fromMap(Map<String,dynamic> map){

    this._name = map['name'];
    this._address =map['address'];
    this._products = map['products'];
    this._menu_categories = map['menu_categories'];
     
  }


}