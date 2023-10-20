import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_onboarding/ui/routing/navigation_stack_item.dart';
import 'package:news_onboarding/ui/routing/stack.dart';
import 'package:news_onboarding/ui/utils/helpers/common_dislike_icon.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_image.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_name.dart';
import 'package:news_onboarding/ui/utils/helpers/common_like_icon.dart';
import 'package:news_onboarding/ui/utils/theme/app_colors.dart';
import 'package:news_onboarding/ui/utils/theme/assets_location.dart';

class TechHomeMobile extends ConsumerStatefulWidget {
  const TechHomeMobile({super.key});

  @override
  ConsumerState<TechHomeMobile> createState() => _TechHomeMobileState();
}

class _TechHomeMobileState extends ConsumerState<TechHomeMobile> with TickerProviderStateMixin{

  AnimationController? slideAnimationController;
  Animation<Offset>? slideOffsetAnimation;

  @override
  void initState() {
    super.initState();
    slideAnimationController= AnimationController(vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    slideOffsetAnimation = Tween<Offset>(
        begin: const Offset(0.0,2.0),
        end: Offset.zero
    ).animate(CurvedAnimation(curve: Curves.linear,parent: slideAnimationController!));
    slideAnimationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColor,
      body: SlideTransition(
        position: slideOffsetAnimation!,
        child: Column(
          children: [
            const CommonDomainImage(assetImage: AssetsLocation.technology),
            const CommonDomainName(domainName: "Technology",),
            Padding(
              padding: EdgeInsets.only(top: 94.h,left: 40.w,right: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        ref.watch(navigationStackProvider).pushRemoveUntil(const NavigationStackItem.businessHome(), const NavigationStackItem.intro());
                      },
                      child: const CommonDislikeIcon()
                  ),
                  GestureDetector(
                      onTap: (){
                        ref.watch(navigationStackProvider).push(const NavigationStackItem.techChoice());
                      },
                      child: const CommonLikeIcon()
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}