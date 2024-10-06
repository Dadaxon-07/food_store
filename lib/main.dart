import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_store/pages/Salad.dart';
import 'package:food_store/pages/home_page.dart';
import 'package:food_store/pages/onboard.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCR9RbRr9E0hr_HJhLSVa9I3PO98UDC6JY",
            authDomain: "fir-demo-22ede.firebaseapp.com",
            databaseURL: "https://fir-demo-22ede-default-rtdb.firebaseio.com",
            projectId: "fir-demo-22ede",
            storageBucket: "fir-demo-22ede.appspot.com",
            messagingSenderId: "1007714631616",
            appId: "1:1007714631616:web:4424f7138c866db73c9225"));
  }else {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyAXRub7Yj74HfyxoTAGAbxH-4J-uGOHyE4',
          appId: '1:670479317583:android:7157e030c553088ab7c83a',
          messagingSenderId: 'messagingSenderId',
          projectId: 'foodstore-c4511',
          storageBucket: 'foodstore-c4511.appspot.com',
        ));
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Onboard(),  routes: {
         HomePage.id:(context)=>HomePage()

    },);

  }
}
