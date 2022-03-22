import 'package:flutter/material.dart';

class Test3 extends StatefulWidget {
  const Test3({Key? key}) : super(key: key);

  @override
  State<Test3> createState() => _Test3State();
}

class _Test3State extends State<Test3> with SingleTickerProviderStateMixin {
  late final AnimationController _controller1 = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  )..repeat();

  // --Offset เริ่มจากมุมของรูปภาพซ้ายบน (0 , 0)
  late final Animation<Offset> _animation1 = Tween(
          begin: const Offset(-0.3, 0), // มุมเริ่ม
          end: const Offset(0.15, -0.2) // มุมจบ
          )
      .animate(CurvedAnimation(parent: _controller1, curve: Curves.decelerate));

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SlideTransition(
          position: _animation1,
          child: Container(
            padding: const EdgeInsets.only(top: 150, left: 250),
            child: Image.asset(
              "assets/c1.png",
              width: 70,
              height: 70,
            ),
          ),
        ),
      ],
    );
  }
}
