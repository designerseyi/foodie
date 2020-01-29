

// import 'package:bloc_pattern/bloc_pattern.dart';
// import 'package:flutter/material.dart';
// import 'package:foodie/revamp/helperclass/food_item_wrapper.dart';
// import 'package:foodie/revamp/model/product.dart';
// import 'package:foodie/revamp/styles/colors.dart';
// import 'food_extras_dialog.dart';

// Widget  buildFoodProduct({List<Product> mProducts,List<String> mProductid})  {

//   // general food items comprises of both food combo and Fooditem objects since both extends
//   // from the FoodItemAbstract

//   List<Product> Products = mProducts;
//   List<String> Productid = mProductid;
//   FoodItemWrapper foodItemWrapper;
//   double swidth;
 
//     swidth = MediaQuery.of(context).size.width;

//    return  Padding(

//      key: GlobalKey(),
//      padding: const EdgeInsets.only(right: 16.0,top: 8,bottom: 8),
//      child: Column(
//          children: Productid.map((productid){

//                     return Padding(
//                            padding: const EdgeInsets.only(bottom:16.0),
//                            child: 
//                                 GestureDetector(
//                                   onTap: (){},


//                                  child: FittedBox(
//                                         fit: BoxFit.contain,
//                                         child: Container(
//                                           width: swidth,
//                                           decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius: BorderRadius.all(Radius.circular(8))
//                                           ),
//                                           child: Padding(
//                                             padding: const EdgeInsets.only(top:8.0,left: 12.0,),
//                                             child: Column(
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               children: <Widget>[

//                                                 Padding(
//                                                   padding: const EdgeInsets.only(top:8.0,),
//                                                   child: Row(
//                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                     children: <Widget>[
//                                                       Text(Products[int.parse(productid)].name),
//                                                       Padding(
//                                                         padding: const EdgeInsets.only(right:16.0),
//                                                         child: Text('show')
//                                                       ),

//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Padding(
//                                                   padding: const EdgeInsets.only(top:8.0),
//                                                   child: Text(Products[int.parse(productid)].description),
//                                                 ),
//                                                 Padding(
//                                                   padding: const EdgeInsets.only(top:8.0,bottom: 12.0),
//                                                   child: Row(
//                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                     children: <Widget>[
//                                                       //todo work on the int.parse for index of list
//                                                       Products[int.parse(productid)].price!=null ?Text(Products[int.parse(productid)].price): Text(""),
//                                                       Padding(
//                                                         padding: const EdgeInsets.only(right:16.0),
//                                                         child: Icon(Icons.add,color: primaryColor,),
//                                                       )
//                                                     ],
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           ) ,
//                                         ),
//                                       ),
//                               ),


//                     );


//          }).toList()
//      ),
//    );

  
// }


