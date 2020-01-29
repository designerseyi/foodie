
import'package:flutter/material.dart';
import 'package:foodie/revamp/styles/colors.dart';
import 'package:foodie/revamp/styles/text_styles.dart';
import 'dashboard.dart';


class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

  List<String> _cities = ["Osun","Lagos", "Abuja","Ibadan" , "Portharcourt"];
  List<DropdownMenuItem<String>> _dropdownMenuItems;
  String _currentCity ;


  @override
  void setState(fn) {
    // TODO: implement setState

    _dropdownMenuItems = getDropDown();
    _currentCity = _dropdownMenuItems[0].value;
  }
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset:false,


      body: Stack(



        children: <Widget>[

              Container(
                  height: screenHeight,
                  width: screenWidth,
                  child: Padding(
                        padding: EdgeInsets.only(right:2),
                      child: Image.asset('assets/images/foodar.png',fit: BoxFit.cover,),
                  ),
              ),

          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(

              child: Material(
                elevation: 10.0,
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),

                  child: Wrap(


                    children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.only(left:20.0,top:16,bottom: 8),
                          child: Text("Choose your City",style: headingStyle,),
                        ),

                      Padding(
                        padding: const EdgeInsets.only(left:20.0,top:16,bottom: 8),
                        child: DropdownButton<String>(
                          value: _currentCity,
                          isExpanded: true,
                          hint: Text("Select City"),
                          onChanged: (String _value) {
                            setState(() {
                              _currentCity = _value;
//                            dropDown = false;
//                            print(_category);
                            });
                          },
                          items: _cities.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child:  Text(value,style:Theme.of(context).textTheme.title,),

                            );
                          }).toList(),
                        ),
                      ),


                         Padding(
                           padding: const EdgeInsets.only(bottom:16.0),
                           child: Center(
                              child: ButtonTheme(
                                minWidth: 100.0,
                                height: 48.0,
                                child: RaisedButton(

                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                  onPressed: (){

                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard() ));
                                },
                                color: primaryColor,
                                  textColor: Colors.white,
                                child: Text('Eat',style: Body,),
                                ),
                              ),

                           ),
                         ),


                    ],
                  ),

              ),
            ),
          ),






        ],
      ),


    );
  }

  void changedDropDownItem(String selectedCity){

    setState((){
      _currentCity = selectedCity;
    });
  }
  
  
  List<DropdownMenuItem<String>> getDropDown(){

    List<DropdownMenuItem<String>> items = new List();
    for(String city in _cities){

      items.add(new DropdownMenuItem(
          value: city,
          child: new Text(city)
      ));
    }

    return items;
  }
}
