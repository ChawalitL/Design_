import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> with SingleTickerProviderStateMixin {
  late final AnimationController _controller1 = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  )..repeat();

  // --Offset เริ่มจากมุมของรูปภาพซ้ายบน (0 , 0)
  late final Animation<Offset> _animation1 = Tween(
          begin: const Offset(-0.4, 0.4), // มุมเริ่ม
          end: const Offset(0.1, 0) // มุมจบ
          )
      .animate(CurvedAnimation(parent: _controller1, curve: Curves.decelerate));

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SlideTransition(
          position: _animation1,
          child: Container(
            padding: const EdgeInsets.only(left: 210, top: 20),
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
