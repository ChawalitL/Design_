import 'package:designscreen/Animation/c1.dart';
import 'package:designscreen/Animation/c2.dart';
import 'package:designscreen/Animation/c3.dart';
import 'package:flutter/material.dart';

class AirplaneAnimation extends StatefulWidget {
  const AirplaneAnimation({Key? key}) : super(key: key);

  @override
  State<AirplaneAnimation> createState() => _AirplaneAnimationState();
}

class _AirplaneAnimationState extends State<AirplaneAnimation>
    with SingleTickerProviderStateMixin {
  ///
  ///
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);

  // --Offset เริ่มจากมุมของรูปภาพซ้ายบน (0 , 0)
  late final Animation<Offset> _animation = Tween(
          begin: const Offset(0.2, 0.0), // มุมเริ่ม
          end: const Offset(-0.02, 0.09) // มุมจบ
          )
      .animate(_controller);


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(children: [
        const Test3(),
        const Test1(),
        const Test2(),
        SlideTransition(
          position: _animation,
          child: Image.asset("assets/air3.png",
              height: 250, width: 250, fit: BoxFit.cover),
        ),
      ]),
    );
  }
}
