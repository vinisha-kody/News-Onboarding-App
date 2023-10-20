import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_onboarding/framework/controller/buisness/business_controller.dart';
import 'package:news_onboarding/ui/buisness/helper/business_choice_stack.dart';
import 'package:news_onboarding/ui/utils/helpers/common_button.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_bottom_message.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_choice_message.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_choice_stack.dart';
import 'package:news_onboarding/ui/utils/helpers/common_domain_choice_top_message.dart';
import 'package:news_onboarding/ui/utils/theme/app_colors.dart';
import 'package:news_onboarding/ui/utils/theme/assets_location.dart';

class BusinessChoiceMobile extends ConsumerStatefulWidget {
  const BusinessChoiceMobile({super.key});

  @override
  ConsumerState<BusinessChoiceMobile> createState() => _BusinessChoiceMobileState();
}

class _BusinessChoiceMobileState extends ConsumerState<BusinessChoiceMobile> with TickerProviderStateMixin{

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
    final businessProviderObject=ref.watch(businessProvider);
    return Scaffold(
      backgroundColor: AppColors.appColor,
      body: Column(
        children: [
          (businessProviderObject.selectedChoiceMessages.isEmpty)
          ? const  CommonDomainChoiceMessage(domainChoiceMessage: "Let's get \n down to \n business")
          : CommonDomainChoiceTopMessage(
          domainChoiceTopMessage: businessProviderObject.selectedChoiceMessages.last,
          writerName: businessProviderObject.selectedChoiceNames.last
          ),
          Expanded(flex: 1,child: Container()),
          makeVisible ?
          BusinessChoiceStack(
            domainChoiceIcons: BusinessController.businessDomainChoiceIcons,
            domainChoiceNames: BusinessController.businessDomainChoiceNames,
            domainChoiceRedIcons: BusinessController.businessDomainChoiceRedIcons,
          ) : const SizedBox(),

          Consumer(
              builder: (context,ref,child)
              {
                final businessProviderObject=ref.watch(businessProvider);
                return ((businessProviderObject.isIcon1ColorRed) ||
                    (businessProviderObject.isIcon2ColorRed) ||
                    (businessProviderObject.isIcon3ColorRed) ||
                    (businessProviderObject.isIcon4ColorRed) ||
                    (businessProviderObject.isIcon5ColorRed)) ?
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
