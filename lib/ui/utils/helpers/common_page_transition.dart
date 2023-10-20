import 'package:flutter/material.dart';

class CommonPageTransition extends StatefulWidget {

  final Widget child;
  const CommonPageTransition({super.key,required this.child});

  @override
  State<CommonPageTransition> createState() => _CommonPageTransitionState();
}

class _CommonPageTransitionState extends State<CommonPageTransition> with TickerProviderStateMixin{

  AnimationController? slidePageTransitionAnimationController;
  Animation<Offset>? slidePageAnimation;

  @override
  void initState() {
    super.initState();
    slidePageTransitionAnimationController=AnimationController(vsync: this,duration: const Duration(seconds: 1));
    slidePageAnimation=Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0)).animate(
        CurvedAnimation(
            parent: slidePageTransitionAnimationController!,
            curve: Curves.ease
        )
    );
    slidePageTransitionAnimationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: slidePageAnimation!,
        child: widget.child,
    );
  }

  @override
  void dispose() {
    slidePageTransitionAnimationController!.dispose();
    super.dispose();
  }

}
