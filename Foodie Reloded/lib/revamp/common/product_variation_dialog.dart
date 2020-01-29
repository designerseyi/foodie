
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:foodie/revamp/bloc/fooditem_and_cart_counter_bloc.dart';
import 'package:foodie/revamp/model/foodcombo.dart';
import 'package:foodie/revamp/model/menu_items.dart';
import 'package:foodie/revamp/model/product_variation.dart';
import 'package:foodie/revamp/styles/colors.dart';
import 'package:foodie/revamp/styles/text_styles.dart';


class ProductVariationDialog extends StatefulWidget {

  List<MenuItem> menuitems;
  ProductVariation productVariation;
  String productName;
  
  ProductVariationDialog(this.productVariation,this.productName,this.menuitems);

  @override
  _ProductVariationDialogState createState() => _ProductVariationDialogState();
}

class _ProductVariationDialogState extends State<ProductVariationDialog> {
   


   final  FoodItemAndCartCounterBloc fooditemCounterBloc =  FoodItemAndCartCounterBloc();


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      key: UniqueKey(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: (){

           

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

                      child: Text(widget.productName, style: H4TextStyle,),
                    ),
                    SizedBox(height: 24,),
                     _buildFoodItem(widget.productVariation),
                    
                    


                  ],

                ),
              ),
            ),

            // _buildModalPrice(widget.generalFooditem),
          ],
        )




    );
  }

  Widget _buildFoodItem( ProductVariation productVariation){



    if(productVariation.choice.isNotEmpty && productVariation.toppings.isNotEmpty && productVariation.variation.isNotEmpty){
      return  Column(
        children: <Widget>[

          productVariation.variation.isNotEmpty ? _buildFoodVaraition(productVariation.choice): Text('') ,
          // _buildFoodType(foodCombo.list_of_foodType),
          SizedBox(height: 40,),

          //  productVariation.choice.isNotEmpty ? : ;

          // productVariation.toppings.isNotEmpty ? : ;
          // _buildToppings(foodCombo.list_of_foodToppings),



        ],

      );

    }


    

  }

  // Widget _buildToppings( List<FoodItem>  foodToppings){



  //   return  Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //     Padding(
  //       padding: const EdgeInsets.only(left:16.0),
  //       child: Text("YOUR EXTRAS", style: TextStyle(fontSize: 20),),
  //     ),

  //         Padding(
  //           padding: const EdgeInsets.only(left:10.0,top:12),
  //           child: Text(" Category", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
  //         ),

  //   for(FoodItem foodtopping in foodToppings)
  //   Builder(builder: (context){
  //   return subExtra(foodtopping);
  //   })
  //   ],
  //   );






  // }

  // Widget subExtra(FoodItem foodtopping){

  //   final  FoodItemAndCartCounterBloc subextraFoodItemAndCartCounter = FoodItemAndCartCounterBloc();

  //   return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[


  //       Row(
  //         children: <Widget>[

  //           StreamBuilder(
  //             stream: subextraFoodItemAndCartCounter.getcheckState,
  //             initialData: false,
  //             builder: (context, snapshot) {
  //             return Checkbox(

  //               activeColor: primaryColor,
  //               value:snapshot.data, onChanged: (bool value) {
  //           //                    total_price = total_price + foodItem.price;
  //               subextraFoodItemAndCartCounter.changeState(foodtopping,value);
  //               snapshot.data;

  //               if(value){

                

               

                             

  //               }
  //               else {

              

  //                             }



  //           });

  //           }
  //           ),
  //           Text(foodtopping.name),
  //           Text(foodtopping.price.toString())
  //       ],
  //       ),


  //   ],
  //   );
  // }


//  Widget _buildFoodVaraition(List foodVariations){


//  }

  Widget _buildFoodVaraition(List foodVariations){

      print(' fvlen:${foodVariations.length}');
      for( int i =0 ; i<= foodVariations.length;i++){
                 return  _buildEachFoodVariation(foodVariations[i],i);
             }

        // return Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // children: <Widget>[
        //   Padding(
        //   padding: const EdgeInsets.only(left: 16),
        //   child: Text("CHOOSE ONE OF THE OPTIONS BELOW",style: Body,),
        //   ),
           
        //   Builder(builder: (context){
        //      for( int i =0 ; i<= foodVariations.length;i++){
        //          return  _buildEachFoodVariation(foodVariations[i],i);
        //      }
        

        //   })

        //   ],
        //   );

  }


  Widget _buildEachFoodVariation(String foodVariation,int postion){

//    groupValue = 1;

    
      MenuItem item =  widget.menuitems.singleWhere(
            (menuitem)=> menuitem.name == 'fish');
        
        print('MyTEst: ${item.price}');


    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
       StreamBuilder<int>(
          stream: fooditemCounterBloc.getRadioState,
          initialData: 0,
         builder: (context, snapshot) {
           return Radio(value:postion, groupValue: snapshot.data, onChanged: (int e){
                  print(e.toString());

                    if(e == postion){


                      if(foodVariation !=null){
                        


                      } else{
                       

                      }


                    }

                    else{


                    }

                },activeColor: primaryColor,);
         }
       ),
        Text( "$foodVariation"),
        item.price != null ? Text('${item.price.toString()}'):Text(''),



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
                  


                  },
                  child: Icon(Icons.add_box, color: primaryColor,size: 40,)),
              StreamBuilder(
                  stream: subfooditemCounterBloc.tempCounterController,
                  initialData: 1,
                  builder: (context,snapshot){
                   
                    return Text("${snapshot.data}", style: TextStyle(fontSize: 32),);
                  }),

              GestureDetector(
                  onTap: (){
                    btnState =2;
                    subfooditemCounterBloc.decreaseCount(provider);

                    




                  },
                  child: Icon(Icons.indeterminate_check_box, color: primaryColor,size: 40,)),


            ],
          ),

          Spacer(flex: 1,),
          Expanded(
            flex: 4,
            child: FlatButton(onPressed: (){},
              padding: EdgeInsets.all(16),
              child:Text('Button'),
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




