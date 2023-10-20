import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_onboarding/framework/controller/buisness/business_controller.dart';
import 'package:news_onboarding/framework/controller/science/science_controller.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_choice_name.dart';
import 'package:news_onboarding/ui/utils/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BusinessChoiceStack extends ConsumerStatefulWidget{

  final List<String> domainChoiceIcons;
  final List<String> domainChoiceNames;
  final List<String> domainChoiceRedIcons;


  const BusinessChoiceStack({
    super.key,
    required this.domainChoiceIcons,
    required this.domainChoiceNames,
    required this.domainChoiceRedIcons
  });

  @override
  ConsumerState<BusinessChoiceStack> createState() => _BusinessChoiceStackState();
}

class _BusinessChoiceStackState extends ConsumerState<BusinessChoiceStack> with TickerProviderStateMixin{

  AnimationController? animationController;
  AnimationController? fadeAnimationControllerForStack;
  Animation<double>? fadeAnimationForStack;
  bool isIcon1Selected=false;
  bool isIcon2Selected=false;
  bool isIcon3Selected=false;
  bool isIcon4Selected=false;
  bool isIcon5Selected=false;
  bool isIconClicked=false;

  @override
  void initState() {
    super.initState();
    animationController=AnimationController(vsync: this,duration: const Duration(seconds: 5));

    fadeAnimationControllerForStack=AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    fadeAnimationForStack=CurvedAnimation(parent: fadeAnimationControllerForStack!, curve: Curves.easeIn);
    Future.delayed(const Duration(milliseconds: 100),(){
      fadeAnimationControllerForStack!.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final businessProviderObject=ref.watch(businessProvider);
    return Flexible(
        flex: 10,
        fit: FlexFit.tight,
        child: AnimatedBuilder(
            animation: animationController!,
            builder: (context,child){
              return FadeTransition(
                opacity: fadeAnimationForStack!,
                child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints)
                    {
                      return Container(
                        color: AppColors.appColor,
                        child: Stack(
                          children: [
                            Positioned(
                                top: (constraints.maxHeight/99).h,
                                left: (constraints.maxWidth/3.2).w,
                                child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        isIcon1Selected=!isIcon1Selected;
                                      });
                                      if(isIcon1Selected == true)
                                      {
                                        businessProviderObject.addIntoList("There can be economy \n only where there is \n efficiency","Benjamin Disraeli");
                                      }
                                      else
                                      {
                                        Future.delayed(const Duration(milliseconds: 500),() => businessProviderObject.deleteFromList());
                                      }
                                      businessProviderObject.updateIcon1Value();
                                      businessProviderObject.updateCount();
                                    },
                                    child: isIcon1Selected ? Image.asset(widget.domainChoiceRedIcons.elementAt(0),width: 55.w,height: 55.w,) : Image.asset(widget.domainChoiceIcons.elementAt(0),width: 55.w,height: 55.w,)
                                )
                            ),
                            Positioned(
                                top: (constraints.maxHeight/7.5).h,
                                left: (constraints.maxWidth/5.5).w,
                                child: CommonDomainChoiceName(domainChoiceName: widget.domainChoiceNames.elementAt(0),textColor: isIcon1Selected ? AppColors.red : AppColors.white,)
                            ),
                            Positioned(
                                top: (constraints.maxHeight/9).h,
                                left: (constraints.maxWidth/1.45).w,
                                child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        isIcon2Selected=!isIcon2Selected;
                                      });
                                      if(isIcon2Selected == true)
                                      {
                                        businessProviderObject.addIntoList("The entrepreneur always \n searches for it, and exploits it \n as an opportunity","Peter Drucker");
                                      }
                                      else
                                      {
                                        Future.delayed(const Duration(milliseconds: 500),() => businessProviderObject.deleteFromList());
                                      }
                                      businessProviderObject.updateIcon2Value();
                                      businessProviderObject.updateCount();
                                    },
                                    child: isIcon2Selected ? Image.asset(widget.domainChoiceRedIcons.elementAt(1),width: 55.w,height: 55.w,) : Image.asset(widget.domainChoiceIcons.elementAt(1),width: 55.w,height: 55.w,)
                                )

                            ),
                            Positioned(
                                top: (constraints.maxHeight/4.2).h,
                                left: (constraints.maxWidth/1.8).w,
                                child: CommonDomainChoiceName(domainChoiceName: widget.domainChoiceNames.elementAt(1),textColor: isIcon2Selected ? AppColors.red : AppColors.white)
                            ),
                            Positioned(
                                top: (constraints.maxHeight/3.3).h,
                                left: (constraints.maxWidth/6.46).w,
                                child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        isIcon3Selected=!isIcon3Selected;
                                      });
                                      if(isIcon3Selected == true)
                                      {
                                        businessProviderObject.addIntoList("Choose a job you love, and \n  you will never have to work a day \n in your life","Milton Berle");
                                      }
                                      else
                                      {
                                        Future.delayed(const Duration(milliseconds: 500),() => businessProviderObject.deleteFromList());
                                      }
                                      businessProviderObject.updateIcon3Value();
                                      businessProviderObject.updateCount();
                                    },
                                    child: isIcon3Selected ? Image.asset(widget.domainChoiceRedIcons.elementAt(2),width: 55.w,height: 55.w,) : Image.asset(widget.domainChoiceIcons.elementAt(2),width: 55.w,height: 55.w,)
                                )

                            ),
                            Positioned(
                                top: (constraints.maxHeight/2.35).h,
                                left: (constraints.maxWidth/27).w,
                                child: CommonDomainChoiceName(domainChoiceName: widget.domainChoiceNames.elementAt(2),textColor: isIcon3Selected ? AppColors.red : AppColors.white)
                            ),
                            Positioned(
                                top: (constraints.maxHeight/2.5).h,
                                left: (constraints.maxWidth/1.59).w,
                                child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        isIcon4Selected=!isIcon4Selected;
                                      });
                                      if(isIcon4Selected == true)
                                      {
                                        businessProviderObject.addIntoList("Stopping advertising to save \n money is like stopping your watch \n to save time","Henry Ford");
                                      }
                                      else
                                      {
                                        Future.delayed(const Duration(milliseconds: 500),() => businessProviderObject.deleteFromList());
                                      }
                                      businessProviderObject.updateIcon4Value();
                                      businessProviderObject.updateCount();
                                    },
                                    child: isIcon4Selected ? Image.asset(widget.domainChoiceRedIcons.elementAt(3),width: 55.w,height: 55.w,) : Image.asset(widget.domainChoiceIcons.elementAt(3),width: 55.w,height: 55.w,)
                                )

                            ),
                            Positioned(
                                top: (constraints.maxHeight/1.9).h,
                                left: (constraints.maxWidth/1.95).w,
                                child: CommonDomainChoiceName(domainChoiceName: widget.domainChoiceNames.elementAt(3),textColor: isIcon4Selected ? AppColors.red : AppColors.white)
                            ),
                            Positioned(
                                top: (constraints.maxHeight/1.75).h,
                                left: (constraints.maxWidth/3).w,
                                child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        isIcon5Selected=!isIcon5Selected;
                                      });
                                      if(isIcon5Selected == true)
                                      {
                                        businessProviderObject.addIntoList("It's not about having lots \n of money, it's knowing how to \n manage it","Benjamin Franklin");
                                      }
                                      else
                                      {
                                        Future.delayed(const Duration(milliseconds: 500),() => businessProviderObject.deleteFromList());
                                      }
                                      businessProviderObject.updateIcon5Value();
                                      businessProviderObject.updateCount();
                                    },
                                    child: isIcon5Selected ? Image.asset(widget.domainChoiceRedIcons.elementAt(4),width: 55.w,height: 55.w,) : Image.asset(widget.domainChoiceIcons.elementAt(4),width: 55.w,height: 55.w,)
                                )

                            ),
                            Positioned(
                                top: (constraints.maxHeight/1.43).h,
                                left: (constraints.maxWidth/5).w,
                                child: CommonDomainChoiceName(domainChoiceName: widget.domainChoiceNames.elementAt(4),textColor: isIcon5Selected ? AppColors.red : AppColors.white)
                            ),
                          ],
                        ),
                      );
                    }
                ),
              );
            }
        )
    );
  }

  @override
  void dispose() {
    fadeAnimationControllerForStack!.dispose();
    animationController!.dispose();
    super.dispose();
  }
}
