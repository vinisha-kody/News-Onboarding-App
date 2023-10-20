import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final introProvider = ChangeNotifierProvider<IntroController>((ref) => IntroController());

class IntroController extends ChangeNotifier
{

  // AnimationController? slideAnimationControllerForText;
  // Animation<Offset>? slideOffsetAnimation;
  //
  // void activeSlideAnimationForText()
  // {
  //   slideAnimationControllerForText= AnimationController(vsync: this,
  //     duration: const Duration(milliseconds: 2000),
  //   );
  // }

}