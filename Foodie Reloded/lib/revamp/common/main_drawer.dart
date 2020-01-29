import 'package:flutter/material.dart';


class MainDrawer  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:  Column(

                children: <Widget>[

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),

                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: Column(

                        children: <Widget>[

                          Container(width: 100, height: 100,
                            margin: EdgeInsets.only(top:30,bottom: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/userboy.png'),
                                fit: BoxFit.fill,
                              ),

                            ),
                          ),

                          Text('My Username', style: TextStyle(fontSize: 22,color: Colors.black),),
                          Text('Firstname', style: TextStyle(color:Colors.black),),

                        ],
                      ),
                    ),
                  ),


                  ListTile(
                    onTap: (){
                      Navigator.of(context).pop();
                      //Navigator.push(context, MaterialPageRoute(builder:(context)=>Wallet(), ));
                    },
                    leading: Icon(Icons.star),
                    title: Text("Favorite",style: TextStyle(fontSize: 18),
                    ),
                  ),

                  ListTile(
                    onTap: (){
                      Navigator.of(context).pop();
                      //Navigator.push(context, MaterialPageRoute(builder:(context)=>Wallet(), ));
                    },
                    leading: Icon(Icons.history),
                    title: Text("History",style: TextStyle(fontSize: 18),
                    ),
                  ),

                  ListTile(
                    onTap: (){
                      Navigator.of(context).pop();
                      //Navigator.push(context, MaterialPageRoute(builder:(context)=>Wallet(), ));
                    },
                    leading: Icon(Icons.local_dining),
                    title: Text("Deals",style: TextStyle(fontSize: 18),
                    ),
                  ),

                  ListTile(
                    onTap: (){
                      Navigator.of(context).pop();
                      //Navigator.push(context, MaterialPageRoute(builder:(context)=>Wallet(), ));
                    },
                    leading: Icon(Icons.account_balance_wallet),
                    title: Text("Wallet",style: TextStyle(fontSize: 18),
                    ),
                  ),

                  ListTile(
                    onTap: (){

                    },
                    leading: Icon(Icons.forum),
                    title: Text("Chat",style: TextStyle(fontSize: 18),
                    ),
                  ),

                  ListTile(
                    onTap: (){


                    },
                    leading: Icon(Icons.done_outline),
                    title: Text("Sign out",style: TextStyle(fontSize: 18),
                    ),
                  ),

                ],
              )

    );
  }
}


