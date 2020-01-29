
import 'dart:async';



import 'package:bloc_pattern/bloc_pattern.dart';

import 'checkbox_provider.dart';

class CheckBoxBloc extends BlocBase{


  StreamController streamController = new StreamController.broadcast();

  CheckBoxProvider provider = new CheckBoxProvider();
  Stream get getCheckState => streamController.stream;

  void ToggleCheck(bool s){

    provider.toggle(s);
    
    streamController.sink.add(provider.state);
  }

  void dispose(){
    streamController.close();
  }


}