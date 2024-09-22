import 'package:flutter/material.dart';
import 'package:food_store/detal.dart';

import 'package:food_store/widget/widget_support.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool icercream = false, pizza = false, salad = false, burger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 10.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello Dadaxon", style: AppWidget.boldTextFieldStyle()),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text("Delicious Food", style: AppWidget.HeadlineTextFieldStyle()),
            Text("Discover and Greta Food",
                style: AppWidget.LightTextFieldStyle()),
            SizedBox(
              height: 20,
            ),
            Container(margin: EdgeInsets.only(right: 20), child: showItem()),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  food(
                      img: "images/salad2.png",
                      name: "Veggie Taco Hash",
                      title: "Fresh and Healthy",
                      price: "\$25"),
                  SizedBox(
                    width: 15,
                  ),
                  food(
                      img: "images/salad2.png",
                      name: "Mix Veg Salad",
                      title: "spicy with Oninon",
                      price: "\$28"),
                ],
              ),
            ),
            SizedBox(
              height: 39,
            ),
            Container(
              margin: EdgeInsets.only(right: 20, ),
              child: Material(
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
                            width:  MediaQuery.of(context).size.width/2,
                              child: Text(
                            "Mediterranean Chispean Salad",
                            style: AppWidget.semiBoldTextFieldStyle(),
                          )),
                          SizedBox(height: 5,),
                          Container(
                            width:  MediaQuery.of(context).size.width/2,
                              child: Text(
                            "Honey goot cheese",
                            style: AppWidget.LightTextFieldStyle(),
                          )), SizedBox(height: 5,),
                          Container(
                            width:  MediaQuery.of(context).size.width/2,
                              child: Text(
                            "\$30",
                            style: AppWidget.semiBoldTextFieldStyle(),
                          )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            icercream = true;
            pizza = false;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: icercream ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  "images/ice-cream.png",
                  color: icercream ? Colors.white : Colors.black,
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                ),
              )),
        ),
        GestureDetector(
          onTap: () {
            icercream = false;
            pizza = true;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: pizza ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  "images/pizza.png",
                  color: pizza ? Colors.white : Colors.black,
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                ),
              )),
        ),
        GestureDetector(
          onTap: () {
            icercream = false;
            pizza = false;
            salad = true;
            burger = false;
            setState(() {});
          },
          child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: salad ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  "images/salad.png",
                  color: salad ? Colors.white : Colors.black,
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                ),
              )),
        ),
        GestureDetector(
          onTap: () {
            icercream = false;
            pizza = false;
            salad = false;
            burger = true;
            setState(() {});
          },
          child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: burger ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  "images/burger.png",
                  color: burger ? Colors.white : Colors.black,
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                ),
              )),
        ),
      ],
    );
  }

  Widget food({img, name, title, price}) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage(image: img, name: name, price: price, title: title,)));
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
                Text(
                  name,
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: AppWidget.LightTextFieldStyle(),
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
