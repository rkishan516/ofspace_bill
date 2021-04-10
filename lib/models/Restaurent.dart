import 'package:flutter/widgets.dart';
import 'package:ofspace/models/OrderItem.dart';

class Restaurant extends ChangeNotifier {
  String name;
  String address;
  List<OrderItem> specialItem;
  List<OrderItem> regularItem;

  Restaurant({this.name, this.address, this.specialItem,this.regularItem});

  void changeRegularItemCount(String itemName, int count){
    regularItem.forEach((element) {
      if(element.name == itemName){
        element.count = count;
      }
    });
    notifyListeners();
  }

  void changeSpecialItemCount(String itemName, int count){
    specialItem.forEach((element) {
      if(element.name == itemName){
        element.count = count;
      }
    });
    notifyListeners();
  }

  Restaurant.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    if (json['specialItem'] != null) {
      specialItem = <OrderItem>[];
      json['specialItem'].forEach((v) {
        specialItem.add(new OrderItem.fromJson(v));
      });
    }
    if (json['regularItem'] != null) {
      regularItem = <OrderItem>[];
      json['regularItem'].forEach((v) {
        regularItem.add(new OrderItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    if (this.specialItem != null) {
      data['orderItem'] = this.specialItem.map((v) => v.toJson()).toList();
    }
    if (this.regularItem != null) {
      data['regularItem'] = this.regularItem.map((v) => v.toJson()).toList();
    }
    return data;
  }
}