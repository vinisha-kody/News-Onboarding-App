import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_onboarding/framework/controller/science/science_controller.dart';
import 'package:news_onboarding/ui/routing/navigation_stack_item.dart';
import 'package:news_onboarding/ui/routing/stack.dart';
import 'package:news_onboarding/ui/utils/theme/app_colors.dart';
import 'package:news_onboarding/ui/utils/theme/tex_styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonButton extends ConsumerStatefulWidget {
  const CommonButton({super.key});

  @override
  ConsumerState<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends ConsumerState<CommonButton> with TickerProviderStateMixin{

  AnimationController? slideAnimationController;
  Animation<Offset>? slideOffsetAnimation;

  void activeAnimation(){
    slideAnimationController= AnimationController(vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    slideAnimationController!.forward();
    slideOffsetAnimation = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(0.0,2.0)
    ).animate(CurvedAnimation(curve: Curves.bounceIn,parent: slideAnimationController!));
  }


  @override
  Widget build(BuildContext context) {

    final scienceProviderObject = ref.watch(scienceProvider);

    return Padding(
      padding: EdgeInsets.only(bottom: 56.h),
      child: Container(
        width: 172.w,
        height: 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(color: AppColors.white.withOpacity(0.5),width: 0.5)
        ),
        child: Center(
          child: Text(
            ((scienceProviderObject.isIcon1ColorRed) ||
                (scienceProviderObject.isIcon2ColorRed) ||
                (scienceProviderObject.isIcon3ColorRed) ||
                (scienceProviderObject.isIcon4ColorRed) ||
                (scienceProviderObject.isIcon5ColorRed)) ? "I'm Done" : "Next",
            style: TextStyles.semiBold.copyWith(
              color: AppColors.white,
              fontSize: 23.sp,
              fontFamily: TextStyles.fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}

