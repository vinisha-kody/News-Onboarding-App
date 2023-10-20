import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_onboarding/framework/controller/entertainment/entertainment_controller.dart';
import 'package:news_onboarding/ui/entertainment/helper/entertainment_choice_stack.dart';
import 'package:news_onboarding/ui/utils/helpers/common_button.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_bottom_message.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_choice_message.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_choice_stack.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_choice_top_message.dart';
import 'package:news_onboarding/ui/utils/theme/app_colors.dart';
import 'package:news_onboarding/ui/utils/theme/assets_location.dart';

class EntertainmentChoiceMobile extends ConsumerStatefulWidget {
  const EntertainmentChoiceMobile({super.key});

  @override
  ConsumerState<EntertainmentChoiceMobile> createState() => _EntertainmentChoiceMobileState();
}

class _EntertainmentChoiceMobileState extends ConsumerState<EntertainmentChoiceMobile> with TickerProviderStateMixin{

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
    final entertainmentProviderObject=ref.watch(entertainmentProvider);
    return Scaffold(
      backgroundColor: AppColors.appColor,
      body: Column(
        children: [
          (entertainmentProviderObject.selectedChoiceMessages.isEmpty)
          ? const CommonDomainChoiceMessage(domainChoiceMessage: "How can \n we entertain \n you?")
          : CommonDomainChoiceTopMessage(
              domainChoiceTopMessage: entertainmentProviderObject.selectedChoiceMessages.last,
              writerName: entertainmentProviderObject.selectedChoiceNames.last
          ),
          Expanded(flex: 1,child: Container()),
          makeVisible ?
          EntertainmentChoiceStack(
            domainChoiceIcons: EntertainmentController.entertainmentDomainChoiceIcons,
            domainChoiceNames: EntertainmentController.entertainmentDomainChoiceNames,
            domainChoiceRedIcons: EntertainmentController.entertainmentDomainChoiceRedIcons,
          ) : const SizedBox(),
          Consumer(
              builder: (context,ref,child)
              {
                final entertainmentProviderObject=ref.watch(entertainmentProvider);
                return ((entertainmentProviderObject.isIcon1ColorRed) ||
                    (entertainmentProviderObject.isIcon2ColorRed) ||
                    (entertainmentProviderObject.isIcon3ColorRed) ||
                    (entertainmentProviderObject.isIcon4ColorRed) ||
                    (entertainmentProviderObject.isIcon5ColorRed)) ?
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
