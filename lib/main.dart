import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:newsprogroup/core/components/my_theme.dart';
import 'package:newsprogroup/models/news_model.dart';
import 'package:newsprogroup/screens/main_page.dart';
import 'package:newsprogroup/screens/sign_in_page.dart';
import 'package:newsprogroup/screens/sign_up_page.dart';
import 'package:newsprogroup/service/apple_service.dart';
import 'package:newsprogroup/service/business_service.dart';
import 'package:newsprogroup/service/domain_service.dart';
import 'package:newsprogroup/service/news_service.dart';
import 'package:newsprogroup/service/tech_service.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NewsModelAdapter());
  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(SourceAdapter());

  await NewsService.openBox();
  await AppleService.openBox();
  await BusinessService.openBox();
  await DomainService.openBox();
  await TechService.openBox();

  await AppleService.openSave();
  await NewsService.openSave();
  await BusinessService.openSave();
  await DomainService.openSave();
  await TechService.openSave();

  await NewsService.getData();
  await AppleService.getData();
  await BusinessService.getData();
  await DomainService.getData();
  await TechService.getData();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: MyTheme.light,
      dark: MyTheme.dark,
      initial: AdaptiveThemeMode.light,
      builder: (light, dark) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: light,
          darkTheme: dark,
          home: SignInPage(),
        );
      },
    );
  }
}
