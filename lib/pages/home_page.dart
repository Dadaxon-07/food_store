import 'package:flutter/material.dart';
import 'package:food_store/pages/Salad.dart';

import 'details_page.dart';

class HomePage extends StatefulWidget {
  static final String id = "Home";
  @override
  _ModernTabBarState createState() => _ModernTabBarState();
}

class _ModernTabBarState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // `this` to'g'ri ishlashi kerak
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(backgroundColor: Colors.white54,),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        iconTheme: IconThemeData(color: Colors.white70),
        backgroundColor: Color.fromRGBO(36, 36, 47, 1.0),
        title: Text('Oilaviy restaran', style: TextStyle(color: Colors.white70),),
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
                 Image.asset("images/salad.png",  height: 40, width: 35, fit: BoxFit.cover,),
                  SizedBox(width: 13),
                  Text('Saladlar'),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/suv.png", height: 40, width: 35, fit: BoxFit.cover,),
                  SizedBox(width: 10),
                  Text('Ichimliklar'),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/food.png", height: 40, width: 35, fit: BoxFit.cover,),
                  SizedBox(width: 13),
                  Text('Taomlar'),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/sweet.png", height: 40, width: 35, fit: BoxFit.cover,),
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
        children: [
         Salad(),
          Center(child: Text('Explore Tab')),
          Center(child: Text('Explore Tab')),
          Salad(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailsPage();
          }));
        },
        child: Icon(
          Icons.add_outlined,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
