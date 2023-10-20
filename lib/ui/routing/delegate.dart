import 'package:news_onboarding/ui/buisness/business_choice.dart';
import 'package:news_onboarding/ui/buisness/business_home.dart';
import 'package:news_onboarding/ui/entertainment/entertainment_choice.dart';
import 'package:news_onboarding/ui/entertainment/entertainment_home.dart';
import 'package:news_onboarding/ui/health/health_choice.dart';
import 'package:news_onboarding/ui/health/health_home.dart';
import 'package:news_onboarding/ui/intro/choice_news.dart';
import 'package:news_onboarding/ui/intro/intro.dart';
import 'package:news_onboarding/ui/routing/navigation_stack_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:news_onboarding/ui/routing/stack.dart';
import 'package:news_onboarding/ui/science/science_home.dart';
import 'package:news_onboarding/ui/tech/tech_choice.dart';
import 'package:news_onboarding/ui/tech/tech_home.dart';
import 'package:news_onboarding/ui/science/science_choice.dart';


@injectable
class MainRouterDelegate extends RouterDelegate<NavigationStack>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin{
  final NavigationStack stack;

  @override
  void dispose() {
    stack.removeListener(notifyListeners);
    super.dispose();
  }

  MainRouterDelegate(@factoryParam this.stack) : super() {
    stack.addListener(notifyListeners);
  }

  @override
  final navigatorKey = GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Navigator(
        key: navigatorKey,
        pages: _pages(ref),

        /// callback when a page is popped.
        onPopPage: (route, result) {
          /// let the OS handle the back press if there was nothing to pop
          if (!route.didPop(result)) {
            return false;
          }

          /// if we are on root, let OS close app
          if (stack.items.length == 1) return false;

          /// if we are on root, let OS close app
          if (stack.items.isEmpty) return false;

          /// otherwise, pop the stack and consume the event
          stack.pop();
          return true;
        },
      );
    });
  }

  List<Page> _pages(WidgetRef ref) => stack.items
      .mapIndexed((e, i) => e.when(
          intro: () => const MaterialPage(child: Intro(),key: ValueKey(Keys.intro)),
          choiceNews: () => const MaterialPage(child: ChoiceNews(),key: ValueKey(Keys.choiceNews)),
          scienceHome: () => const MaterialPage(child: ScienceHome(),key: ValueKey(Keys.scienceHome)),
          entertainmentHome: () => const MaterialPage(child: EntertainmentHome(),key: ValueKey(Keys.entertainmentHome)),
          healthHome: () => const MaterialPage(child: HealthHome(),key: ValueKey(Keys.healthHome)),
          businessHome: () => const MaterialPage(child: BusinessHome(),key: ValueKey(Keys.businessHome)),
          techHome: () => const MaterialPage(child: TechHome(),key: ValueKey(Keys.techHome)),
          scienceChoice: () => const MaterialPage(child: ScienceChoice(), key: ValueKey(Keys.scienceChoice)),
          businessChoice: () => const MaterialPage(child: BusinessChoice(),key: ValueKey(Keys.businessChoice)),
          entertainmentChoice: () => const MaterialPage(child: EntertainmentChoice(),key: ValueKey(Keys.entertainmentChoice)),
          healthChoice: () => const MaterialPage(child: HealthChoice(),key: ValueKey(Keys.healthChoice)),
          techChoice: () => const MaterialPage(child: TechChoice(),key: ValueKey(Keys.techChoice)),
  )).toList();

  @override
  NavigationStack get currentConfiguration => stack;

  @override
  Future<void> setNewRoutePath(NavigationStack configuration) async {
    stack.items = configuration.items;
  }
}

extension _IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}
