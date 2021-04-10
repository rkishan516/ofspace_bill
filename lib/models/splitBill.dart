import 'package:flutter/widgets.dart';
import 'package:ofspace/models/Friend.dart';

class SplitBill  extends ChangeNotifier {
  int totalBill;
  List<Friend> friend;

  SplitBill({this.totalBill = 0, this.friend});

  void changeBill(int amount){
    totalBill += amount;
    notifyListeners();
  }

  SplitBill.fromJson(Map<String, dynamic> json) {
    totalBill = json['totalBill'];
    if (json['friend'] != null) {
      friend = <Friend>[];
      json['friend'].forEach((v) {
        friend.add(new Friend.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalBill'] = this.totalBill;
    if (this.friend != null) {
      data['friend'] = this.friend.map((v) => v.toJson()).toList();
    }
    return data;
  }
}