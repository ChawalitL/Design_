// ignore_for_file: prefer_const_constructors

import 'package:designscreen/Animation/airplane.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final buttonLoginField = Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 224, 151, 151),
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width - 50,
          child: const Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          onPressed: () {},
        ));
    final buttonRegisField = Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 81, 152, 170),
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width - 50,
          child: const Text(
            'Register',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          onPressed: () {},
        ));

    final topPadding = MediaQuery.of(context).padding.top;
    double widthPadding = (MediaQuery.of(context).size.width - 50)/2;
    //print((widthPadding/10).floor());

    //print(topPadding);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // Show Different Colors
              colors: [
            Color.fromARGB(255, 58, 144, 255),
            Color.fromARGB(255, 203, 214, 221),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: topPadding,
              ),
              SizedBox(
                height: 10,
              ),
              AirplaneAnimation(),
              SizedBox(
                height: 30,
              ),
              Text(
                'Hi There!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Let's Get Started",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              buttonLoginField,
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('-'*(widthPadding/5).floor()),
                    Text('or',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('-'*(widthPadding/5).floor()),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              buttonRegisField,
            ],
          ),
        ),
      ),
    );
  }
}
