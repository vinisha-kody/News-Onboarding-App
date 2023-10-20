import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_onboarding/framework/dependency_injection/inject.dart';
import 'package:news_onboarding/ui/routing/delegate.dart';
import 'package:news_onboarding/ui/routing/parser.dart';
import 'package:news_onboarding/ui/routing/stack.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  await configureMainDependencies(environment: Env.dev);

  setPathUrlStrategy();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "New OnBoarding",
      debugShowCheckedModeBanner: false,
      routerDelegate: getIt<MainRouterDelegate>(
          param1: ref.read(navigationStackProvider)),
      routeInformationParser:
      getIt<MainRouterInformationParser>(param1: ref, param2: context),
    );
  }
}
