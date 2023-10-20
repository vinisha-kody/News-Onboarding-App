import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:news_onboarding/ui/utils/const/app_enums.dart';
part 'navigation_stack_item.freezed.dart';


@freezed
class NavigationStackItem with _$NavigationStackItem {
  const factory NavigationStackItem.intro() = NavigationStackItemIntro;
  const factory NavigationStackItem.choiceNews() = NavigationStackItemChoiceNews;
  const factory NavigationStackItem.scienceHome() = NavigationStackItemScienceHome;
  const factory NavigationStackItem.entertainmentHome() = NavigationStackItemEntertainmentHome;
  const factory NavigationStackItem.healthHome() = NavigationStackItemHealthHome;
  const factory NavigationStackItem.businessHome() = NavigationStackItemBusinessHome;
  const factory NavigationStackItem.techHome() = NavigationStackItemTechHome;
  const factory NavigationStackItem.scienceChoice() = NavigationStackItemScienceChoice;
  const factory NavigationStackItem.businessChoice() = NavigationStackItemBusinessChoice;
  const factory NavigationStackItem.entertainmentChoice() = NavigationStackItemEntertainmentChoice;
  const factory NavigationStackItem.healthChoice() = NavigationStackItemHealthChoice;
  const factory NavigationStackItem.techChoice() = NavigationStackItemTechChoice;
}
