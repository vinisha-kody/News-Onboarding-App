import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_onboarding/ui/news/mobile/news_mobile.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await configureMainDependencies(environment: Env.dev);
  runApp(const ProviderScope(child: NewsMobile()));
}