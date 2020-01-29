import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:foodie/revamp/pages/index.dart';
import 'package:foodie/revamp/pages/mydashboard.dart';
import 'package:foodie/revamp/pages/resturant_menu.dart';
import 'package:foodie/revamp/styles/colors.dart';

import 'revamp/bloc/check_box_bloc.dart';
import 'revamp/bloc/food_item_price_bloc.dart';
import 'revamp/bloc/fooditem_and_cart_counter_bloc.dart';
import 'revamp/pages/mydashboard.dart';
import 'revamp/pages/testfirestore.dart';

//import 'bloc/check_box_bloc.dart';
//import 'bloc/food_item_counter_bloc.dart';
//import 'bloc/food_item_totalprice_bloc.dart';
//import 'firebaseTest/login.dart';

void main() => runApp(Revamp());


class Revamp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return BlocProvider(
      blocs: [
        Bloc((i)=> FoodItemAndCartCounterBloc()),
        Bloc((i)=> CheckBoxBloc()),
        Bloc((i)=> FoodItemPriceBloc()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Montserrat',
          ).copyWith(
            primaryColor: primaryColor,

          ),
          home:MyDashboard(),
//      home: SplashScreen.navigate(
//        name: 'assets/foodap.flr',
//        next: MyHomePage(title: 'Flutter Demo Home Page'),
//        until: () => Future.delayed(Duration(seconds: 5)),
//        startAnimation: '1',
//      ),
      ),


    );


  }
}



//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return BlocProvider(
//      blocs: [
//        Bloc((i)=> FoodItemCounterBloc()),
//        Bloc((i)=> CheckBoxBloc()),
//        Bloc((i)=> FoodItemTotalPriceBloc()),
//      ],
//      child: MaterialApp(
//        title: 'Flutter Demo',
//        debugShowCheckedModeBanner: false,
//        theme: ThemeData(
//          fontFamily: 'Montserrat',
//        ).copyWith(
//          primaryColor: primaryColor,
//
//        ),
//        home:ResturantMenu()
////      home: SplashScreen.navigate(
////        name: 'assets/foodap.flr',
////        next: MyHomePage(title: 'Flutter Demo Home Page'),
////        until: () => Future.delayed(Duration(seconds: 5)),
////        startAnimation: '1',
////      ),
//      ),
//    );
//
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Scaffold(
//      appBar: AppBar(
//
//        title: Text(widget.title),
//      ),
//      body: Center(
//
//             child: FlareActor("assets/foodap.flr",fit: BoxFit.contain, animation:"fudap",),
//
//      ),
//
//    );
//  }
//}




