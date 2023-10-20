import 'package:flutter/material.dart';
import 'package:news_onboarding/ui/intro/mobile/choice_news_mobile.dart';
import 'package:news_onboarding/ui/utils/helpers/base_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ChoiceNews extends StatelessWidget with BaseStatelessWidget{
  const ChoiceNews({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context)
      {
        return const ChoiceNewsMobile();
      },
    );
  }
}
