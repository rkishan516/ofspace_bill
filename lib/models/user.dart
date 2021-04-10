import 'package:ofspace/models/Friend.dart';

class User {
  String uid;
  String name;
  int balance;
  List<Friend> friend;

  User({this.uid, this.name, this.balance, this.friend});

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    balance = json['balance'];
    if (json['friend'] != null) {
      friend = <Friend>[];
      json['friend'].forEach((v) {
        friend.add(new Friend.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['balance'] = this.balance;
    if (this.friend != null) {
      data['friend'] = this.friend.map((v) => v.toJson()).toList();
    }
    return data;
  }
}