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
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 52, 52, 52),
        child: Column(
          children: [
            // Header qismi
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[850],
              ),
              child: Row(
                children: [
                  Image.asset('images/foodmenu.png', height: 85, width: 85, fit: BoxFit.cover,),
                  const SizedBox(width: 16),
                  Text(
                    'Hush kelibsiz', // Foydalanuvchi nomi
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            ListTile(
              leading: Image.asset("images/menu.png", height: 40, width: 40 , fit: BoxFit.cover, color: Colors.white70,),
              title: Text(
                'Menu',
                style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },

            ),
            ListTile(
              leading: Image.asset("images/dostafka.png", height: 40, width: 40, fit: BoxFit.cover,),
              title: Text(
                'Dostavka 1',
                style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
              ),
              onTap: () {
                UrlService.makePhoneCall("+998889445000");
              },
            ),
            ListTile(
              leading: Image.asset("images/dostafka.png", height: 40, width: 40, fit: BoxFit.cover,),
              title: Text(
                'Dostavka 2',
                style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
              ),
              onTap: () {
                UrlService.makePhoneCall("+998889446000");
              },
            ),
            // Instagram
            ListTile(
              leading: Image.asset("images/insta.png", height: 40, width: 40, fit: BoxFit.cover,),
              title: Text(
                'Instagram',
                style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
              ),
              onTap: () {
                UrlService.launchInBrauther(
                    Uri.parse("https://www.instagram.com/qosimota1312/"));
              },
            ),

            // Telegram

          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Menu",
          style: TextStyle(color: Colors.white, fontFamily: "Poppins"),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 52, 52, 52),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // AppBar ostidagi hudud hajmi
          child: Column(
            children: [
              TabBar(
                padding: EdgeInsets.only(top: 10), // Tepadan bo'shliq
                isScrollable: true,
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
                labelStyle: TextStyle(fontSize: 17.5, fontFamily: "Poppins"),
                tabs: [
                  Tab(
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
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
                      margin: const EdgeInsets.only(
                        right: 16,
                      ),
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
                      margin: const EdgeInsets.only(right: 16),
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
                      margin: const EdgeInsets.only(right: 10),
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
