
class MenuCategory{


  String _name;
  String _img_path;
  List _listFood;
 
 

  MenuCategory(this._name,this._img_path,this._listFood);

  String get name => this._name;
  String get img_path => this._img_path;
  List get listFood => this._listFood;
 
 


  Map<String,dynamic> tomap(){

    Map<String,dynamic> map = new Map<String,dynamic>();

    map['name'] = this._name;
    map['img_path'] = this._img_path;
    map['listFood'] = this._listFood;
    
   return map;

  }


  MenuCategory.fromMap(Map<String,dynamic> map){

    this._name = map['name'];
    this._img_path =map['img_path'];
    this._listFood = map['listFood'];
  
    
  }


}