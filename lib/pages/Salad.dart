import 'package:flutter/material.dart';

import '../modal/post_modal.dart';
import '../service/rtdb_service.dart';
import 'details_page.dart';

class Salad extends StatefulWidget {
  const Salad({super.key});

  @override
  State<Salad> createState() => _SaladState();
}

class _SaladState extends State<Salad> {
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
      body:    ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(items[index].image_url!),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(top: 30, left: 12, right: 12),
                width: 400,
                height: 140,
              ),
              Container(
                padding: EdgeInsets.only(right: 12, left: 30),
                margin: EdgeInsets.only(left: 12, right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  color: Color.fromARGB(233, 68, 67, 83),
                ),
                width: 400,
                height: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            items[index].name!,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "Poppins"),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: isClicked
                                  ? Colors.red
                                  : Colors.black, // Rangni o'zgartirish
                            ),
                            onPressed: () {
                              setState(() {
                                isClicked =
                                !isClicked; // Bosilganda holatni o'zgartirish
                              });
                            },
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(items[index].title!,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white60)),
                          Text(items[index].price!,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white60)),
                        ])
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
