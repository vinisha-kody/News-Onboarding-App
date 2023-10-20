import 'package:flutter/material.dart';
import 'package:news_onboarding/framework/controller/health/health_controller.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_bottom_message.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_choice_message.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_choice_stack.dart';
import 'package:news_onboarding/ui/utils/theme/app_colors.dart';
import 'package:news_onboarding/ui/utils/theme/assets_location.dart';

class HealthChoiceMobile extends StatefulWidget {
  const HealthChoiceMobile({super.key});

  @override
  State<HealthChoiceMobile> createState() => _HealthChoiceMobileState();
}

class _HealthChoiceMobileState extends State<HealthChoiceMobile> with TickerProviderStateMixin{

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
          const CommonDomainChoiceMessage(domainChoiceMessage: "Which of \n these healthy \n options do \n ypu like?"),
          Expanded(flex: 1,child: Container()),
          makeVisible ?
          CommonDomainChoiceStack(
            domainChoiceIcons: HealthController.healthDomainChoiceIcons,
            domainChoiceNames: HealthController.healthDomainChoiceNames,
            domainChoiceRedIcons: HealthController.healthDomainChoiceRedIcons,
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
