import 'package:flutter/material.dart';
import 'package:news_onboarding/ui/intro/mobile/intro_mobile.dart';
import 'package:news_onboarding/ui/science/mobile/science_choice_mobile.dart';
import 'package:news_onboarding/ui/utils/helpers/base_widget.dart';
import 'package:news_onboarding/ui/utils/helpers/common_page_transition.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScienceChoice extends StatelessWidget with BaseStatelessWidget{
  const ScienceChoice({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context)
      {
        return const CommonPageTransition(child: ScienceChoiceMobile());
      },
    );
  }
}
