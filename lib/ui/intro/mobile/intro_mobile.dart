import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_onboarding/framework/dependency_injection/inject.dart';
import 'package:news_onboarding/ui/intro/choice_news.dart';
import 'package:news_onboarding/ui/intro/helper/common_text_field.dart';
import 'package:news_onboarding/ui/routing/delegate.dart';
import 'package:news_onboarding/ui/routing/navigation_stack_item.dart';
import 'package:news_onboarding/ui/routing/parser.dart';
import 'package:news_onboarding/ui/routing/stack.dart';
import 'package:news_onboarding/ui/utils/helpers/common_button.dart';
import 'package:news_onboarding/ui/utils/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntroMobilePage extends ConsumerStatefulWidget {
  const IntroMobilePage({super.key});

  @override
  ConsumerState<IntroMobilePage> createState() => _IntroMobilePageState();
}

class _IntroMobilePageState extends ConsumerState<IntroMobilePage> with TickerProviderStateMixin{

  AnimationController? slideAnimationController;
  AnimationController? returnSlideAnimationController;
  AnimationController? fadeAnimationController;
  AnimationController? returnFadeAnimationController;
  AnimationController? fadeAnimationControllerForButton;
  Animation<double>? fadeAnimationForButton;
  Animation<Offset>? slideOffsetAnimation;
  Animation<Offset>? returnSlideOffsetAnimation;
  Animation<double>? fadeAnimation;
  Animation<double>? returnFadeAnimation;
  bool toDisplay=false;
  bool onClick=false;


  @override
  void initState() {
    super.initState();
    slideAnimationController= AnimationController(vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    slideAnimationController!.forward();
    fadeAnimationController=AnimationController(vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    fadeAnimation=CurvedAnimation(
        parent: fadeAnimationController!,
        curve: Curves.easeIn
    );
    fadeAnimationController!.forward();
    fadeAnimationControllerForButton=AnimationController(vsync: this,
      duration: const Duration(seconds: 4),
    );
    fadeAnimationForButton=CurvedAnimation(
        parent: fadeAnimationControllerForButton!,
        curve: Curves.easeIn
    );
    fadeAnimationControllerForButton!.forward();
    slideOffsetAnimation = Tween<Offset>(
      begin: const Offset(0.0,1.5),
      end: Offset.zero
    ).animate(CurvedAnimation(curve: Curves.bounceIn,parent: slideAnimationController!));
    Future.delayed(const Duration(milliseconds: 2500),(){
      setState(() {
        toDisplay=true;
      });
    });
  }

  Widget displayButton()
  {
    return FadeTransition(
      opacity: fadeAnimationForButton!,
      child: GestureDetector(
        onTap: (){
          setState(() {
            onClick=true;
          });
          returnSlideAnimationController = AnimationController(vsync: this,
            duration: const Duration(milliseconds: 2000),
          );
          returnSlideOffsetAnimation = Tween<Offset>(
            begin: Offset.zero,
              end: const Offset(0,-1)
              // begin: const Offset(0.0,2.0),
              // end: Offset.zero
          ).animate(CurvedAnimation(curve: Curves.bounceOut,parent: returnSlideAnimationController!));
          returnSlideAnimationController!.forward();
          returnFadeAnimationController=AnimationController(vsync: this,
            duration: const Duration(milliseconds: 2000),
          );
          returnFadeAnimation=Tween<double>(
            begin: 0.0,
            end: 1.0
          ).animate(CurvedAnimation(
              parent: returnFadeAnimationController!,
              curve: Curves.ease
          ));
          returnFadeAnimationController!.forward();
          Future.delayed(const Duration(milliseconds: 500),(){
            ref.watch(navigationStackProvider).pushAndRemoveAll(const NavigationStackItem.choiceNews());
          });
        },
          child: const CommonButton()
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppColors.appColor,
      body: GestureDetector(
        onHorizontalDragUpdate: (details){
          int sensitivity = 8;
          if(details.delta.dx < -sensitivity)
          {
            ref.watch(navigationStackProvider).pushAndRemoveAll(const NavigationStackItem.choiceNews());
          }
          else
          {}
        },
        onVerticalDragUpdate: (details){
          int sensitivity = 8;
          if(details.delta.dy < -sensitivity)
          {
            ref.watch(navigationStackProvider).pushAndRemoveAll(const NavigationStackItem.choiceNews());
          }
        },
        child: Column(
          children: [
            Expanded(
              child: FadeTransition(
                opacity: fadeAnimation!,
                child: SlideTransition(
                      position: onClick ? returnSlideOffsetAnimation! : slideOffsetAnimation!,
                      child: Padding(
                          padding: EdgeInsets.only(left: 40.w,right: 40.w,top: 188.h),
                          child: const CommonTextField(message: "Let’s get you \n set up on \n news")
                      ),
                    ),
              )
            ),
            SizedBox(
              child: toDisplay ? displayButton() : null
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    slideAnimationController!.dispose();
    fadeAnimationController!.dispose();
    fadeAnimationControllerForButton!.dispose();
    returnSlideAnimationController!.dispose();
    returnFadeAnimationController!.dispose();
    super.dispose();
  }
}

