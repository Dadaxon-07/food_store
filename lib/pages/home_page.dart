import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_store/pages/Ichimliklar.dart';
import 'package:food_store/pages/Salad.dart';
import 'package:food_store/pages/Shirinliklar.dart';
import 'package:food_store/pages/taom.dart';
import 'package:food_store/pages/url_service.dart';

class HomePage extends StatefulWidget {
  static final String id = "Home";
  @override
  _ModernTabBarState createState() => _ModernTabBarState();
}

class _ModernTabBarState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this); // `this` to'g'ri ishlashi kerak
    isSelected = isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 52, 52, 52),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: TabBar(
            padding: EdgeInsets.only(bottom: 10),
            isScrollable: true,
            controller: _tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Rounded corners
            ),
            // Text color on selected tab
            labelStyle: TextStyle(fontSize: 17.5, fontFamily: "Poppins"),
            // Text color on unselected tab
            tabs: [
              Tab(
                child: Container(
                  margin: const EdgeInsets.only(right: 16, left: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    color: Color.fromARGB(255, 52, 52, 52),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      isSelected
                          ? CircleAvatar(
                              child: Image.asset(
                                "images/salad.png",
                                width: 33,
                                height: 33,
                              ),
                              foregroundColor: Colors.red,
                              minRadius: 20,
                              maxRadius: 24,
                              backgroundColor: Colors.white,
                            )
                          : Image.asset(
                              "images/salad.png",
                              width: 36,
                              height: 36,
                              fit: BoxFit.cover,
                            ),
                      const SizedBox(width: 8),
                      Text(
                        "Salad",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  margin: const EdgeInsets.only(right: 16, left: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    color: Color.fromARGB(255, 52, 52, 52),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      isSelected
                          ? CircleAvatar(
                              child: Image.asset(
                                "images/suv.png",
                                width: 33,
                                height: 33,
                              ),
                              foregroundColor: Colors.red,
                              minRadius: 20,
                              maxRadius: 24,
                              backgroundColor: Colors.white,
                            )
                          : Image.asset(
                              "images/suv.png",
                              width: 36,
                              height: 36,
                              fit: BoxFit.cover,
                            ),
                      const SizedBox(width: 8),
                      Text(
                        "Ichimlik",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  margin: const EdgeInsets.only(right: 16, left: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    color: Color.fromARGB(255, 52, 52, 52),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      isSelected
                          ? CircleAvatar(
                              child: Image.asset(
                                "images/food.png",
                                width: 33,
                                height: 33,
                              ),
                              foregroundColor: Colors.red,
                              minRadius: 20,
                              maxRadius: 24,
                              backgroundColor: Colors.white,
                            )
                          : Image.asset(
                              "images/food.png",
                              width: 36,
                              height: 36,
                              fit: BoxFit.cover,
                            ),
                      const SizedBox(width: 8),
                      Text(
                        "Taom",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  margin: const EdgeInsets.only(right: 16, left: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    color: Color.fromARGB(255, 52, 52, 52),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      isSelected
                          ? CircleAvatar(
                              child: Image.asset(
                                "images/sweet.png",
                                width: 33,
                                height: 33,
                              ),
                              foregroundColor: Colors.red,
                              minRadius: 20,
                              maxRadius: 24,
                              backgroundColor: Colors.white,
                            )
                          : Image.asset(
                              "images/sweet.png",
                              width: 36,
                              height: 36,
                              fit: BoxFit.cover,
                            ),
                      const SizedBox(width: 8),
                      Text(
                        "Shirinlik",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [Salad(), Ichimliklar(), Taom(), Shirinliklar()],
      ),

    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
