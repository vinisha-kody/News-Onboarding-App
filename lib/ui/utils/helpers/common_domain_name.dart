import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_onboarding/ui/utils/theme/tex_styles.dart';

class CommonDomainName extends StatelessWidget {

  final String? domainName;

  const CommonDomainName({super.key,this.domainName});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 95.h,left: 40.w,right: 40.w),
        child: Text(domainName!,
          textAlign: TextAlign.center,
          style: TextStyles.bold.copyWith(
            color: Colors.white,
            fontFamily: TextStyles.fontFamily,
            fontSize: 40.sp,
          ),
        ),
    );
  }
}
