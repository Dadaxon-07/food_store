import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_store/pages/home_page.dart';
import 'package:food_store/pages/signup.dart';
import 'package:food_store/widget/widget_support.dart';

import '../service/auth_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void signInuser() {
    String email = _emailController.text.trim().toString();
    String password = _passwordController.text.trim().toString();

    AuthService.signInUser(email, password).then((value) =>{
      responsesignIn(value!)
    });
  }

  responsesignIn(User firebaseUser) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      return HomePage();
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Colors.red,
                    Color.fromRGBO(178, 15, 15, 1.0),
                  ])),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Text(""),
            ),
            Container(
              margin: EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Column(
                children: [
                  Center(
                      child: Image.asset(
                    "images/logo.png",
                    width: MediaQuery.of(context).size.width / 1.5,
                    fit: BoxFit.cover,
                  )),
                  SizedBox(
                    height: 50,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Login",
                            style: AppWidget.HeadlineTextFieldStyle(),
                          ),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                prefixIcon: Icon(Icons.email_outlined)),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                prefixIcon: Icon(Icons.password_outlined)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                "Forgot password",
                                style: AppWidget.semiBoldTextFieldStyle(),
                              )),
                          SizedBox(
                            height: 80,
                          ),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: InkWell(
                              onTap: signInuser,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Color(0xffff5722),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    "LOGIN",
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
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Text(
                      "Alread have an account? Sign Up",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
