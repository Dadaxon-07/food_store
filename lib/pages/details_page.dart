import 'package:flutter/material.dart';
import 'package:food_store/modal/post_modal.dart';
import 'package:food_store/pages/home_page.dart';

import 'package:food_store/service/rtdb_service.dart';

import '../widget/widget_support.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({
    super.key,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final _taomismiController = TextEditingController();
  final _taominfo = TextEditingController();
  final _taomnarhi = TextEditingController();

  _createPost() {
    String ism = _taomismiController.text.trim().toString();
    String info = _taominfo.text.trim().toString();
    String price = _taomnarhi.text.trim().toString();
    if (ism.isNotEmpty && info.isNotEmpty && price.isNotEmpty) {
      _apiCreatePost(ism, info, price);
    }
  }

  _apiCreatePost(String ism, String title, String price) {
    var post = Post(name: ism, title: title, price: price);
    RTDBService.addPost(post).then((value) => {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
            return HomePage();
          }))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          margin: EdgeInsets.all(4),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(20),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Center(
                              child: Icon(Icons.image_outlined),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Taom nomi",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xFFececf8),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: _taomismiController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Taom nomi",
                            hintStyle: AppWidget.LightTextFieldStyle()),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Taom Narhi",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xFFececf8),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: _taomnarhi,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Taom narhini yozing",
                            hintStyle: AppWidget.LightTextFieldStyle()),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Taom haqida",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xFFececf8),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        maxLines: 6,
                        controller: _taominfo,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Taom haqida yozing",
                            hintStyle: AppWidget.LightTextFieldStyle()),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: InkWell(
                        onTap: _createPost,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color(0xffff5722),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "Taom qo'shish",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
