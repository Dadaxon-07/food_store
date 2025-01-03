import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

import '../modal/post_modal.dart';
import '../service/rtdb_service.dart';
import 'IchimlikDetails.dart';
import 'details_page.dart';

class Ichimliklar extends StatefulWidget {
  const Ichimliklar({super.key});

  @override
  State<Ichimliklar> createState() => _IchimliklarState();
}

class _IchimliklarState extends State<Ichimliklar> {
  List<Post> items = [];
  bool isClicked = false;
  _apiPostList() async {
    var list = await RTDBService.getIchimlik();
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
                    margin: EdgeInsets.only(top: 15, left: 8, bottom: 15),
                    width: 165,
                    height: 163,
                    child: ImageNetwork(
                      image: items[index].image_url!,
                      height: 161,
                      width: 163,
                      duration: 1500,
                      curve: Curves.easeIn,
                      onPointer: true,
                      debugPrint: false,
                      fullScreen: false,
                      fitAndroidIos: BoxFit.cover,
                      borderRadius: BorderRadius.circular(20),
                      fitWeb: BoxFitWeb.cover,
                      onLoading: const CircularProgressIndicator(
                        color: Colors.indigoAccent,
                      ),
                      onError: const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      onTap: () {
                        debugPrint("©gabriel_patrick_souza");
                      },
                    )),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].name!,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(items[index].title!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                            fontFamily: "Poppins",
                          )),
                      SizedBox(width: 70,),
                      kIsWeb
                      ?SizedBox()
                     : IconButton(
                        icon:  Icon(Icons.delete, color: Colors.red,),
                        onPressed: () {
                          // ...
                        },
                      ),
                    ]),
                    SizedBox(
                      height: 40,
                    ),
                    Text(items[index].price!,
                        style: TextStyle(
                            fontSize: 17.5,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 5,
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton:
      kIsWeb
          ?SizedBox()
          : FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return IchimlikDetails();
          }));
        },
        child: Image.asset(
          "images/suv.png",
          height: 40,
          width: 40,
        ),
        backgroundColor: Color.fromRGBO(36, 36, 47, 1.0),
      ),
    );
  }
}
