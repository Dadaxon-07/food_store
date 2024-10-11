import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_store/pages/home_page.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCBm8QMsXtpKV40md2PDnRO7y579xQKHoc",
            authDomain: "foodstore-c4511.firebaseapp.com",
            databaseURL: "https://foodstore-c4511-default-rtdb.firebaseio.com",
            projectId: "foodstore-c4511",
            storageBucket: "foodstore-c4511.appspot.com",
            messagingSenderId: "670479317583",
            appId: "1:670479317583:web:d3e0b27905455976b7c83a",
            measurementId: "G-HGEV4LNRE3"));
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
        home: HomePage(),  routes: {
         HomePage.id:(context)=>HomePage()

    },);

  }
}
