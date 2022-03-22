// ignore_for_file: prefer_const_constructors

import 'package:designscreen/Animation/airplane.dart';
import 'package:designscreen/Animation/home_register.dart';
import 'package:designscreen/Screen/regis_screen.dart';
import 'package:designscreen/Screen/welcome_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Key Form
  final _key = GlobalKey<FormState>();

  // Controller
  TextEditingController userForm = TextEditingController();
  TextEditingController passForm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //  Field
    final userField = TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Your Username OR More than 6 Character';
        } else if (value.length <= 5) {
          return 'More than 6 Character';
        }
        return null;
      },
      onSaved: (V) {
        userForm.text = V!;
      },
      cursorColor: Color.fromARGB(255, 0, 68, 255),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20.0),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Padding(
              padding: EdgeInsets.only(left: 30, right: 25),
              child: Icon(
                Icons.person,
                color: Colors.blue,
              )),
          //labelText: "Username",
          hintText: 'Username',
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final passField = TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Your Password';
        } else if (value.length <= 4) {
          return 'More than 4 character';
        }
        return null;
      },
      onSaved: (V) {
        passForm.text = V!;
      },
      cursorColor: Colors.red,
      textInputAction: TextInputAction.done,
      obscureText: true,
      decoration: InputDecoration(
          //helperText: ,
          contentPadding: EdgeInsets.symmetric(vertical: 20.0),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 30, right: 25),
            child: Icon(Icons.keyboard_double_arrow_right_outlined,
                color: Colors.red),
          ),
          //labelText: "Password",
          hintText: 'Password',
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final buttonLoginField = Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 51, 90, 199),
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width - 50,
          child: const Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          onPressed: () {
            print(_key.currentState!.validate());
            Navigator.of(context)
                .pushReplacement(RegisterToHome(child: WelcomeScreen()));
          },
        ));

    final buttonRegisField = Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 0, 102, 255),
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width - 50,
          child: const Text(
            'Register',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(HomeToRegister(child: RegisterScreen()))
                .then((value) => _key.currentState!.reset());
          },
        ));

    final topPadding = MediaQuery.of(context).padding.top;
    double widthPadding = (MediaQuery.of(context).size.width - 50) / 2;
    final maxQuery = MediaQuery.of(context).size; //(X,Y)
    print(maxQuery);
    //print((widthPadding/10).floor());

    //print(topPadding);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // Show Different Colors
              colors: const [
            Color.fromARGB(255, 58, 144, 255),
            Color.fromARGB(255, 203, 214, 221),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: topPadding,
                ),
                SizedBox(height: 10),
                AirplaneAnimation(),
                SizedBox(height: 20),
                Text(
                  'Hi Everyone !',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Let's Get Started",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width - 50,
                          child: userField),
                      SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 50,
                        child: passField,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                buttonLoginField,
                SizedBox(height: 10),
                SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width - 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('-' * (widthPadding / 5).floor()),
                      Text(
                        'OR',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('-' * (widthPadding / 5).floor()),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                buttonRegisField,
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
