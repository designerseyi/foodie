
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie/revamp/model/product_variation.dart';

class Product{


  String _description;
  String _img_path;
  String _menu_category;
  String _name;
  String _price;
  Map<dynamic,dynamic> _product_variation;
 
 

  Product(this._name,this._menu_category,this._description,this._img_path,this_product_variation,this._price);

  String get name => this._name;
  String get img_path => this._img_path;
  String get menu_category => this._menu_category;
  String get description => this._description;
   String get price => this._price;
  Map<dynamic,dynamic> get product_variation => this._product_variation;
 


  Map<String,dynamic> tomap(){

    Map<String,dynamic> map = new Map<String,dynamic>();

    map['name'] = this._name;
    map['img_path'] = this._img_path;
    map['description'] = this._description;
    map['menu_category'] = this._menu_category;
    map['product_variation'] = this._product_variation;
    map['price'] = this._price;
    
   return map;

  }


  Product.fromMap(Map<dynamic,dynamic> map){

    this._name = map['name'];
    this._img_path =map['img_path'];
    this._description =map['description'];
    this._menu_category = map['menu_category'];
    this._product_variation = map['product_variation'];
    this._price = map['price'];
  
    
  }


}


