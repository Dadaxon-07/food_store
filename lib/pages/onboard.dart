import 'package:flutter/material.dart';
import 'package:food_store/pages/contet_modal.dart';
import 'package:food_store/pages/home_page.dart';
import 'package:food_store/pages/signup.dart';
import 'package:food_store/widget/widget_support.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: content.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Column(
                      children: [
                        Image.asset(
                          content[i].image,
                          height: 450,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          content[i].title,
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          content[i].description,
                          style: AppWidget.LightTextFieldStyle(),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  content.length,
                  (index) => buildDot(index, context),
                )),
          ),
          GestureDetector(onTap: (){
            if(currentIndex == content.length-1){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
            }
            _controller.nextPage(duration: Duration(microseconds: 100), curve: Curves.bounceIn);
          },
            child: Container(height: 60,
            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.all(40),
            width: double.infinity,
            child: Center(child: Text(currentIndex == content.length-1 ?"Start": "Next", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),))),
          )
        ],
      ),
    );
  }
  Container buildDot(int index, BuildContext context){
    return Container(
      height: 10,
      width: currentIndex == index?18:7,
      margin: EdgeInsets.only(right: 7),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: Colors.black38),
    );
  }
}
