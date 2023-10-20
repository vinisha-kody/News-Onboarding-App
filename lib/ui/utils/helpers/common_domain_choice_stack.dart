import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_onboarding/framework/controller/science/science_controller.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_choice_name.dart';
import 'package:news_onboarding/ui/utils/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonDomainChoiceStack extends ConsumerStatefulWidget{

  final List<String> domainChoiceIcons;
  final List<String> domainChoiceNames;
  final List<String> domainChoiceRedIcons;


  const CommonDomainChoiceStack({
    super.key,
    required this.domainChoiceIcons,
    required this.domainChoiceNames,
    required this.domainChoiceRedIcons
  });

  @override
  ConsumerState<CommonDomainChoiceStack> createState() => _CommonDomainChoiceStackState();
}

class _CommonDomainChoiceStackState extends ConsumerState<CommonDomainChoiceStack> with TickerProviderStateMixin{

  AnimationController? animationController;
  AnimationController? fadeAnimationControllerForStack;
  Animation<double>? fadeAnimationForStack;
  bool isChoiceSelected=false;
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
                                            ref.watch(scienceProvider).addIntoList("Somewhere,something \n incredible is waiting to \n be known","Carl Sagan");
                                          }
                                        else
                                        {
                                          Future.delayed(const Duration(milliseconds: 500),() => ref.watch(scienceProvider).deleteFromList());
                                        }
                                        ref.watch(scienceProvider).updateIcon1Value();
                                        ref.watch(scienceProvider).updateTopMessage("Somewhere,something \n incredible is waiting to \n be known","Carl Sagan");
                                        ref.watch(scienceProvider).updateCount();
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
                                            ref.watch(scienceProvider).addIntoList("The greatest threat to our \n planet is the belief that \n someone else will save it","Robert Swan");
                                          }
                                        else
                                          {
                                            Future.delayed(const Duration(milliseconds: 500),() => ref.watch(scienceProvider).deleteFromList());
                                          }
                                        ref.watch(scienceProvider).updateIcon2Value();
                                        ref.watch(scienceProvider).updateTopMessage("The greatest threat to our \n planet is the belief that \n someone else will save it","Robert Swan");
                                        ref.watch(scienceProvider).updateCount();
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
                                            ref.watch(scienceProvider).addIntoList("The laws of physics is \n the canvas God laid down on \n  which to paint his masterpiece","Dan Brown");
                                          }
                                        else
                                          {
                                            Future.delayed(const Duration(milliseconds: 500),() => ref.watch(scienceProvider).deleteFromList());
                                          }
                                        ref.watch(scienceProvider).updateIcon3Value();
                                        ref.watch(scienceProvider).updateTopMessage("The laws of physics is \n the canvas God laid down on \n  which to paint his masterpiece","Dan Brown");
                                        ref.watch(scienceProvider).updateCount();
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
                                            ref.watch(scienceProvider).addIntoList("I know the sky is not the limit \n  because there are footprints \n on the Moon!","Buzz Aldrin");
                                          }
                                        else
                                          {
                                            Future.delayed(const Duration(milliseconds: 500),() => ref.watch(scienceProvider).deleteFromList());
                                          }
                                        ref.watch(scienceProvider).updateIcon4Value();
                                        ref.watch(scienceProvider).updateTopMessage("I know the sky is not the limit \n  because there are footprints \n on the Moon!","Buzz Aldrin");
                                        ref.watch(scienceProvider).updateCount();
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
                                            ref.watch(scienceProvider).addIntoList("The real wealth of the Nation \n lies in the resources of the \n earth","Rachel Carson");                                          }
                                        else
                                          {
                                            Future.delayed(const Duration(milliseconds: 500),() => ref.watch(scienceProvider).deleteFromList());
                                          }
                                        ref.watch(scienceProvider).updateIcon5Value();
                                        ref.watch(scienceProvider).updateTopMessage("The real wealth of the Nation \n lies in the resources of the \n earth","Rachel Carson");
                                        ref.watch(scienceProvider).updateCount();
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
