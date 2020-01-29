import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:foodie/revamp/bloc/fooditem_and_cart_counter_bloc.dart';
import 'package:foodie/revamp/common/build_list_of_food_items.dart';
import 'package:foodie/revamp/helperclass/food_item_wrapper.dart';
import 'package:foodie/revamp/model/FoodChoice.dart';
import 'package:foodie/revamp/model/food_category.dart';
import 'package:foodie/revamp/model/food_item.dart';
import 'package:foodie/revamp/model/food_type.dart';
import 'package:foodie/revamp/model/foodcombo.dart';
import 'package:foodie/revamp/model/resturant.dart';
import 'package:foodie/revamp/styles/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'cart.dart';
class ResturantMenu extends StatefulWidget {
  @override
  _ResturantMenuState createState() => _ResturantMenuState();
}

class _ResturantMenuState extends State<ResturantMenu> {


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;


    return  Scaffold(

        backgroundColor: backgroundColor,

        body:  Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(top:44.0),
              child: Topbar(),
            ),


         Expanded(
           flex: 2,
            child: Container(
              child: ListView(
                children: resturant1.foodCategories.map((foodcategory){
                 return Padding(
                   padding: const EdgeInsets.only(left:16.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,

                     children: <Widget>[

                       Text(foodcategory.name,style:TextStyle(fontSize:24 ,fontWeight: FontWeight.w600),),

                       buildFoodItems(generalFooditems:foodcategory.generalfoodItem)

                     ],

                   ),
                 );

                }).toList()
              ),
            ),
          )


          ],
        ),





      floatingActionButton: FloatingActionButton(onPressed: (){

  Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
},

  backgroundColor: primaryColor,
    child:

           Icon(FontAwesomeIcons.shoppingBasket),


),

    );
  }
}


Widget Topbar() {

  final  FoodItemAndCartCounterBloc fooditemCartCounterBloc = BlocProvider.getBloc<FoodItemAndCartCounterBloc>();
  return Row(

    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[

      Padding(
        padding: const EdgeInsets.only(left:16.0),
        child: Icon(Icons.arrow_back),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: <Widget>[
            Text('Ostrich', style: TextStyle(fontSize:34 ,fontWeight: FontWeight.w600),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Icon(Icons.access_time),

                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text("13:00 - 6:00"),
                ),



              ],
            ),
            StreamBuilder(
              stream: fooditemCartCounterBloc.getcartList,
              builder: (context, snapshot) {
                List<FoodItemWrapper> foodItemwrapper = snapshot.data;
                int length = foodItemwrapper != null ? foodItemwrapper.length : 0;
                return Text(length.toString());
              }

            ),

          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(right:16.0),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: Colors.white
          ),

        ),
      ),

    ],
  );

}





//Future<bool> ModalKnow (context,double swidth, FoodItem fooditem){
//
//
//  return showDialog(
//      context: context,
//      barrierDismissible: true, // false = user must tap button, true = tap outside dialog
//      builder: (BuildContext dialogContext)
//      {
//        return Dialog(
//          shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.all(Radius.circular(20))),
//
//          child: Container(
//            height: 300,
//            width: swidth,
//            child: Padding(
//              padding: const EdgeInsets.only(left:16.0,right: 16),
//              child: ListView(
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.only(top:8.0),
//                    child: Text("Food Extras", style: H4TextStyle,),
//                  ),
//                  SizedBox(height: 24,),
////                  _buildExtras(fooditem),
////
////
////                  _buildModalPrice(fooditem),
//                ],
//
//              ),
//            ),
//          ),
//        );
//      });
//
//
//
//
//}






Resturant resturant1 = new Resturant(name: "Ostrish" , details: "Sotrich is located at osogbo",
    logoPath: "assets/images/",foodCategories: [pizzaCat,mealCat,drinksCat],acct: "no acct" ,state: "osun");




//  Start of foodcategory
FoodType smallPeperoni = FoodType(id: 1, name:"Small",price: 2500);
FoodType mediumPeperoni = FoodType(id: 2, name:"Medium",price: 3500);
FoodType largePeperoni = FoodType(id: 3, name:"Large",price: 5000);

FoodCombo pepperoni = FoodCombo("Peperoni","","peperoni",hasType:true,list_of_foodType: [smallPeperoni,mediumPeperoni,largePeperoni] );

//another general food item
FoodItem MazeratiPizza = FoodItem(name:"Mazeratti Pizza",
    imgPath:"assets/images/moneysaving.jpg",
    des:"This is pizza ",
    price:845);

 FoodCategory pizzaCat = FoodCategory(name:"Pizza",generalfoodItem: [pepperoni,MazeratiPizza]);

// end of food category


// start of food category

FoodItem RiceandChicken = FoodItem(name:"Fried rice and chicken",
    imgPath:"assets/images/moneysaving.jpg",
    des:"This is rice and chicken ",
    price:45);

FoodCombo JollofRice = FoodCombo("Jollof Rice","","Pary jollof rice",hasToppings: true,
    hasChoice: true,
    list_of_foodType: [
      FoodChoice(id:1,name: "With Turkey"),
      FoodChoice(id:2,name: "With Chicken"),
    ],
    list_of_foodToppings:[
    FoodItem(name:"Plantian",
    imgPath:"assets/images/moneysaving.jpg",
    des:"Plantain ",
    price:350),

    FoodItem(name:"Beans",
    imgPath:"assets/images/moneysaving.jpg",
    des:"Beans ", price:150),

    FoodItem(name:"Egg",
      imgPath:"assets/images/moneysaving.jpg",
      des:"Egg ", price:150),


]);
FoodCategory mealCat = FoodCategory(name: "Meals", generalfoodItem: [RiceandChicken,JollofRice]);

/// end of food category

// Startfood category

FoodCategory ToppingsCat = FoodCategory(name:"Toppings", generalfoodItem: [Icecream,CowMeat,Plantain,Beans]);

FoodItem Icecream = FoodItem(name:"ColdStone",
    imgPath:"assets/images/moneysaving.jpg",
    des:"This is  cold stone IceCream",
    price:345);

FoodItem CowMeat = FoodItem(name:"CowMeat",
    imgPath:"assets/images/moneysaving.jpg",
    des:"Cow meat ",
    price:500);

FoodItem Plantain = FoodItem(name:"Plantian",
    imgPath:"assets/images/moneysaving.jpg",
    des:"Plantain ",
    price:350);

FoodItem Beans = FoodItem(name:"Beans",
    imgPath:"assets/images/moneysaving.jpg",
    des:"Beans ",

    price:150);

// end of food Category


// start of food category

FoodCategory drinksCat = FoodCategory(name: "Drinks",generalfoodItem: [Drinks]);
FoodCombo Drinks = FoodCombo("Cocacola","","Cocacola",hasType: true,list_of_foodType:[
  cokeSmall,cokemeduim,cokeBig
]);

FoodItem Coke = FoodItem(name:"Cocacola",
    imgPath:"assets/images/moneysaving.jpg",
    des:"Cocacola",
    price:300,
   );

FoodType cokeSmall = FoodType(id: 1 ,name:"Coke 50cl", price:150);
FoodType cokeBig = FoodType(id: 2, name:"Coke 1 litre", price:150);
FoodType cokemeduim = FoodType(id: 3, name:"Coke Zero litre", price:200);

// end of food cat




