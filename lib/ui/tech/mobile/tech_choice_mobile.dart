import 'package:flutter/material.dart';
import 'package:news_onboarding/framework/controller/tech/tech_controller.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_bottom_message.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_choice_message.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_choice_stack.dart';
import 'package:news_onboarding/ui/utils/theme/app_colors.dart';
import 'package:news_onboarding/ui/utils/theme/assets_location.dart';

class TechChoiceMobile extends StatefulWidget {
  const TechChoiceMobile({super.key});

  @override
  State<TechChoiceMobile> createState() => _TechChoiceMobileState();
}

class _TechChoiceMobileState extends State<TechChoiceMobile> with TickerProviderStateMixin{

  bool makeVisible=false;

  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(milliseconds: 3100),() {
      setState(() {
        makeVisible=true;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColor,
      body: Column(
        children: [
          const CommonDomainChoiceMessage(domainChoiceMessage: "There're some \n amazing things \n happening \n in tech"),
          Expanded(flex: 1,child: Container()),
          makeVisible ?
          CommonDomainChoiceStack(
            domainChoiceIcons: TechController.techDomainChoiceIcons,
            domainChoiceNames: TechController.techDomainChoiceNames,
            domainChoiceRedIcons: TechController.techDomainChoiceRedIcons,
          ) : const SizedBox(),
          Visibility(
            visible: makeVisible,
            child: const CommonDomainBottomMessage(),
          )
        ],
      ),
    );
  }
}

