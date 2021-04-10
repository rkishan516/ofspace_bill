import 'package:flutter/widgets.dart';

class Ratios extends ChangeNotifier {
  Map<String, double> ratios;
  Ratios({this.ratios});

  void updateRatio(String uid, double ratio){
    if(ratios[uid] == null){
      ratios[uid] = 0;
    }
    if(ratios.values.reduce((value, element) => value + element) -ratios[uid] + ratio <= 100){
      ratios[uid] = ratio;
    }
    notifyListeners();
  }
}