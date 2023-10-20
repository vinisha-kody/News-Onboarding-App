import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_onboarding/framework/controller/science/science_controller.dart';
import 'package:news_onboarding/ui/utils/theme/app_colors.dart';
import 'package:news_onboarding/ui/utils/theme/tex_styles.dart';

class CommonDomainChoiceTopMessage extends StatefulWidget {
  final String domainChoiceTopMessage;
  final String writerName;
  const CommonDomainChoiceTopMessage({super.key,required this.domainChoiceTopMessage,required this.writerName});

  @override
  State<CommonDomainChoiceTopMessage> createState() => _CommonDomainChoiceTopMessageState();
}

class _CommonDomainChoiceTopMessageState extends State<CommonDomainChoiceTopMessage> with TickerProviderStateMixin{

  Animation<double>? scaleAnimationForText;
  AnimationController? scaleAnimationControllerForText;


  @override
  void initState() {
    super.initState();
    scaleAnimationControllerForText=AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    scaleAnimationForText=Tween<double>(
        begin: 0 ,end: 1.19
    ).animate(CurvedAnimation(curve: Curves.easeIn,parent: scaleAnimationControllerForText!));
  }

  void repeatAnimation() async
  {
    await scaleAnimationControllerForText!.reverse();
    print("Scale Reverse Repeat");
    await scaleAnimationControllerForText!.forward();
    print("Scale Forward Repeat");
  }

  void startAnimation() async
  {
    await scaleAnimationControllerForText!.forward();
    print("start");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 60.h,bottom: 30.h),
          child: Consumer(
            builder: (context,ref,child)
            {
              if(ref.watch(scienceProvider).count == 1)
              {
                Future.delayed(const Duration(milliseconds: 500),() => startAnimation());
              }
              else
                {
                  if(ref.watch(scienceProvider).listIsEmpty)
                    {
                      Future.delayed(const Duration(milliseconds: 500),() => startAnimation());
                      repeatAnimation();
                    }
                  else
                    {
                      repeatAnimation();
                    }
                }
              return
                ScaleTransition(
                scale: scaleAnimationForText!,
                alignment: Alignment.topCenter,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.domainChoiceTopMessage,
                          style: TextStyles.bold.copyWith(
                            fontSize: 16.sp,
                            fontFamily: TextStyles.fontFamily,
                            color: AppColors.red,
                          ),
                        ),
                        TextSpan(
                            text: widget.writerName,
                            style: TextStyles.bold.copyWith(
                                fontFamily: TextStyles.fontFamily,
                                fontSize: 15.sp,
                                color: Colors.white.withOpacity(0.5)
                            )
                        )
                      ]
                  ),
                ),
              );
            }
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    scaleAnimationControllerForText!.dispose();
    super.dispose();
  }

}
