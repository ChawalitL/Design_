import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    //print(topPadding);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Show Different Colors
          colors: [
          Color.fromARGB(255, 58, 144, 255),
          Color.fromARGB(255, 203, 214, 221),
        ])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: topPadding,),
              SizedBox(height: 10,),
              Image.asset(
                "assets/air3.png",
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                )
            ],
          ),
        ),
      ),
    );
  }
}
