import 'package:flutter/material.dart';
import 'package:news_onboarding/ui/entertainment/mobile/entertainment_choice_mobile.dart';
import 'package:news_onboarding/ui/utils/helpers/base_widget.dart';
import 'package:news_onboarding/ui/utils/helpers/common_page_transition.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EntertainmentChoice extends StatelessWidget with BaseStatelessWidget{
  const EntertainmentChoice({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context)
      {
        return const CommonPageTransition(child: EntertainmentChoiceMobile());
      },
    );
  }
}
