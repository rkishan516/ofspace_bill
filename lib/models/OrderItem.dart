class OrderItem {
  String name;
  double price;
  String image;
  int count;

  OrderItem({this.name, this.price, this.image,this.count=0});

  OrderItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}