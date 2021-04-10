import 'package:flutter/material.dart';
import 'package:ofspace/models/OrderItem.dart';
import 'package:ofspace/models/Restaurent.dart';
import 'package:ofspace/models/splitBill.dart';
import 'package:provider/provider.dart';

class SpecialOrder extends StatelessWidget {
  final OrderItem orderItem;
  SpecialOrder({this.orderItem});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://img2.pngio.com/pav-bhaji-png-download-926579-free-transparent-pav-bhaji-png-pav-bhaji-png-900_580.jpg",
              ),
              radius: 25,
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      if (orderItem.count != 0) {
                        Provider.of<Restaurant>(context, listen: false)
                            .changeSpecialItemCount(
                                orderItem.name,
                                orderItem.count - 1 < 0
                                    ? 0
                                    : orderItem.count - 1);
                        Provider.of<SplitBill>(context, listen: false)
                            .changeBill(-orderItem.price.toInt());
                      }
                    },
                    child: Icon(
                      Icons.remove,
                      size: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Consumer<Restaurant>(
                      builder: (context, res, child) {
                        int count = 0;
                        res.specialItem.forEach((element) {
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
                          .changeSpecialItemCount(
                              orderItem.name, orderItem.count + 1);
                      Provider.of<SplitBill>(context, listen: false)
                          .changeBill(orderItem.price.toInt());
                    },
                    child: Icon(
                      Icons.add,
                      size: 14,
                    ),
                  ),
                ],
              ),
            ),
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
    );
  }
}
