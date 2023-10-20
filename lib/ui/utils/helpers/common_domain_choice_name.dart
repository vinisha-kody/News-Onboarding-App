import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_onboarding/ui/utils/theme/app_colors.dart';
import 'package:news_onboarding/ui/utils/theme/tex_styles.dart';

class CommonDomainChoiceName extends StatefulWidget {

  final String domainChoiceName;
  final Color textColor;

  const CommonDomainChoiceName({super.key,required this.domainChoiceName,required this.textColor});

  @override
  State<CommonDomainChoiceName> createState() => _CommonDomainChoiceNameState();
}

class _CommonDomainChoiceNameState extends State<CommonDomainChoiceName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      child: Center(
        child: Text(widget.domainChoiceName,
          textAlign: TextAlign.center,
          style: TextStyles.regular.copyWith(fontSize: 20.sp,color: widget.textColor,fontFamily: TextStyles.fontFamily),
        ),
      ),
    );
  }
}
