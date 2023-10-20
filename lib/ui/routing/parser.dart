
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:news_onboarding/ui/intro/intro.dart';
import 'package:news_onboarding/ui/routing/navigation_stack_keys.dart';
import 'package:news_onboarding/ui/routing/stack.dart';
import 'package:news_onboarding/ui/routing/navigation_stack_item.dart';

@injectable
class MainRouterInformationParser
    extends RouteInformationParser<NavigationStack> {
  WidgetRef ref;
  BuildContext context;

  MainRouterInformationParser(
      @factoryParam this.ref, @factoryParam this.context);

  @override
  Future<NavigationStack> parseRouteInformation(
      RouteInformation routeInformation) async {
    print("........URL......${routeInformation.location}");

    final Uri uri = Uri.parse(routeInformation.location ?? "");
    final queryParams = uri.queryParameters;
    final items = <NavigationStackItem>[];
    debugPrint('Stack Item Count - ${items.length}');
    //String? langStr = queryParams['lang'];

    // if (langStr != null) {
    //   await context.setLocale(Locale(langStr == "english" ? "en" : "hi"));
    // }

    for (var i = 0; i < uri.pathSegments.length; i = i + 1) {
      final key = uri.pathSegments[i];

      switch(key){
        case Keys.intro:
          items.add(const NavigationStackItem.intro());
          break;
        case Keys.choiceNews:
          items.add(const NavigationStackItem.choiceNews());
          break;
        case Keys.scienceHome:
          items.add(const NavigationStackItem.scienceHome());
          break;
        case Keys.entertainmentHome:
          items.add(const NavigationStackItem.entertainmentHome());
          break;
        case Keys.healthHome:
          items.add(const NavigationStackItem.healthHome());
          break;
        case Keys.businessHome:
          items.add(const NavigationStackItem.businessHome());
          break;
        case Keys.techHome:
          items.add(const NavigationStackItem.techHome());
          break;
        case Keys.scienceChoice:
          items.add(const NavigationStackItem.scienceChoice());
          break;
        case Keys.businessChoice:
          items.add(const NavigationStackItem.businessChoice());
          break;
        case Keys.entertainmentChoice:
          items.add(const NavigationStackItem.entertainmentChoice());
          break;
        case Keys.healthChoice:
          items.add(const NavigationStackItem.healthChoice());
          break;
        case Keys.techChoice:
          items.add(const NavigationStackItem.techChoice());
          break;
        default:
          items.add(const NavigationStackItem.intro());
      }

    }
    if (items.isEmpty) {
      const fallback = NavigationStackItem.intro(); //NavigationStackItem.customerInfo();
      if (items.isNotEmpty && items.first is NavigationStackItemIntro) {
        items[0] = fallback;
      } else {
        items.insert(0, fallback);
      }
    }
    return NavigationStack(items);
  }

  ///THIS IS IMPORTANT: Here we restore the web history
  @override
  RouteInformation restoreRouteInformation(NavigationStack configuration) {
    final location =
    configuration.items.fold<String>("", (previousValue, element) {
      return previousValue +
          element.when(
              intro: () => '/${Keys.intro}',
              choiceNews: () => '/${Keys.choiceNews}',
              scienceHome: () => '/${Keys.scienceHome}',
              entertainmentHome: () => '${Keys.entertainmentHome}',
              healthHome: () => '${Keys.healthHome}',
              businessHome: () => '${Keys.businessHome}',
              techHome: () => '${Keys.techHome}',
              scienceChoice: () => '${Keys.scienceChoice}',
              businessChoice: () => '${Keys.businessChoice}',
              entertainmentChoice: () => '${Keys.entertainmentChoice}',
              healthChoice: () => '${Keys.healthChoice}',
              techChoice: () => '${Keys.techChoice}'
          );
    });

    ///Return null will be stay in first route page  , if we reached first page then location will empty
    return RouteInformation(location: location);
  }
}
