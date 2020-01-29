
import 'dart:collection';
import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie/revamp/common/product_variation_dialog.dart';
import 'package:foodie/revamp/model/menu_category.dart';
import 'package:foodie/revamp/model/menu_items.dart';
import 'package:foodie/revamp/model/product.dart';
import 'package:foodie/revamp/model/product_variation.dart';
import 'package:foodie/revamp/model/resturant.dart';
import 'package:foodie/revamp/styles/colors.dart';

class TestFirestore extends StatefulWidget {
  TestFirestore({Key key}) : super(key: key);

  @override
  _TestFirestoreState createState() => _TestFirestoreState();
}

class _TestFirestoreState extends State<TestFirestore> {


  
  @override
  Widget build(BuildContext context) {

  List<Map<String,dynamic>> menuCategories;
  List<Map<String, dynamic>> newProducts;
  List<Product> productList ;
  List<MenuItem> menuitems;


    return  Scaffold(

      appBar: AppBar(title: Text("test fire store"),),
      body: StreamBuilder(
              stream: Firestore.instance.collection('myres').document('CaptainCook').snapshots(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  //print("${snapshot.data.data}");

                  // load all documents needed an object
                  Restaurant r =Restaurant.fromMap(snapshot.data.data);

                  //load and convert Menucategories
                    menuCategories  = List<Map<String, dynamic>>();
                     r.menu_categories.forEach((map){

                     //conver categories to map<string,dynamic>
                      Map<String, dynamic> catMap = Map.from(map.map((key, value) {
                        //dynamic values = String.from(value);
                        return MapEntry(
                            key.toString(),
                            value);
                    }));

                  menuCategories.add(catMap);

                 });

                  //print('menu cat: ${menuCategories[0]}');


                

                  // load and convert all products
                  List products = r.products;                  
                   newProducts = List<Map<String, dynamic>>();   

                  productList = List<Product>();              
                  products.forEach((map){

                    
                      Map<String, dynamic> newMap = Map.from(map.map((key, value) {
                        //dynamic values = String.from(value);
                        return MapEntry(
                            key.toString(),
                            value);
                    }));

                  newProducts.add(newMap);

                  Product p = Product.fromMap(newMap);
                  productList.add(p);

                  });

              

              //test product
              Product mainProduct = Product.fromMap(newProducts[0]);
              //print('productOk: ${mainProduct.product_variation}');


              // load and convert product varint
               Map<String, dynamic> newProductVariationMap = Map.from(mainProduct.product_variation.map((key, value) {
                        //dynamic values = String.from(value);
                        return MapEntry(
                            key.toString(),
                            value);
                    }));

                ProductVariation productVariation = ProductVariation.fromMap(newProductVariationMap);

                //print('producvariation: ${productVariation.choice}');




        //       String lc = 'large chicken';
        //         MenuItem item =  menuitems.singleWhere(
        //     (menuitem)=> menuitem.name == lc);
        // print(' fromtest: ${item.price}');


            //get all menu items collection
            // Firestore.instance.collection('MenuItems').snapshots().listen((data){
                   
                    
            //       List menuitems = List();
            //       print(' menuItem:${data.documents}');
            //        data.documents.forEach((doc){
            //         print(' menuItem:${doc.data}');
            //         //list to store all menu item for a restaurant
                   
            //         //convert map to Menuitem
            //         MenuItem item = MenuItem.fromMap(doc.data);
            //         print('Item : ${item.name}');
                        
            //             if(item.res == 'captaincook'){

            //               menuitems.add(item);
            //             }

                      
            //        });

            //       print('list of menu items${menuitems.length}');
                    
                    
            //         return data;        

            // });
            



            
          
            // Firestore.instance
            // .collection('myres')
            // .where('menu_categories', arrayContains: {'img_path': 'path', 'name': 'Breakfast' })
            // .snapshots()
            // .listen((data) =>
            //     data.documents.forEach((doc) { 
            //        print(' my refk');
            //       print(doc["name"]);
                
                
            //   }            
            //     ));
            
                  
                

               return StreamBuilder<QuerySnapshot>(
                 stream: Firestore.instance.collection('MenuItems').where('res',isEqualTo: 'captaincook')
            .snapshots(),
                 builder: (context,  snapshot) {
                   if(snapshot.hasData){
                        menuitems = List<MenuItem>();
                 // print(' menuItem:${data.documents}');
                   snapshot.data.documents.forEach((doc){
                   // print(' menuItem:${doc.data}');
                    //list to store all menu item for a restaurant
                   
                    //convert map to Menuitem
                    MenuItem item = MenuItem.fromMap(doc.data);
                   // print('Item : ${item.name}');
                        
                        if(item.res == 'captaincook'){

                          menuitems.add(item);
                        }

                   });

                   return ListView.builder(
                            itemCount: menuCategories.length ,
                            itemBuilder: (context,position){


                                      MenuCategory menuCat = MenuCategory.fromMap(menuCategories[position]);  
                                      // convert value of Map<String,dynamic> to Product
                                      //Product mainProduct = Product.fromMap(newProducts[position]);
                                      List<String> mlistFood= List.castFrom(menuCat.listFood);

                                        return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                  children: <Widget>[

                                                  Text(menuCat.name,style:TextStyle(fontSize:24 ,fontWeight: FontWeight.w600),),

                                                   buildFoodProduct(productList,mlistFood,menuitems),

                                                ],

                                              );


                            },
                    );

                   }
                   // end of if
                   else{

                     return Center(child: CircularProgressIndicator(),);
                   }
                   
                  
                 }
               );


               
                } 
                else{
                  
                     return Center(child: CircularProgressIndicator(),);
                }

          
               
              }),
     
    );
  }


  Widget  buildFoodProduct(List<Product> Products,List Productid,List<MenuItem> menuitems)  {


  //FoodItemWrapper foodItemWrapper;
  double swidth;
 
    swidth = MediaQuery.of(context).size.width;

   return  Padding(

     key: GlobalKey(),
     padding: const EdgeInsets.only(top: 8,bottom: 8),
     child: Column(
         children: Productid.map((productid){

                    return Padding(
                           padding: const EdgeInsets.only(bottom:16.0),
                           child: 
                                GestureDetector(
                                  onTap: (){
                                        onProductTap(Products,productid,menuitems);


                                  },


                                 child: FittedBox(
                                        fit: BoxFit.cover,
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
                                                      Text(Products[int.parse(productid)].name),
                                                      Padding(
                                                        padding: const EdgeInsets.only(right:16.0),
                                                        child: Text('show')
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top:8.0),
                                                  child: Text(Products[int.parse(productid)].description ?? "description"),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top:8.0,bottom: 12.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                      //todo work on the int.parse for index of list
                                                      Products[int.parse(productid)].price.isNotEmpty ?Text(Products[int.parse(productid)].price??"ooo"): Text(""),
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




//on product tap


  void onProductTap(List<Product> mProducts, String mProductid,List<MenuItem> menuitems){

      int convertedPid = int.parse(mProductid);
      Product product = mProducts[convertedPid];

      // first convert product variation Map<dynamic,dynamic> to a productvariation t ype
      
        ProductVariation productVariation = ProductVariation.fromMap(product.product_variation);
        //print('product choice:${productVariation.choice }');

      // check if the productvariation(food item) has extras like tooppings and
      // choice , if it has any we will build the view on another screen
      // if it doesnt we just add the item to cart

        if(productVariation.choice.isNotEmpty || productVariation.toppings.isEmpty || productVariation.variation.isEmpty)
        {
             // print('a variation is available');

               Navigator.push(context, MaterialPageRoute(builder: (context) => ProductVariationDialog(productVariation,product.name,menuitems),
                       fullscreenDialog: true
                   ), );
        }
      
        else{
              // print('no variation is available');
        }



  }

  Future<Stream> gtData() async{
    Stream streamOne =  Firestore.instance.collection('myres').document('CaptainCook').snapshots();
    Stream streamTwo =  Firestore.instance.collection('MenuItems').where('res',isEqualTo: 'captaincook')
            .snapshots();

   return StreamZip([streamOne,streamTwo]);
  }

}


