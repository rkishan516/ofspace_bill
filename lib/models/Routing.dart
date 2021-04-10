import 'package:flutter/widgets.dart';
import 'package:ofspace/Screens/ProfileScreen/profile.dart';

class Routing extends ChangeNotifier{
  Widget widget = ProfilePage();
  void showPage(Widget _widget){
    widget = _widget;
    notifyListeners();
  }
}