import 'package:flutter/material.dart';

class BlinkAnimation extends StatefulWidget {
  final Color color;
  BlinkAnimation(this.color);

  @override
  _BlinkAnimationState createState() => _BlinkAnimationState();
}

class _BlinkAnimationState extends State<BlinkAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 170),
      vsync: this,
    );
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.linear);
    animation =
        ColorTween(begin: widget.color, end: Colors.white).animate(curve);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
      setState(() {});
    });
  }

  void animateFromNextSequence() {
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return GestureDetector(
            onTap: () {
              controller.forward();
            },
            child: Container(
              decoration: BoxDecoration(
                color: animation.value,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
