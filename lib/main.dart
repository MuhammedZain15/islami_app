import 'package:flutter/material.dart';
import 'package:islami_app/core/application_theme_manager.dart';
import 'package:islami_app/core/setting_provider.dart';
import 'package:islami_app/layout/layout_view.dart';
import 'package:islami_app/modules/quran/quran_details_view.dart';
import 'package:islami_app/modules/splash/splash_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'modules/hadeth/hadeth_details_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: Application_Theme_manager.LightThemeData,
      darkTheme: Application_Theme_manager.DarkThemeData,
      themeMode: provider.currentThemeMode,
      locale: Locale(provider.currentLanguageCode),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        splashview.routename: (context) => const splashview(),
        layOutView.routeName: (context) => const layOutView(),
        QuranDetailsView.routeName: (context) => const QuranDetailsView(),
        HadethDetailsView.routeName: (context) => const HadethDetailsView(),
      },
    );
  }
}
