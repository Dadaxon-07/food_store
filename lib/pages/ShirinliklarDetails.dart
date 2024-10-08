import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../modal/post_modal.dart';
import '../service/rtdb_service.dart';
import '../service/storage_service.dart';
import '../widget/widget_support.dart';
import 'home_page.dart';

class Shirinliklardetails extends StatefulWidget {
  const Shirinliklardetails({super.key});

  @override
  State<Shirinliklardetails> createState() => _ShirinliklardetailsState();
}

class _ShirinliklardetailsState extends State<Shirinliklardetails> {

  final _taomismiController = TextEditingController();
  final _taominfo = TextEditingController();
  final _taomnarhi = TextEditingController();

  File? _image;
  final picker = ImagePicker();

  Future _getImage() async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(pickedFile!=null){
        _image = File(pickedFile.path);
      }
      else{
        print("No image selected");
      }
    });
  }

  _createPost() {
    String ism = _taomismiController.text.trim().toString();
    String info = _taominfo.text.trim().toString();
    String price = _taomnarhi.text.trim().toString();
    if (ism.isNotEmpty && info.isNotEmpty && price.isNotEmpty) {
      _apiUploadImage(ism, info, price,);

    }
  }

  _apiUploadImage(String ism, String info, String price){
    StorageService.uploadImage(_image!).then((url)=>{
      _apiCreatePost(ism, info, price, url)
    });
  }

  _apiCreatePost(String ism, String title, String price, String url) {
    var post = Post(name: ism, title: title, price: price, image_url: url);
    RTDBService.addSweet(post).then((value) => {
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
                        child: InkWell(
                          onTap: (){
                            _getImage();
                          },
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
                                child: _image!=null
                                    ?Image.file(_image!, fit: BoxFit.cover,)
                                    :Icon(Icons.camera_alt_outlined),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Shirinlik nomi",
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
                            hintText: "Shirinlik nomini yozing",
                            hintStyle: AppWidget.LightTextFieldStyle()),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Shirinlik Narhi",
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
                            hintText: "Shirinlik narhini yozing",
                            hintStyle: AppWidget.LightTextFieldStyle()),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Shirinlik haqida",
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
                            hintText: "Shirinlik haqida yozing",
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
                              "Shirinlik qo'shish",
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
