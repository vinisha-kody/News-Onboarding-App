import 'package:flutter/material.dart';
import 'package:news_onboarding/ui/entertainment/mobile/entertainment_home_mobile.dart';
import 'package:news_onboarding/ui/health/mobile/health_home_mobile.dart';
import 'package:news_onboarding/ui/intro/mobile/intro_mobile.dart';
import 'package:news_onboarding/ui/science/mobile/science_home_mobile.dart';
import 'package:news_onboarding/ui/utils/helpers/base_widget.dart';
import 'package:news_onboarding/ui/utils/helpers/common_page_transition.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HealthHome extends StatelessWidget with BaseStatelessWidget{
  const HealthHome({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context)
      {
        return const HealthHomeMobile();
      },
    );
  }
}
