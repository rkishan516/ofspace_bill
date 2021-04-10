import 'package:flutter/material.dart';
import 'package:ofspace/Screens/CartScreen/cart.dart';
import 'package:ofspace/Screens/SplitBillScreen/Sliderbutton.dart';
import 'package:ofspace/Screens/SplitBillScreen/SplitUserCard.dart';
import 'package:ofspace/models/Friend.dart';
import 'package:ofspace/models/Routing.dart';
import 'package:ofspace/models/splitBill.dart';
import 'package:provider/provider.dart';

class SplitBillScreen extends StatelessWidget {
  final SplitBill splitBill;
  SplitBillScreen({this.splitBill});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Provider.of<Routing>(context, listen: false)
              .showPage(CartScreen()),
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
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey[100]),
              child: Icon(
                Icons.alarm,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Split The Bill',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('Share in total'),
                ),
                trailing: Text(
                  '\$${splitBill.totalBill}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    for (Friend friend in splitBill.friend)
                      SplitUserCard(
                        friend: friend,
                        totalPrice: splitBill.totalBill,
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SliderButton(
        action: () {},
        width: MediaQuery.of(context).size.width * 0.9,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
