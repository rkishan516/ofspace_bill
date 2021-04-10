import 'package:flutter/material.dart';
import 'package:ofspace/Screens/CartScreen/RegularOrder.dart';
import 'package:ofspace/Screens/CartScreen/SpeciaOrder.dart';
import 'package:ofspace/Screens/ProfileScreen/profile.dart';
import 'package:ofspace/Screens/SplitBillScreen/bill_split.dart';
import 'package:ofspace/models/OrderItem.dart';
import 'package:ofspace/models/Restaurent.dart';
import 'package:ofspace/models/Routing.dart';
import 'package:ofspace/models/splitBill.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Provider.of<Routing>(context, listen: false)
              .showPage(ProfilePage()),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(4),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/34465683?v=4",
                ),
                radius: 30,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Row(
                  children: [
                    Text(
                      Provider.of<Restaurant>(context, listen: false).name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.done, size: 10, color: Colors.white),
                      ),
                    )
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    Provider.of<Restaurant>(context, listen: false).address,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Special Order',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Container(
                height: 130,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (OrderItem specialOrder
                        in Provider.of<Restaurant>(context, listen: false)
                            .specialItem)
                      SpecialOrder(
                        orderItem: specialOrder,
                      )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Regular Order',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  for (OrderItem regularOrder
                      in Provider.of<Restaurant>(context, listen: false)
                          .regularItem)
                    RegularOrder(
                      orderItem: regularOrder,
                    )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () => Provider.of<Routing>(context, listen: false)
            .showPage(SplitBillScreen(
          splitBill: Provider.of<SplitBill>(context, listen: false),
        )),
        label: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Consumer<Restaurant>(
              builder: (context, restaurant, child) {
                int count = 0;
                restaurant.regularItem.forEach((element) {
                  count += element.count ?? 0;
                });
                restaurant.specialItem.forEach((element) {
                  count += element.count ?? 0;
                });
                return Text(
                  '$count Items added',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                );
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            Consumer<SplitBill>(
              builder: (context, sp, child) {
                return Text(
                  '\$${sp.totalBill}',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                );
              },
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 14,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
