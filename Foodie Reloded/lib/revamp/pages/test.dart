//
//import 'package:flutter/material.dart';
//import 'package:grouped_buttons/grouped_buttons.dart';
//
//class Test extends StatelessWidget {
//  List<String> _checked = [];
//  @override
//  Widget build(BuildContext context) {
//    return
//    Scaffold(
//
//      body: Column(
//        children: <Widget>[
//          SizedBox(height: 100,),
//          CheckboxGroup(
//            orientation: GroupedButtonsOrientation.HORIZONTAL,
//            margin: const EdgeInsets.only(left: 12.0),
//      onSelected: (List selected) => print(selected),
//            labels: <String>[
//              "A",
//              "D",
//            ],
////            checked: _checked,
//            itemBuilder: (Checkbox cb, Text txt, int i){
//              return Row(
//                children: <Widget>[
////                  Icon(Icons.polymer),
//                  cb,
//                  txt,
//
//                ],
//              );
//            },
//          ),
//        ],
//      ),
//    );
//  }
//}
