import 'package:flutter/material.dart';
import 'package:ofspace/models/Friend.dart';
import 'package:ofspace/models/OrderItem.dart';
import 'package:ofspace/models/Ratios.dart';
import 'package:ofspace/models/Restaurent.dart';
import 'package:ofspace/models/Routing.dart';
import 'package:ofspace/models/splitBill.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OfSpace',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Ratios(ratios: {}),
          ),
          ChangeNotifierProvider(
            create: (context) => Routing(),
          ),
          ChangeNotifierProvider(
            create: (context) => Restaurant(
              name: "The Palace",
              address: "3517 W. Gray. St. Utica, Pennsylvania, USA",
              specialItem: [
                OrderItem(
                    name: "Pide Doner Kebab",
                    image:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-iJhNLh3C8-PmYyxPFxU0bcz0MDQbBRoQFA&usqp=CAU",
                    price: 50),
                OrderItem(
                    name: "Turkish Pizza",
                    image:
                        "https://img.pngio.com/pizza-cartoon-png-download-1086752-free-transparent-turkish-turkish-food-png-900_640.jpg",
                    price: 75),
                OrderItem(
                    name: "Doy Doy Kebab",
                    image:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIRgWG01_oyYavXaZ7ISA9r7sCXCrOE9xszQ&usqp=CAU",
                    price: 95)
              ],
              regularItem: [
                OrderItem(
                    name: "Paav Bhaaji",
                    image:
                        "https://img2.pngio.com/pav-bhaji-png-download-926579-free-transparent-pav-bhaji-png-pav-bhaji-png-900_580.jpg",
                    price: 15),
                OrderItem(
                    name: "Water",
                    image:
                        "https://i.pinimg.com/originals/6d/19/d9/6d19d9a899ccf96773e77cd0ed028a3b.png",
                    price: 5),
              ],
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => SplitBill(
              totalBill: 0,
              friend: [
                Friend(
                  image: "https://avatars.githubusercontent.com/u/34465683?v=4",
                  name: "Ram",
                  uid: "01AC",
                ),
                Friend(
                  image: "https://avatars.githubusercontent.com/u/34465683?v=4",
                  name: "Ravi",
                  uid: "02ND",
                ),
                Friend(
                  image: "https://avatars.githubusercontent.com/u/34465683?v=4",
                  name: "Surya",
                  uid: "03AR",
                ),
                Friend(
                  image: "https://avatars.githubusercontent.com/u/34465683?v=4",
                  name: "Ishaan",
                  uid: "04RK",
                ),
              ],
            ),
          ),
        ],
        child: MyHomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Routing>(
      builder: (context, routing, widget) {
        return routing.widget;
      },
    );
  }
}
