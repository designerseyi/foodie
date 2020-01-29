import 'package:foodie/revamp/model/menu_items.dart';

class ProductVariation{

List _variation;
List _choice;
List _toppings;

ProductVariation(this._choice,this._toppings,this_variation);

List get variation => this._variation;
List get choice => this._choice;
List get toppings => this._toppings;

Map<String,dynamic> toMap(){
  Map<String,dynamic> map = new Map<String,dynamic>();
   
   map['choice'] = this._choice;
   map['toppings'] = this._toppings;
   map['variation'] = this._variation;
  

return map;
}

ProductVariation.fromMap(Map<dynamic,dynamic> map){

   
   this._choice = map['choice'];
   this._toppings =map['toppings'];
   this._variation = map['variation'];

}

}

// choice class
//pick frm differnt choice of a particular product

class Choice{
  int _qty_min;
  int _qty_max;
  String _name;
  List<String> _options;

  Choice(this._name,this._options,this._qty_min,this._qty_max);

int get qty_min => this._qty_min;
int get qty_max =>this._qty_max;
String get name => this._name;
List<String> get options => this._options;

Map<String,dynamic> toMap(){
  Map<String,dynamic> map = new Map<String,dynamic>();
   map['qty_min'] = this._qty_min;
   map['qty_max'] = this._qty_max;
   map['name'] = this._name;
   map['options'] = this._options;
  

return map;
}

Choice.fromMap(Map<String,dynamic> map){

   this._qty_min =map['qty_min'];
   this._qty_max = map['qty_max'] ;
   this._name = map['name'];
   this._options =map['options'];

}

}

class Toppings{
  int _qty_min;
  int _qty_max;
  String _name;
  List<String> _options;

  Toppings(this._name,this._options,this._qty_min,this._qty_max);

int get qty_min => this._qty_min;
int get qty_max =>this._qty_max;
String get name => this._name;
List<String> get options => this._options;

Map<String,dynamic> toMap(){
  Map<String,dynamic> map = new Map<String,dynamic>();
   map['qty_min'] = this._qty_min;
   map['qty_max'] = this._qty_max;
   map['name'] = this._name;
   map['options'] = this._options;
  

return map;
}

Toppings.fromMap(Map<String,dynamic> map){

   this._qty_min =map['qty_min'];
   this._qty_max = map['qty_max'] ;
   this._name = map['name'];
   this._options =map['options'];

}

}


class Variation{
  int _price;
  int _container_price;
  String _name;


  Variation(this._name,this._price,this._container_price);

int get price => this._price;
int get container_price =>this._container_price;
String get name => this._name;


Map<String,dynamic> toMap(){
  Map<String,dynamic> map = new Map<String,dynamic>();
   map['price'] = this._price;
   map['container_price'] = this._container_price;
   map['name'] = this._name;
  
  

return map;
}

Variation.fromMap(Map<String,dynamic> map){

   this._price =map['price'];
   this._container_price = map['container_price'] ;
   this._name = map['name'];
  

}

}





