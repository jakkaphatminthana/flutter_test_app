import 'package:flutter/material.dart';

class AnimationSimpleScreen extends StatefulWidget {
  const AnimationSimpleScreen({super.key});

  @override
  State<AnimationSimpleScreen> createState() => _AnimationSimpleScreenState();
}

class _AnimationSimpleScreenState extends State<AnimationSimpleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    // Defining controller with animation duration of two seconds
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Defining both color and size animations
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    sizeAnimation = Tween<double>(begin: 100.0, end: 200.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));

    // Rebuilding the screen when animation goes ahead
    animationController.addListener(() {
      setState(() {});
    });

    // animationController.repeat();
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  //=========================================================================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: Container(
          height: sizeAnimation.value,
          width: sizeAnimation.value,
          color: colorAnimation.value,
        ),
      ),
    );
  }
}
