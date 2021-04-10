import 'package:flutter/material.dart';
import 'package:ofspace/models/Friend.dart';
import 'package:ofspace/models/Ratios.dart';
import 'package:provider/provider.dart';

class SplitUserCard extends StatefulWidget {
  final Friend friend;
  final int totalPrice;

  SplitUserCard({this.friend, this.totalPrice});

  @override
  _SplitUserCardState createState() => _SplitUserCardState();
}

class _SplitUserCardState extends State<SplitUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      widget.friend.image,
                    ),
                    radius: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${widget.friend.name} Pay for '),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Consumer<Ratios>(
                          builder: (context, r, child) {
                            return Text(
                              '${r.ratios[widget.friend.uid] ?? 0}%',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Consumer<Ratios>(
                        builder: (context, r, child) {
                          return Text(
                            '\$${widget.totalPrice * (r.ratios[widget.friend.uid] ?? 0) / 100}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            Consumer<Ratios>(
              builder: (context, r, _) {
                return Slider(
                  activeColor: Color(0xFFFFCC6A),
                  inactiveColor: Colors.grey[50],
                  value: r.ratios[widget.friend.uid] ?? 0,
                  onChanged: (val) {
                    r.updateRatio(widget.friend.uid, val);
                  },
                  max: 100,
                  min: 0,
                  divisions: 10,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
