import 'package:flutter/material.dart';
import 'package:food_store/detal.dart';

import 'package:food_store/widget/widget_support.dart';

import '../modal/post_modal.dart';
import '../service/rtdb_service.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> items = [];
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
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                padding: EdgeInsets.only(right: 18, left: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: const Offset(
                          3.0,
                          3.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxS
                    ]),
                margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                width: 350,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Text(
                            items[index].name!,
                            style: AppWidget.semiBoldTextFieldStyle(),
                          ),
                        ),
                        Text(
                          items[index].title!,
                        ),
                      ],
                    ),
                    Center(
                        child: Image.asset(
                      "images/salad2.png",
                      height: 150,
                      width: 150,
                    ))
                  ],
                )),
          ]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailsPage();
          }));
        },
        child: Icon(
          Icons.add_outlined,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
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
