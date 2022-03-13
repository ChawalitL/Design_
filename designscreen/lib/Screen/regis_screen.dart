// ignore_for_file: prefer_const_constructors

import 'package:designscreen/Animation/home_register.dart';
import 'package:designscreen/Screen/home.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //
  final _keyRegis = GlobalKey<FormState>();

  // Controller
  TextEditingController userRegisField = TextEditingController();
  TextEditingController nameRegisField = TextEditingController();
  TextEditingController passRegisField = TextEditingController();
  TextEditingController passConfirmRegisField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userField = TextFormField(
      controller: userRegisField,
      validator: (V) {
        if (V!.isEmpty) {
          return "Can't Empty And More than 5 character";
        }
        if (V.length < 5) {
          return 'More than 5 character';
        }
        return null;
      },
      onSaved: (V) {
        userRegisField.text = V!;
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
          hintText: 'Username',
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final nameField = TextFormField(
      controller: nameRegisField,
      validator: (V) {
        if (V!.isEmpty) {
          return "Can't Empty";
        }
        return null;
      },
      onSaved: (V) {
        nameRegisField.text = V!;
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
                Icons.abc,
                color: Color.fromARGB(255, 37, 15, 37),
              )),
          //labelText: "Username",
          hintText: 'Name',
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final passField = TextFormField(
      controller: passRegisField,
      validator: (V) {
        if (V!.isEmpty) {
          return "Can't Empty";
        }
        return null;
      },
      onSaved: (V) {
        passRegisField.text = V!;
      },
      obscureText: true,
      cursorColor: Color.fromARGB(255, 0, 68, 255),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20.0),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Padding(
              padding: EdgeInsets.only(left: 30, right: 25),
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.red,
              )),
          //labelText: "Username",
          hintText: 'Password',
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final passcomfirmField = TextFormField(
        controller: passConfirmRegisField,
        validator: (V) {
          if (V!.isEmpty) {
            return "Can't Empty";
          }
          else if (passRegisField.text != passConfirmRegisField.text) {
            return "Password Don't match";
          }
          return null;
        },
        onSaved: (V) {
          passConfirmRegisField.text = V!;
        },
        obscureText: true,
        cursorColor: Color.fromARGB(255, 0, 68, 255),
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 20.0),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Padding(
                padding: EdgeInsets.only(left: 30, right: 25),
                child: Icon(
                  Icons.keyboard_double_arrow_right,
                  color: Colors.red,
                )),
            //labelText: "Username",
            hintText: 'ConfirmPassword',
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(30))));

    final buttonRegisField = Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 51, 90, 199),
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: 100,
          child: const Text(
            'Register',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          onPressed: () {
            print(_keyRegis.currentState?.validate());
          },
        ));

    final buttonResetField = Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 255, 255, 255),
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: 60,
          child: const Text(
            'Reset',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromARGB(255, 255, 0, 0)),
          ),
          onPressed: () {
            userRegisField.clear();
            nameRegisField.clear();
            passRegisField.clear();
            passConfirmRegisField.clear();
          },
        ));

    final heightBox = MediaQuery.of(context).size.height;
    final heightPadding = MediaQuery.of(context).padding.top;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [
            Color.fromARGB(255, 58, 144, 255),
            Color.fromARGB(255, 203, 214, 221),
          ])),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 30,
            color: Color.fromARGB(255, 38, 0, 255),
            onPressed: () {
              Navigator.of(context).pop(RegisterToHome(child: HomeScreen));
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(30),
              child: Form(
                key: _keyRegis,
                child: Center(
                  child: ListView(
                    children: [Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Let's Register",
                          style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
                          ),
                        SizedBox(height: 25),
                        userField,
                        SizedBox(height: 15),
                        nameField,
                        SizedBox(height: 15),
                        passField,
                        SizedBox(height: 15),
                        passcomfirmField,
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buttonRegisField,
                            buttonResetField,
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
          ),
        ),
      ),
    );
  }
}
