import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:foodie/revamp/bloc/food_item_price_bloc.dart';
import 'package:foodie/revamp/bloc/fooditem_and_cart_counter_bloc.dart';
import 'package:foodie/revamp/helperclass/food_item_wrapper.dart';
import 'package:foodie/revamp/styles/colors.dart';

class Cart extends StatelessWidget {
  FoodItemAndCartCounterBloc  fooditembloc = BlocProvider.getBloc<FoodItemAndCartCounterBloc >();

  final FoodItemPriceBloc fooditemTotalPriceBloc = BlocProvider.getBloc<FoodItemPriceBloc>();
  int btnState;
  int temp_quantity;
  int total_price;
  int  total_no_extra;
  int unit_price;



  @override
  Widget build(BuildContext context) {

    List<FoodItemWrapper> fooditemwrapper;
//    fooditembloc.getSubTotal(list_of_fooditemwrapper);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: (){Navigator.pop(context);},
              child: Padding(
                padding: const EdgeInsets.only(top:28.0,left: 8.0),
                child: Icon(Icons.clear,size: 32,color: Colors.black,),
              )),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top:16.0),
            child: Text("Cart", style:TextStyle(fontSize: 40, color: Colors.black),),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),


        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left:16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("ORDER FROM",),
                  Padding(
                    padding: const EdgeInsets.only(top:4.0),
                    child: Text("KFC - Palms Ibadan",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:16.0),
                    child: Text("ESTIMATED DELIVERY TIME"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:4.0),
                    child: Text("35-45 minutes",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
                  ),
                ],
              ),
            ),



            SizedBox(height: 24,),

            Expanded(flex:2 ,
              child:Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16,top: 8),


//                    Padding(
//                      padding: const EdgeInsets.only(bottom: 20.0,),
//
//                    ),
//                    Divider(),

                    child: StreamBuilder(
                        stream: fooditembloc.getcartList ,
                       builder: (context, snapshot){
                          if(snapshot.data != null){

                            fooditemwrapper = snapshot.data;
                              return _cartItem(fooditemwrapper);
                          }
                          else{
                            return Container();
                          }

                       }),
                
              ),
            ),



            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('SubTotal:'),

                      StreamBuilder(
                          stream: fooditembloc.SubTotal ,
                          builder: (context, snapshot){



                            if(snapshot.data != null){
                              int subtotal = 0;
                              for(FoodItemWrapper subfooditemwrapper in snapshot.data){

                                subtotal = subtotal + subfooditemwrapper.cartItemPrice;

                              }

                              return Text(subtotal.toString());
                            }
                            else{
                              return Container();
                            }

                          }),



                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Delivey Fee'),
                      Text('3oo3oi3'),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Total'),
                      Text('330'),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom:8.0,top:20),
                  child: FlatButton(
                    padding: EdgeInsets.only(left: 16,right: 16 , top:12,bottom: 12),
                    onPressed: (){}, child: Text("PROCEED TO CHECKOUT",style:TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w600),),color: greenColor,),
                )
              ],
            ),







//            _buildModalPrice(widget.fi),
          ],
        )




    );
  }

  Widget _cartItem(List<FoodItemWrapper> fooditemwrappers){


    return ListView.builder(

          itemCount: fooditemwrappers.length,
          itemBuilder: (context,position){

           return _getCartFoodItem(fooditemwrappers[position])?? Text("No item in cart");

          },

      );


  }


Widget _getCartFoodItem(FoodItemWrapper subfooditemwrapper){

    
      return Column(
      children: <Widget>[


          Builder(builder: (context){
            fooditembloc.addSubTotal(subfooditemwrapper);

            if(subfooditemwrapper.foodItem.hasType || subfooditemwrapper.foodItem.hasToppings){

             FoodItemAndCartCounterBloc extrablock = FoodItemAndCartCounterBloc();
              int extra_total;


              return Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(subfooditemwrapper.foodItem.name, style: TextStyle(fontSize:22),),

                      StreamBuilder(
                        stream:extrablock.getCount ,
                        initialData: subfooditemwrapper.foodItem.quantity,
                        builder: (context, snapshot) {
                          extra_total = snapshot.data * subfooditemwrapper.temp_totalPrice;

                          subfooditemwrapper.setCartItemPrice(extra_total);

                          return Text("#${extra_total}", style: TextStyle(fontSize:22),);


                        })

                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        GestureDetector(
                            onTap: (){
                              fooditembloc.resetCount(subfooditemwrapper.foodItem);
                              print(" food item quantiy: ${subfooditemwrapper.foodItem.quantity}");
                              fooditembloc.removeFromList(subfooditemwrapper);
                              fooditembloc.removeSubTotal(subfooditemwrapper);




                                },
                            child: Text("X Remove")),


                        Row(

                          children: <Widget>[

                            GestureDetector(
                                onTap: (){
                                  btnState = 1;
                                  extrablock.updateCount(subfooditemwrapper.foodItem);
                                  extra_total =  subfooditemwrapper.temp_totalPrice* subfooditemwrapper.foodItem.quantity;

                                  subfooditemwrapper.setCartItemPrice(extra_total);

                                  fooditembloc.addSubTotal(subfooditemwrapper);



                                },
                                child: Icon(Icons.add_box, color: primaryColor,size: 30,)),
                            StreamBuilder(
                                stream: extrablock.getCount,
                                initialData: subfooditemwrapper.foodItem.quantity,
                                builder: (context,snapshot){
                                  temp_quantity = snapshot.data;
//
                                  return Padding(
                                    padding: const EdgeInsets.only(left:8.0,right: 8.0),
                                    child: Text(subfooditemwrapper.foodItem.quantity.toString(), style: TextStyle(fontSize: 18),),
                                  );
                                }),
                            GestureDetector(
                                onTap: (){
                                  btnState =2;
                                  extrablock.decreaseCount(subfooditemwrapper.foodItem);
                                  extra_total =  subfooditemwrapper.temp_totalPrice * subfooditemwrapper.foodItem.quantity;

                                  subfooditemwrapper.setCartItemPrice(extra_total);
                                  fooditembloc.addSubTotal(subfooditemwrapper);


                                },
                                child: Icon(Icons.indeterminate_check_box, color: primaryColor,size: 30,)),


                          ],
                        ),


                      ],
                    ),
                  ),
                ],
              );


            }


            else {

              FoodItemAndCartCounterBloc block =FoodItemAndCartCounterBloc();


                  int test_total;
              return Padding(
                padding: const EdgeInsets.only(top:8.0,bottom:16),
                child: Column(

                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(subfooditemwrapper.foodItem.name, style: TextStyle(fontSize:22),),

                        StreamBuilder(
                            stream:block.getCount ,
                          initialData: subfooditemwrapper.foodItem.quantity,
                            builder: (context, snapshot) {
                                test_total = snapshot.data * subfooditemwrapper.foodItem.price;

                                subfooditemwrapper.setCartItemPrice(test_total);


                                return Text("#${test_total}", style: TextStyle(fontSize:22),);


                            }
                        )

                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          GestureDetector(
                              onTap:(){
                                    fooditembloc.removeFromList(subfooditemwrapper);
                                    fooditembloc.removeSubTotal(subfooditemwrapper);
                                    },
                              child: Text("X Remove")),


                          Row(

                            children: <Widget>[

                              GestureDetector(
                                  onTap: (){
                                    btnState = 1;
                                    block.updateCount(subfooditemwrapper.foodItem);
                                    test_total =  subfooditemwrapper.foodItem.price * subfooditemwrapper.foodItem.quantity;

                                    subfooditemwrapper.setCartItemPrice(test_total);
                                    fooditembloc.addSubTotal(subfooditemwrapper);


                                  },
                                  child: Icon(Icons.add_box, color: primaryColor,size: 30,)),
                              StreamBuilder(
                                  stream: block.getCount,
                                  initialData: subfooditemwrapper.foodItem.quantity,
                                  builder: (context,snapshot){
                                    temp_quantity = snapshot.data;
                                    return Padding(
                                      padding: const EdgeInsets.only(left:8.0,right: 8.0),
                                      child: Text(subfooditemwrapper.foodItem.quantity.toString(), style: TextStyle(fontSize: 18),),
                                    );
                                  }),
                              GestureDetector(
                                  onTap: (){
                                    btnState =2;
                                    block.decreaseCount(subfooditemwrapper.foodItem);
                                    test_total =  subfooditemwrapper.foodItem.price * subfooditemwrapper.foodItem.quantity;

                                    subfooditemwrapper.setCartItemPrice(test_total);
                                    fooditembloc.addSubTotal(subfooditemwrapper);


                                  },
                                  child: Icon(Icons.indeterminate_check_box, color: primaryColor,size: 30,)),


                            ],
                          ),


                        ],
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(top:12.0,),
                      child: Divider(height:2,color: Colors.black,),
                    ),
                  ],
                ),
              );

            }


          }),


    ],

    );


}




}
