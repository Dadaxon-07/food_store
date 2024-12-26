

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

  Future<void> deletPost(String id) async {
    await RTDBService.deletePost(id);
    _apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 52, 52, 52),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (context, index) {
          String? postId = items[index].image_url;
          return Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 15),

            decoration: BoxDecoration(
              color: Color.fromARGB(255, 52, 52, 52),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 9, 9, 9),
                  blurRadius: 9.0,
                  spreadRadius: 2,
                  offset: Offset(
                    1,
                    0,
                  ),
                )
              ],
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(items[index].image_url!),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 9, 9, 9),
                        blurRadius: 5.0,
                        spreadRadius: 1,
                        offset: Offset(
                          1,
                          0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: Color.fromARGB(255, 52, 52, 52),
                  ),
                  margin: EdgeInsets.only(
                      top: 15,
                      left: 8,
                    bottom: 15
                  ),
                  width: 165,
                  height: 163,
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].name!,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontFamily: "Poppins", fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 10,),
                    Row(
                        children:[ Text(items[index].title!,
                            style: TextStyle(
                              fontSize: 14, color: Colors.white70, fontFamily: "Poppins", )),

                        ] ),
                    SizedBox(height: 40,),
                    Text(items[index].price!,
                        style: TextStyle(
                            fontSize: 17.5,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 5,)

                  ],
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailsPage();
          }));
        },
        child: Image.asset(
          "images/salad.png",
          height: 40,
          width: 40,
        ),
        backgroundColor: Color.fromRGBO(36, 36, 47, 1.0),
      ),
    );
  }
}
