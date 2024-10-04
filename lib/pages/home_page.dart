import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:food_store/detal.dart';
import 'package:food_store/pages/Salad.dart';
import 'package:food_store/pages/url_service.dart';

import 'package:food_store/widget/widget_support.dart';

import '../modal/post_modal.dart';
import '../service/rtdb_service.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  static final String id = "Home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> items = [];
  bool isClicked = false;
  _apiPostList() async {
    var list = await RTDBService.getPosts();
    items.clear();
    setState(() {
      items = list;
    });
  }

  void createPostTo() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return DetailsPage();
    }));
    _apiPostList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 36, 47, 1.0),
      body: SafeArea(
        bottom: true,
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              ButtonsTabBar(
                  labelSpacing: 7,
                  duration: 250,
                  width: 100,
                  backgroundColor: Colors.black,
                  unselectedBackgroundColor: Colors.white60,
                  unselectedLabelStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                  tabs: [
                    Tab(
                      icon: Icon(Icons.fastfood),
                      text: "Taom",
                    ),
                    Tab(
                      icon: Icon(Icons.no_food_sharp),
                      text: "Salad",
                    ),
                    Tab(
                      icon: Icon(Icons.emoji_food_beverage),
                      text: "Ichimlik",
                    ),
                    Tab(
                      icon: Icon(Icons.delete_sweep),
                      text: "Shirinlik",
                    ),
                  ],
                ),

              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Center(child: Salad()),
                    Center(
                      child: Icon(Icons.directions_transit),
                    ),
                    Center(
                      child: Icon(Icons.directions_bike),
                    ),
                    Center(
                      child: Icon(Icons.directions_car),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget food({img, name, title, price}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage2(
                      image: img,
                      name: name,
                      price: price,
                      title: title,
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(4),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  img,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 5,
                ),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/salad2.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  name,
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  title,
                                  style: AppWidget.LightTextFieldStyle(),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  price,
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  price,
                  style: AppWidget.semiBoldTextFieldStyle(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
