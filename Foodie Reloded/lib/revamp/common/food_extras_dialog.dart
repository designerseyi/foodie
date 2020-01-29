
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:foodie/revamp/bloc/food_item_extralist_bloc.dart';
import 'package:foodie/revamp/bloc/food_item_price_bloc.dart';
import 'package:foodie/revamp/bloc/fooditem_and_cart_counter_bloc.dart';
import 'package:foodie/revamp/helperclass/food_extra_wrapper.dart';
import 'package:foodie/revamp/helperclass/food_item_wrapper.dart';
import 'package:foodie/revamp/model/FooditemAbstract.dart';
import 'package:foodie/revamp/model/food_item.dart';
import 'package:foodie/revamp/model/food_type.dart';
import 'package:foodie/revamp/model/foodcombo.dart';
import 'package:foodie/revamp/styles/colors.dart';
import 'package:foodie/revamp/styles/text_styles.dart';


class FoodExtrasDialog extends StatefulWidget {

  FoodItemAbstract generalFooditem;
  FoodExtrasDialog({this.generalFooditem});

  @override
  _FoodExtrasDialogState createState() => _FoodExtrasDialogState();
}

class _FoodExtrasDialogState extends State<FoodExtrasDialog> {

  List<FoodItem> list_extrasItem =[];

  String  foodChoice;
  List<FoodType>subfoodtype;

  List<FoodExtraWrapper> listFoodExtraWrapper = [];


  final FoodItemPriceBloc fooditemPriceBloc = FoodItemPriceBloc();


  final  FoodItemAndCartCounterBloc fooditemCounterBloc =  FoodItemAndCartCounterBloc();

  final FoodItemExtraListBloc foodItemExtraListBloc = FoodItemExtraListBloc();

  FoodItemWrapper foodItemWrapper;
  int total_price;
   int groupValue;
  int foodtypeTotal = 0;
  int foodExtralTotal = 0;
  int temp_quantity ;

  int globalCounter=1;
  bool confirmSelectedFoodType =false;






  @override
  Widget build(BuildContext context) {

//    final FoodItemCounterBloc fooditemCounterBloc = FoodItemCounterBloc();

    return Scaffold(
      key: UniqueKey(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: (){

                widget.generalFooditem.quantity =0;
                widget.generalFooditem.numberOfItemsInCart =0;

                Navigator.pop(context);

                },
              child: Icon(Icons.clear,size: 32,color: Colors.black,)),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),


        body: Column(
          children: <Widget>[
            Expanded(flex:2 ,
              child:Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),

                      child: Text(widget.generalFooditem.name, style: H4TextStyle,),
                    ),
                    SizedBox(height: 24,),
                    _buildFoodCombo(widget.generalFooditem),


                  ],

                ),
              ),
            ),

            _buildModalPrice(widget.generalFooditem),
          ],
        )




    );
  }

  Widget _buildFoodCombo(FoodCombo foodCombo ){



    if(foodCombo.hasToppings && (foodCombo.hasType || foodCombo.hasChoice )){
      return  Column(
        children: <Widget>[


          _buildFoodType(foodCombo.list_of_foodType),
          SizedBox(height: 40,),
          _buildToppings(foodCombo.list_of_foodToppings),



        ],

      );

    }


    else if(foodCombo.hasToppings){
      return _buildToppings(foodCombo.list_of_foodToppings);


    }

    else{
      return _buildFoodType(foodCombo.list_of_foodType);

    }


  }

  Widget _buildToppings( List<FoodItem>  foodToppings){



    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left:16.0),
        child: Text("YOUR EXTRAS", style: TextStyle(fontSize: 20),),
      ),

          Padding(
            padding: const EdgeInsets.only(left:10.0,top:12),
            child: Text(" Category", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
          ),

    for(FoodItem foodtopping in foodToppings)
    Builder(builder: (context){
    return subExtra(foodtopping);
    })
    ],
    );






  }

  Widget subExtra(FoodItem foodtopping){

    final  FoodItemAndCartCounterBloc subextraFoodItemAndCartCounter = FoodItemAndCartCounterBloc();

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[


        Row(
          children: <Widget>[

            StreamBuilder(
              stream: subextraFoodItemAndCartCounter.getcheckState,
              initialData: false,
              builder: (context, snapshot) {
              return Checkbox(

                activeColor: primaryColor,
                value:snapshot.data, onChanged: (bool value) {
            //                    total_price = total_price + foodItem.price;
                subextraFoodItemAndCartCounter.changeState(foodtopping,value);
                snapshot.data;

                if(value){

                foodExtralTotal = foodExtralTotal + foodtopping.price;

                total_price =  (foodExtralTotal + foodtypeTotal) * temp_quantity;
                print("tempquantity: ${temp_quantity}");
                fooditemPriceBloc.getTotalPrice(total_price);

                              if(list_extrasItem.length > 0){

                                for(int i =0 ; i < list_extrasItem.length ; i++){

                                  if(list_extrasItem[i].name != foodtopping.name){

                                    list_extrasItem.add(foodtopping);

                                    //upcoming
//                                    FoodExtraWrapper foodextraWrapper = FoodExtraWrapper(foodtopping.name,foodtopping.price.toString());
//                                    foodItemExtraListBloc.addToFoodExtraList(foodextraWrapper);


                                  }

                                }

                              }
                              else{
                                list_extrasItem.add(foodtopping);

                                //upcoming

                                FoodExtraWrapper foodextraWrapper = FoodExtraWrapper(foodtopping.name,foodtopping.price.toString());
                                foodItemExtraListBloc.addToFoodExtraList(foodextraWrapper);
                              }


                }
                else {

                foodExtralTotal = foodExtralTotal - foodtopping.price;
                total_price =  (foodExtralTotal + foodtypeTotal) * temp_quantity;
                fooditemPriceBloc.getTotalPrice(total_price);

                              if(list_extrasItem.length > 0){

                                for(int i =0 ; i < list_extrasItem.length ; i++){

                                  if(list_extrasItem[i].name == foodtopping.name){

                                    list_extrasItem.removeAt(i);
                                  }

                                }

                              }

//                upcoming
                FoodExtraWrapper foodextraWrapper = FoodExtraWrapper(foodtopping.name,foodtopping.price.toString());
                foodItemExtraListBloc.removeFromFoodExtraList(foodextraWrapper);


                }
                print(foodExtralTotal);
            //                print("extraitem: ${extrasItem.length}");

            });

            }
            ),
            Text(foodtopping.name),
            Text(foodtopping.price.toString())
        ],
        ),


    ],
    );
  }


  Widget _buildFoodType(List<FoodType> foodtype){

    groupValue = foodtype.first.id;
    subfoodtype = foodtype;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
    Padding(
    padding: const EdgeInsets.only(left: 16),
    child: Text("CHOOSE ONE OF THE OPTIONS BELOW",style: Body,),
    ),
    for(FoodType ft in foodtype)

    Builder(builder: (context){
    return  _buildEachFoodType(ft);

    })
    ],
    );

  }


  Widget _buildEachFoodType(FoodType foodtype){

//    groupValue = 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        StreamBuilder<int>(
          stream: fooditemCounterBloc.getRadioState,
          initialData: 0,
          builder: (context, snapshot) {
            return Radio(value:foodtype.id, groupValue: snapshot.data, onChanged: (int e){
              print(e.toString());
//              setState(() {
                if(e == foodtype.id){
//                  groupValue = e;
                  confirmSelectedFoodType = true;
                  if(foodtype.price !=null){
                    fooditemCounterBloc.addRadioState(e);
                    foodtypeTotal = foodtype.price;

                    total_price =  (foodExtralTotal + foodtypeTotal) * temp_quantity;
                    fooditemPriceBloc.getTotalPrice(total_price);

                    // food extra wrapper
                    FoodExtraWrapper foodextraWrapper = FoodExtraWrapper(foodtype.name,foodtype.price.toString());

                    foodItemExtraListBloc.addToFoodExtraList(foodextraWrapper);

                    print(foodtypeTotal);


                  } else{
                    fooditemCounterBloc.addRadioState(e);
                    foodChoice = foodtype.name;
                    print(foodChoice);

                  }


                }

                else{
//                  extrasItem.remove(foodtype.name);
//                  foodChoice = foodtype.name;

                  //food extra wrapper
                  FoodExtraWrapper foodextraWrapper = FoodExtraWrapper(foodtype.name,foodtype.price.toString());
                  foodItemExtraListBloc.removeFromFoodExtraList(foodextraWrapper);

                  print(foodextraWrapper);

                }

//              });

            },activeColor: primaryColor,);
          }
        ),
        Text( "${foodtype.name}"),
        Builder(builder: (context){

          if(foodtype.price != null){
            return Text(foodtype.price.toString());
          }
          else{
            return Text("");
          }

        }),



      ],
    );

  }

  Widget _buildModalPrice(FoodCombo provider){


//
    final  FoodItemAndCartCounterBloc subfooditemCounterBloc =  FoodItemAndCartCounterBloc();
////    final FoodItemTotalPriceBloc subfooditembloc = FoodItemTotalPriceBloc();
      final  FoodItemAndCartCounterBloc cartCounterBlok = BlocProvider.getBloc< FoodItemAndCartCounterBloc>();
    int btnState ;

    return Padding(

      key: UniqueKey(),
      padding: const EdgeInsets.only(left: 16, right: 16,bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(

            children: <Widget>[

              GestureDetector(
                  onTap: (){
                    btnState = 1;
                    subfooditemCounterBloc.updateCount(provider);

                    globalCounter++;

                    subfooditemCounterBloc.addTempCounter(globalCounter);


                  },
                  child: Icon(Icons.add_box, color: primaryColor,size: 40,)),
              StreamBuilder(
                  stream: subfooditemCounterBloc.tempCounterController,
                  initialData: 1,
                  builder: (context,snapshot){
                    temp_quantity = snapshot.data;
                    if(btnState == 1){
                      total_price =  (foodExtralTotal + foodtypeTotal) * snapshot.data;
                      fooditemPriceBloc.getTotalPrice(total_price);
                      fooditemPriceBloc.getUnit(total_price, temp_quantity);
                    }
                    else if(btnState == 2){

                      total_price =  (foodExtralTotal + foodtypeTotal) * snapshot.data;
                      fooditemPriceBloc.getTotalPrice(total_price);
                      fooditemPriceBloc.getUnit(total_price, temp_quantity);
                    }

                    return Text("${snapshot.data}", style: TextStyle(fontSize: 32),);
                  }),

              GestureDetector(
                  onTap: (){
                    btnState =2;
                    subfooditemCounterBloc.decreaseCount(provider);

                    if(globalCounter > 1){
                      globalCounter--;
                      subfooditemCounterBloc.addTempCounter(globalCounter);
                    }
                    else{
                      globalCounter = 1;
                      subfooditemCounterBloc.addTempCounter(globalCounter);
                    }





                  },
                  child: Icon(Icons.indeterminate_check_box, color: primaryColor,size: 40,)),


            ],
          ),

          Spacer(flex: 1,),
          Expanded(
            flex: 4,
            child: FlatButton(onPressed: (){},
              padding: EdgeInsets.all(16),
              child:
              StreamBuilder(
                  stream: fooditemPriceBloc.getPrice,
                  initialData: 0,
                  builder: (context, snapshot) {
                    total_price = snapshot.data;

                    return GestureDetector(
                        onTap: (){


                          if(confirmSelectedFoodType){
                            foodItemWrapper = new FoodItemWrapper(provider,snapshot.data,foodExtras: []);

//

//                          List<FoodExtraWrapper> listFoodExtraWrapper = [];
//
//                          foodItemExtraListBloc.getFoodExtraList.listen((val){
//                              listFoodExtraWrapper = val;
//                              print("foodExtra Count: ${listFoodExtraWrapper.length}");
//
//                              for(FoodExtraWrapper f in listFoodExtraWrapper){
//                                print("Added foodextra: ${f.name}");
//                              }
//
//                            },onDone: (){
//
//
//
//                            });


                            cartCounterBlok.addToList(foodItemWrapper);
//                          print(provider.price);
                            subfooditemCounterBloc.resetTempCounter();

                            subfooditemCounterBloc.updateFoodComboCount(provider);

                            Navigator.pop(context);

                          }
                          else{
                            ErrorDialog(context);
                          }


                        },
                        child: Text("ADD TO ORDER #${snapshot.data}",style: TextStyle(color: Colors.white),));
                  }
              ),
              color: primaryColor,
            ),
          )

        ],
      ),
    );

  }



}


Future<bool> ErrorDialog (context) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7))),

          child: Container(
            height: 100,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16,top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Error", style:Theme
                      .of(context)
                      .textTheme
                      .title,),
                  Text("Please select food type", style: Theme
                      .of(context)
                      .textTheme
                      .body1,),
                ],
              ),
            ),
          ),
        );
      });
}




