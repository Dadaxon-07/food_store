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

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this); // `this` to'g'ri ishlashi kerak
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150,),
                ListTile(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  },
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {
                    UrlService.makePhoneCall("+998883800910");
                  },
                  leading: Icon(Icons.phone_callback_sharp),
                  title: Text('Phone Number'),
                ),
                ListTile(
                  onTap: () {
                    UrlService.launchInBrauther(Uri.parse("https://github.com/Alibek1101"));
                  },
                  leading: Icon(Icons.location_pin),
                  title: Text('Location'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        iconTheme: IconThemeData(color: Colors.white70),
        backgroundColor: Color.fromRGBO(102, 26, 189, 1.0),
        title: Row(children: [
          Text(
            'Oilaviy restoran',
            style: TextStyle(color: Colors.white70),
          ),
          Image.asset(
            "images/food_icon.png",
            height: 50,
            width: 50,
            fit: BoxFit.cover,
            color: Colors.white70,
          ),
          SizedBox(
            width: 50,
          ),
          Container(
            height: 35,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.white54, borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              "ru",
              style: TextStyle(color: Colors.white),
            )),
          )
        ]),
        bottom: TabBar(
          padding: EdgeInsets.only(top: 3),
          isScrollable: true,
          controller: _tabController,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(30), // Rounded corners
          ),
          labelColor: Colors.white, // Text color on selected tab
          labelStyle: TextStyle(fontSize: 17.5, fontFamily: "Poppins"),
          unselectedLabelColor: Colors.white54, // Text color on unselected tab

          tabs: [
            Tab(
              child: Row(
                children: [
                  Image.asset(
                    "images/salad.png",
                    height: 40,
                    width: 35,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 13),
                  Text('Saladlar'),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/suv.png",
                    height: 40,
                    width: 35,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10),
                  Text('Ichimliklar'),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/food.png",
                    height: 40,
                    width: 35,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 13),
                  Text('Taomlar'),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/sweet.png",
                    height: 40,
                    width: 35,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10),
                  Text('Shirinliklar'),
                ],
              ),
            ),
          ],
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
