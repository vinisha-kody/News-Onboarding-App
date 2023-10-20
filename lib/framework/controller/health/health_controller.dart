import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:news_onboarding/ui/utils/theme/assets_location.dart';

final healthProvider = ChangeNotifierProvider<HealthController>((ref) => HealthController());

class HealthController with ChangeNotifier
{

  bool isIcon1ColorRed=false;
  bool isIcon2ColorRed=false;
  bool isIcon3ColorRed=false;
  bool isIcon4ColorRed=false;
  bool isIcon5ColorRed=false;
  int count = 0;
  int deleteCount=0;
  String topMessage="";
  String writerName="";
  bool isAnimating=false;
  List<String> selectedChoiceNames=[];
  List<String> selectedChoiceMessages=[];
  bool listIsEmpty=false;

  void updateIcon1Value(){
    isIcon1ColorRed=true;
    notifyListeners();
  }

  void updateIcon2Value(){
    isIcon1ColorRed=true;
    notifyListeners();
  }

  void updateIcon3Value(){
    isIcon2ColorRed=true;
    notifyListeners();
  }

  void updateIcon4Value(){
    isIcon3ColorRed=true;
    notifyListeners();
  }

  void updateIcon5Value(){
    isIcon4ColorRed=true;
    notifyListeners();
  }

  int updateCount()
  {
    count++;
    isAnimating=!isAnimating;
    notifyListeners();
    return count;
  }

  void updateTopMessage(String message,String name)
  {
    topMessage=message;
    writerName= "\n-$name";
    Future.delayed(const Duration(milliseconds: 500),() {
      notifyListeners();
    });
  }

  void addIntoList(String message,String name)
  {
    if(selectedChoiceNames.isEmpty)
    {
      selectedChoiceNames.add("\n-$name");
    }
    else
    {
      Future.delayed(const Duration(milliseconds: 500),() => selectedChoiceNames.add("\n-$name"));
    }
    if(selectedChoiceMessages.isEmpty)
    {
      selectedChoiceMessages.add(message);
    }
    else
    {
      Future.delayed(const Duration(milliseconds: 500),() => selectedChoiceMessages.add(message));
    }
    notifyListeners();
  }

  void deleteFromList()
  {
    selectedChoiceNames.removeLast();
    selectedChoiceMessages.removeLast();
    deleteCount++;
    if(selectedChoiceMessages.isEmpty)
    {
      listIsEmpty=true;
    }
    else
    {
      listIsEmpty=false;
    }
    notifyListeners();
  }

  static List<String> healthDomainChoiceIcons=[
    AssetsLocation.fitness,
    AssetsLocation.healthcare,
    AssetsLocation.medicine,
    AssetsLocation.mentalhealth,
    AssetsLocation.nutritian
  ];

  static List<String> healthDomainChoiceNames=[
    "Fitness",
    "Health care",
    "Medicine",
    "Mental Health",
    "Nutrition"
  ];

  static List<String> healthDomainChoiceRedIcons=[
    AssetsLocation.fitnessred,
    AssetsLocation.healthcarered,
    AssetsLocation.medicinered,
    AssetsLocation.mentalhealthred,
    AssetsLocation.nutritianred,
  ];
}