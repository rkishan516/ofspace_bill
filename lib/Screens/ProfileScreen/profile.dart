import 'package:flutter/material.dart';
import 'package:ofspace/Screens/CartScreen/cart.dart';
import 'package:ofspace/Screens/ProfileScreen/ImageWidget.dart';
import 'package:ofspace/Screens/ProfileScreen/NearByFriend.dart';
import 'package:ofspace/models/Routing.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.local_fire_department_outlined,
          color: Colors.black,
        ),
        elevation: 0,
        title: Text(
          'ofsp_ce',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
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
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'My Balance',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFF36070),
                      ),
                      child: Center(
                        child: Text(
                          "\$",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '2870,86',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 70,
                              child: Stack(
                                children: [
                                  ImageWidget(
                                    top: 10,
                                    left: MediaQuery.of(context).size.width *
                                            0.15 -
                                        20,
                                    radius: 20,
                                  ),
                                  ImageWidget(
                                    top: 5,
                                    left: MediaQuery.of(context).size.width *
                                            0.15 +
                                        10,
                                    radius: 25,
                                  ),
                                  ImageWidget(
                                    left: MediaQuery.of(context).size.width *
                                            0.15 +
                                        50,
                                    radius: 30,
                                  ),
                                  ImageWidget(
                                    top: 5,
                                    left: MediaQuery.of(context).size.width *
                                            0.15 +
                                        100,
                                    radius: 25,
                                  ),
                                  ImageWidget(
                                    top: 10,
                                    left: MediaQuery.of(context).size.width *
                                            0.15 +
                                        150 -
                                        10,
                                    radius: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Total Bill',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\$",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: Text(
                                    "2876,50",
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.black,
                                      backgroundColor: const Color(0xFFFEE2BF),
                                      shape: StadiumBorder(),
                                    ),
                                    onPressed: () => Provider.of<Routing>(context,listen: false).showPage(CartScreen()),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: Text(
                                        "Split Now",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Nearby Friends",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 170,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      NearByFriend(
                        name: "Albert",
                        color: Color(0xFFEBFAFF),
                      ),
                      NearByFriend(
                        name: "Mike",
                        color: Color(0xFFFFEFBC),
                      ),
                      NearByFriend(
                        name: "Ronny",
                        color: Color(0xFFFEF4EF),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
