import 'package:flutter/material.dart';

class HomeToRegister extends PageRouteBuilder {
  final child;

  HomeToRegister({required this.child})
      : super(
          transitionDuration: const Duration(milliseconds: 700),
          reverseTransitionDuration: const Duration(milliseconds: 700),
          pageBuilder: (context, animation, secandaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child);
}

class RegisterToHome extends PageRouteBuilder {
  final child;

  RegisterToHome({required this.child})
      : super(
          transitionDuration: const Duration(milliseconds: 700),
          reverseTransitionDuration: const Duration(milliseconds: 700),
          pageBuilder: (context, animation, secandaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child);
}
