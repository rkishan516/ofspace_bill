class Friend {
  String name;
  String uid;
  String image;

  Friend({this.name, this.uid, this.image});

  Friend.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uid = json['uid'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['uid'] = this.uid;
    data['image'] = this.image;
    return data;
  }
}