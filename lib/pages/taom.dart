import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_store/pages/taom_details.dart';

import '../modal/post_modal.dart';
import '../service/rtdb_service.dart';
import 'details_page.dart';

class Taom extends StatefulWidget {
  const Taom({super.key});

  @override
  State<Taom> createState() => _TaomState();
}

class _TaomState extends State<Taom> {
  List<Post> items = [];
  bool isClicked = false;
  _apiPostList() async {
    var list = await RTDBService.getFood();
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
      backgroundColor:Colors.white,
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 10, left: 8, right: 8),
            color: Colors.white70,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(items[index].image_url!),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(
                      top: 20,
                      left: 8
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
                          color: Colors.black,
                          fontFamily: "Poppins", fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 10,),
                    Row(
                        children:[ Text(items[index].title!,
                            style: TextStyle(
                              fontSize: 14, color: Colors.black, fontFamily: "Poppins", )),

                        ] ),
                    SizedBox(height: 40,),
                    Text(items[index].price!,
                        style: TextStyle(
                            fontSize: 17.5,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 5,)

                  ],
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: kIsWeb
          ? SizedBox()
          :  FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return TaomDetails();
          }));
        },
        child: Image.asset("images/food.png", height: 40, width: 40,),
        backgroundColor: Color.fromRGBO(36, 36, 47, 1.0),
      ),
    );
  }
}
