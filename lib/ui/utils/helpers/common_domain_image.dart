import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_onboarding/ui/utils/theme/assets_location.dart';

class CommonDomainImage extends StatelessWidget {

  final String? assetImage;

  const CommonDomainImage({super.key,this.assetImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 414.w,
      height: 560.h,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(assetImage!),
            fit: BoxFit.cover
        )
      ),
      //child: Image.asset(AssetsLocation.astronautes),
    );
  }
}