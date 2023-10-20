import 'package:flutter/material.dart';
import 'package:news_onboarding/framework/controller/science/science_controller.dart';
import 'package:news_onboarding/ui/science/helper/science_choice_stack.dart';
import 'package:news_onboarding/ui/utils/helpers/common_button.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_bottom_message.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_choice_message.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_choice_stack.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_choice_top_message.dart';
import 'package:news_onboarding/ui/utils/theme/app_colors.dart';
import 'package:news_onboarding/ui/utils/theme/assets_location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScienceChoiceMobile extends ConsumerStatefulWidget {
  const ScienceChoiceMobile({super.key});

  @override
  ConsumerState<ScienceChoiceMobile> createState() => _ScienceChoiceMobileState();
}

class _ScienceChoiceMobileState extends ConsumerState<ScienceChoiceMobile> with TickerProviderStateMixin{

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
  Widget build(BuildContext context){
    final scienceProviderObject=ref.watch(scienceProvider);
    return Scaffold(
      backgroundColor: AppColors.appColor,
      body: Column(
        children: [
          (scienceProviderObject.selectedChoiceMessages.isEmpty)
              ? const CommonDomainChoiceMessage(domainChoiceMessage: "What areas of \n science do \n you like?")
              : CommonDomainChoiceTopMessage(
                  domainChoiceTopMessage: scienceProviderObject.selectedChoiceMessages.last,
                  writerName: scienceProviderObject.selectedChoiceNames.last
                ),
          Expanded(flex: 1,child: Container()),
          makeVisible ?
              ScienceChoiceStack(
                domainChoiceIcons:  ScienceController.scienceDomainChoiceIcons,
                domainChoiceNames: ScienceController.scienceDomainChoiceNames,
                domainChoiceRedIcons: ScienceController.scienceDomainChoiceRedIcons,
              ) : const SizedBox(),

          Consumer(
            builder: (context,ref,child)
          {
            final scienceProviderObject=ref.watch(scienceProvider);
            return ((scienceProviderObject.isIcon1ColorRed) ||
                (scienceProviderObject.isIcon2ColorRed) ||
                (scienceProviderObject.isIcon3ColorRed) ||
                (scienceProviderObject.isIcon4ColorRed) ||
                (scienceProviderObject.isIcon5ColorRed)) ?
            const CommonButton()
                : Visibility(
                  visible: makeVisible,
                  child: const CommonDomainBottomMessage(),
            );
          })
        ],
      ),
    );
  }
}
