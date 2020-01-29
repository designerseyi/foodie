
class MenuItem{


  String _name;
  String _price;
  String _description;
  String _res;
 

  MenuItem(this._name,this._price,this._description,this._res);

  String get name => this._name;
  String get price => this._price;
  String get description => this._description;
  String get res => this._res;
 


  Map<String,dynamic> tomap(){

    Map<String,dynamic> map = new Map<String,dynamic>();

    map['name'] = this._name;
    map['price'] = this._price;
    map['description'] = this.description;
    map['res'] = this._res;
   return map;

  }


  MenuItem.fromMap(Map<String,dynamic> map){

    this._name = map['name'];
    this._price =map['price'];
    this._description = map['description'];
    this._res = map['res'];
    
  }


}