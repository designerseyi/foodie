import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:foodie/revamp/bloc/food_item_price_bloc.dart';
import 'package:foodie/revamp/bloc/fooditem_and_cart_counter_bloc.dart';
import 'package:foodie/revamp/common/food_extras_dialog.dart';
import 'package:foodie/revamp/common/main_drawer.dart';
import 'package:foodie/revamp/helperclass/food_item_wrapper.dart';
import 'package:foodie/revamp/model/FoodChoice.dart';
import 'package:foodie/revamp/model/FooditemAbstract.dart';
import 'package:foodie/revamp/model/food_category.dart';
import 'package:foodie/revamp/model/food_item.dart';
import 'package:foodie/revamp/model/food_type.dart';
import 'package:foodie/revamp/model/foodcombo.dart';
import 'package:foodie/revamp/model/resturant.dart';
import 'package:foodie/revamp/styles/colors.dart';
import 'package:scrollable_bottom_sheet/scrollable_bottom_sheet.dart';
import 'package:scrollable_bottom_sheet/scrollable_controller.dart';


class MyDashboard extends StatefulWidget {
  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {

  // double
  double padding = 16.0;
  double radius = 16.0;

  double positionY = 0.0;

  // string
  String _image = "assets/0107/image.png";
  String _currentState = "min";

  // bool
  bool isBackSide = false;

  // controller
  final controller = ScrollableController();

  // for cart 

  FoodItemAndCartCounterBloc  fooditembloc = BlocProvider.getBloc<FoodItemAndCartCounterBloc >();
  final FoodItemPriceBloc fooditemTotalPriceBloc = BlocProvider.getBloc<FoodItemPriceBloc>();
  int btnState;
  int temp_quantity;
  int total_price;
  int  total_no_extra;
  int unit_price;


  @override
  Widget build(BuildContext context) {
    



      return Scaffold(
              body: Stack(
                children: <Widget>[

                     CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                    
                        leading: Icon(Icons.chevron_left),
                        title: Text("Ostrich"),
                        actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:8.0,right: 16),
                    child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/userboy.png'),
                    ),
                  ),
                ],
                        //title: Text('Fixed title', style: TextStyle(color: Colors.black),),
                        pinned: true,
                        centerTitle: false,
                        expandedHeight: 200,
                        flexibleSpace: FlexibleSpaceBar(
                          title:  Container( height: 50, color: Colors.white, child: Column( children: <Widget>[Text('Ostrich Resturant', style: TextStyle(color: Colors.black),), Text(' Resturant', style: TextStyle(color: Colors.black),)],),),
                          //background: Image.asset("assets/images/moneysaving.jpg"),
                        
                        ),
                        
                    ),


              //Text(" Hello")    
              

                SliverList(
                  delegate: SliverChildListDelegate(
                      resturant1.foodCategories.map((foodcategory){
                 return Padding(
                   padding: const EdgeInsets.only(left:16.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,

                     children: <Widget>[

                       Text(foodcategory.name,style:TextStyle(fontSize:24 ,fontWeight: FontWeight.w600),),

                       buildFoodItems(foodcategory.generalfoodItem,context)

                     ],

                   ),
                 );

                }).toList(),

                  ),
                ),

            ],
        ),

             bottomSheet(),

                ],
              ) 




         
             
      );

  }



  
Widget bottomSheet(){

  List list = List();
  
  
final  FoodItemAndCartCounterBloc fooditemCartCounterBloc = BlocProvider.getBloc<FoodItemAndCartCounterBloc>();
   double  screenHeight = MediaQuery.of(context).size.height;
      return Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ScrollableBottomSheet(
                autoPop: false,
                snapBelow: true,
                snapAbove: true,
                scrollTo: ScrollState.minimum,
                minimumHeight: 55.0,
                halfHeight: 380.0,
                controller: controller,
                callback: (state){
                  setState(() {
                    if(state == ScrollState.minimum){
                      _currentState = "min";
                      print("_currentState = $_currentState");

                    }
                    if(state == ScrollState.half){
                      _currentState = "half";
                      print("_currentState = $_currentState");
                    }
                    if(state == ScrollState.full){
                      _currentState = "full";
                      print("_currentState = $_currentState");
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top: padding, left: padding, right: padding),
                  height: screenHeight - 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius *2),
                      topRight: Radius.circular(radius *2),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // text: today

                      
           
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,right: 8.0),
                        child: Row(
                          
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                          children: <Widget>[


                            
                               Text("Cart",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                         color: Colors.black,
                                       fontWeight: FontWeight.w500,
                                    ),
                                     ),


                               StreamBuilder(
                                stream: fooditemCartCounterBloc.getcartList,
                                builder: (context, snapshot) {
                                  List<FoodItemWrapper> foodItemwrapper = snapshot.data;
                                  int length = foodItemwrapper != null ? foodItemwrapper.length : 0;
                                  return Text("${length.toString()} Item(s)", 
                                      style: TextStyle(
                                        fontSize: 20.0,
                                         color: Colors.black,
                                       fontWeight: FontWeight.w500,
                                    ),);
                                }

                              ),
                                       
                            



                              Text("#650",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                         color: Colors.black,
                                       fontWeight: FontWeight.w500,
                                    ),
                                     ),
                            
                            



                 



                        

                        ],),
                      ),

                      
                      // list view
                      Flexible(
                        fit: FlexFit.tight,
                        child: Cart(),
                      ),
                    ],
                  ),
                ),
            ),
          );

}


  


Widget _cartItem(List<FoodItemWrapper> fooditemwrappers){


    return ListView.builder(
           padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
          itemCount: fooditemwrappers.length,
          itemBuilder: (context,position){

           return _getCartFoodItem(fooditemwrappers[position])?? Text("No item in cart");

          },

      );


  }

 Widget Cart() {

    List<FoodItemWrapper> fooditemwrapper;
//    fooditembloc.getSubTotal(list_of_fooditemwrapper);

    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16,top: 8),


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







Widget buildFoodItems ( List<FoodItemAbstract> generalFooditems,BuildContext context) {

  // general food items comprises of both food combo and Fooditem objects since both extends
  // from the FoodItemAbstract

 
  FoodItemWrapper foodItemWrapper;
  double swidth =MediaQuery.of(context).size.width;

   
//    final FoodItemCounterBloc fooditemCounterBloc  = BlocProvider.getBloc<FoodItemCounterBloc>();
   return  Padding(

     key: GlobalKey(),
     padding: const EdgeInsets.only(right: 16.0,top: 8,bottom: 8),
     child: Column(
         children: generalFooditems.map((generalFooditem){

           final fooditemCounterBloc = FoodItemAndCartCounterBloc();
          //final FoodItemAndCartCounterBloc fooditemCounterBloc  = BlocProvider.getBloc<FoodItemAndCartCounterBloc>();

           return Padding(
             padding: const EdgeInsets.only(bottom:16.0),
             child: GestureDetector(
               onTap: (){
                 if(generalFooditem.hasToppings || generalFooditem.hasType || generalFooditem.hasChoice){

//                ModalKnow(context,swidth,fil);

                   Navigator.push(context, MaterialPageRoute(builder: (context) => FoodExtrasDialog(generalFooditem: generalFooditem,),
                       fullscreenDialog: true
                   ),

                   );
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
