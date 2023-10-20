import 'package:flutter/material.dart';
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

class ChoiceNewsMobile extends ConsumerStatefulWidget {
  const ChoiceNewsMobile({super.key});

  @override
  ConsumerState<ChoiceNewsMobile> createState() => _ChoiceNewsMobileState();
}

class _ChoiceNewsMobileState extends ConsumerState<ChoiceNewsMobile> with TickerProviderStateMixin{

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
        begin: const Offset(0.0,2.0),
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
    return GestureDetector(
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
          ).animate(CurvedAnimation(curve: Curves.bounceOut,parent: returnSlideAnimationController!));
          returnSlideAnimationController!.forward();
          Future.delayed(const Duration(milliseconds: 500), () {
            ref.watch(navigationStackProvider).push(const NavigationStackItem.scienceHome());
          });

        },
        child: const CommonButton()
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
            ref.watch(navigationStackProvider).pushRemove(const NavigationStackItem.scienceHome());
          }
          else
          {}
        },
        onVerticalDragUpdate: (details){
          int sensitivity = 8;
          if(details.delta.dy < -sensitivity)
          {
            ref.watch(navigationStackProvider).pushRemove(const NavigationStackItem.scienceHome());
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
                        padding: EdgeInsets.only(left: 60.w,right: 60.w,top: 188.h),
                        child: const CommonTextField(message: "What kind \n of news do \n you like?")
                    ),
                  ),
                )
            ),
            SizedBox(
                child: displayButton()
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
    super.dispose();
  }
}

