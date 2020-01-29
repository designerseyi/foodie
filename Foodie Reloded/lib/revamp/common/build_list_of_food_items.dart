

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:foodie/revamp/helperclass/food_item_wrapper.dart';
import 'package:foodie/revamp/bloc/fooditem_and_cart_counter_bloc.dart';
import 'package:foodie/revamp/model/FooditemAbstract.dart';
import 'package:foodie/revamp/styles/colors.dart';
import 'food_extras_dialog.dart';

class buildFoodItems extends StatelessWidget {

  // general food items comprises of both food combo and Fooditem objects since both extends
  // from the FoodItemAbstract

  List<FoodItemAbstract> generalFooditems;
  FoodItemWrapper foodItemWrapper;
  double swidth;
  buildFoodItems({this.generalFooditems,});

  @override
  Widget build(BuildContext context) {
    swidth = MediaQuery.of(context).size.width;
//    final FoodItemCounterBloc fooditemCounterBloc  = BlocProvider.getBloc<FoodItemCounterBloc>();
   return  Padding(

     key: GlobalKey(),
     padding: const EdgeInsets.only(right: 16.0,top: 8,bottom: 8),
     child: Column(
         children: generalFooditems.map((generalFooditem){

           final fooditemCounterBloc = FoodItemAndCartCounterBloc();
//          final FoodItemCounterBloc fooditemCounterBloc  = BlocProvider.getBloc<FoodItemCounterBloc>();

           return Padding(
             padding: const EdgeInsets.only(bottom:16.0),
             child: GestureDetector(
               onTap: (){
                 if(generalFooditem.hasToppings || generalFooditem.hasType || generalFooditem.hasChoice){

//                ModalKnow(context,swidth,fil);

                   Navigator.push(context, MaterialPageRoute(builder: (context) => FoodExtrasDialog(generalFooditem: generalFooditem,),
                       fullscreenDialog: true
                   ), );
//                   fooditemCounterBloc.updateCount(generalFooditem);
                 }

                 else{

                  // creates a new
                   final  FoodItemAndCartCounterBloc cart = BlocProvider.getBloc<FoodItemAndCartCounterBloc>();
                   print(generalFooditem.price);

                   foodItemWrapper = new FoodItemWrapper(generalFooditem,generalFooditem.price);
                   cart.addToList(foodItemWrapper);
                   fooditemCounterBloc.updateCount(generalFooditem);
                   fooditemCounterBloc.updateFoodComboCount(generalFooditem);

                   print(generalFooditem.quantity);
                 }



               },
               child: FittedBox(
                 fit: BoxFit.contain,
                 child: Container(
                   width: swidth,
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.all(Radius.circular(8))
                   ),
                   child: Padding(
                     padding: const EdgeInsets.only(top:8.0,left: 12.0,),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[

                         Padding(
                           padding: const EdgeInsets.only(top:8.0,),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: <Widget>[
                               Text(generalFooditem.name),
                               Padding(
                                 padding: const EdgeInsets.only(right:16.0),
                                 child: StreamBuilder(
                                     stream: fooditemCounterBloc.getFoodComboCount,
                                     initialData: generalFooditem.numberOfItemsInCart,
                                     builder: (context,snapshot){

//                                        return Text('${snapshot.data}', style: TextStyle(color: Colors.white),);
                                       return snapshot.data >0 ?  Container(
                                         decoration: BoxDecoration(
                                             color: primaryColor,
                                             borderRadius: BorderRadius.circular(5)
                                         ),
                                         child: Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child: Text('${snapshot.data}', style: TextStyle(color: Colors.white),),
                                         )
                                         ,):
                                       Container();

                                     }),
                               ),

                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top:8.0),
                           child: Text(generalFooditem.des),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top:8.0,bottom: 12.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: <Widget>[
                               generalFooditem.price!=null ?Text(generalFooditem.price.toString()): Text(""),
                               Padding(
                                 padding: const EdgeInsets.only(right:16.0),
                                 child: Icon(Icons.add,color: primaryColor,),
                               )
                             ],
                           ),
                         )
                       ],
                     ),
                   ) ,
                 ),
               ),
             ),
           );

         }).toList()
     ),
   );

  }
}


