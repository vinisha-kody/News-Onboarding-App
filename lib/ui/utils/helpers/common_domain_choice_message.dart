import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_onboarding/framework/controller/science/science_controller.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_choice_top_message.dart';
import 'package:news_onboarding/ui/utils/theme/app_colors.dart';
import 'package:news_onboarding/ui/utils/theme/tex_styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonDomainChoiceMessage extends ConsumerStatefulWidget {

  final String domainChoiceMessage;

  const CommonDomainChoiceMessage({super.key,required this.domainChoiceMessage});

  @override
  ConsumerState<CommonDomainChoiceMessage> createState() => _CommonDomainChoiceMessageState();
}

class _CommonDomainChoiceMessageState extends ConsumerState<CommonDomainChoiceMessage> with TickerProviderStateMixin{

  Animation<Offset>? slideOffsetAnimation;
  AnimationController? slideAnimationController;
  Animation<double>? scaleAnimationForText;
  AnimationController? scaleAnimationControllerForText;
  Animation<double>? scaleAnimationForNoSelectedChoice;
  AnimationController? scaleAnimationControllerForNoSelectedChoice;

  @override
  void initState() {
    super.initState();
    slideAnimationController= AnimationController(vsync: this, duration: const Duration(milliseconds: 1500),);
    slideOffsetAnimation = Tween<Offset>(
        begin: const Offset(0.0,1.0),
        end: const Offset(0.0, 0.4)
    ).animate(CurvedAnimation(curve: Curves.fastOutSlowIn,parent: slideAnimationController!));

    scaleAnimationControllerForText=AnimationController(vsync: this,duration: const Duration(milliseconds: 1500));
    scaleAnimationForText=Tween<double>(begin: 1.0,end: 0.43).animate(CurvedAnimation(parent: scaleAnimationControllerForText!, curve: Curves.fastOutSlowIn));

    Future.delayed(const Duration(milliseconds: 1600),() {
      scaleAnimationControllerForText!.forward();
      slideAnimationController!.forward();
    });


    scaleAnimationControllerForNoSelectedChoice=AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    // scaleAnimationForText=Tween<double>(
    //     begin: 0 ,end: 1.19
    // ).animate(scaleAnimationControllerForText!);
    scaleAnimationForNoSelectedChoice=Tween<double>(
        begin: 0 ,end: 1.15
    ).animate(CurvedAnimation(curve: Curves.easeIn,parent: scaleAnimationControllerForNoSelectedChoice!));
    scaleAnimationControllerForNoSelectedChoice!.forward();
  }


  @override
  Widget build(BuildContext context) {
    return (ref.watch(scienceProvider).listIsEmpty)
        ?
    Padding(
      padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 60.h,bottom: 50.h),
      child: ScaleTransition(
        scale: scaleAnimationForNoSelectedChoice!,
        child: Text(
          "What areas of \n science do \n you like?",
          textAlign: TextAlign.center,
          style: TextStyles.bold.copyWith(
            fontSize: 16.sp,
            fontFamily: TextStyles.fontFamily,
            color: AppColors.white,
          ),
        ),
      ),
    )
      :
    Padding(
    //padding: EdgeInsets.only(top: 192.h,left: 20.w,right: 20.w),
          padding: EdgeInsets.only(left: 20.w,right: 20.w),
          child: SlideTransition(
            position: slideOffsetAnimation!,
            child: ScaleTransition(
              scale: scaleAnimationForText!,
              alignment: Alignment.topCenter,
              child: Text(
               widget.domainChoiceMessage,
               textAlign: TextAlign.center,
               style: TextStyles.bold.copyWith(
                 fontSize: 40.sp,
                 fontFamily: TextStyles.fontFamily,
                 color: AppColors.white,
               ),
             ),
           )
       ),
     );
  }

  @override
  void dispose() {
    scaleAnimationControllerForText!.dispose();
    slideAnimationController!.dispose();
    scaleAnimationControllerForNoSelectedChoice!.dispose();
    super.dispose();
  }
}
