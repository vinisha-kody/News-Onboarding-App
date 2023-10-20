import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_onboarding/ui/intro/choice_news.dart';
import 'package:news_onboarding/ui/intro/mobile/intro_mobile.dart';
import 'package:news_onboarding/ui/utils/helpers/base_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Intro extends StatelessWidget with BaseStatelessWidget{
  const Intro({super.key});

  @override
  Widget buildPage(BuildContext context) {
    final PageController pageController=PageController();
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context)
      {
        return const IntroMobilePage();
      },
    );
  }
}
