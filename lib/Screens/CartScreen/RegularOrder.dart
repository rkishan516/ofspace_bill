import 'package:flutter/material.dart';
import 'package:ofspace/models/OrderItem.dart';
import 'package:ofspace/models/Restaurent.dart';
import 'package:ofspace/models/splitBill.dart';
import 'package:provider/provider.dart';

class RegularOrder extends StatelessWidget {
  final OrderItem orderItem;
  RegularOrder({this.orderItem});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Container(
          padding: EdgeInsets.only(left: 16.0, right: 4.0, top: 8.0, bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://img2.pngio.com/pav-bhaji-png-download-926579-free-transparent-pav-bhaji-png-pav-bhaji-png-900_580.jpg",
                ),
                radius: 25,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          orderItem.name,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          "\$${orderItem.price} each",
                          style: TextStyle(fontSize: 9, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (orderItem.count != 0) {
                    Provider.of<Restaurant>(context, listen: false)
                        .changeRegularItemCount(orderItem.name,
                            orderItem.count - 1 < 0 ? 0 : orderItem.count - 1);
                    Provider.of<SplitBill>(context, listen: false)
                        .changeBill(-orderItem.price.toInt());
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Icon(
                    Icons.remove,
                    size: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Consumer<Restaurant>(
                  builder: (context, res, child) {
                    int count = 0;
                    res.regularItem.forEach((element) {
                      if (element.name == orderItem.name) {
                        count = element.count ?? 0;
                      }
                    });
                    return Text(
                      '$count',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  Provider.of<Restaurant>(context, listen: false)
                      .changeRegularItemCount(
                          orderItem.name, orderItem.count + 1);
                  Provider.of<SplitBill>(context, listen: false)
                      .changeBill(orderItem.price.toInt());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 3),
                  child: Icon(
                    Icons.add,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
