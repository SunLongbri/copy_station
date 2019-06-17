import 'package:flutter/material.dart';

class AnimationContainer extends StatefulWidget {
  final Widget child;

  AnimationContainer({this.child});

  @override
  _AnimationContainerState createState() => _AnimationContainerState();
}

class _AnimationContainerState extends State<AnimationContainer>  with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0, end: 200).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Container(
                color: Colors.red,
                height: 100,
                width: animation.value,
                child: child,
              ),
          child: widget.child,
        ),
      );
}
