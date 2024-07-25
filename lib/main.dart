import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';

import 'app_cache.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppCache().init();

  runApp(const BebaBolebosApp());
}

class BebaBolebosApp extends StatelessWidget {
  const BebaBolebosApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['assets/lib/i18n'];

    var localeCode = AppCache().getLocale() ?? 'en';

    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          LocalJsonLocalization.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('es', 'ES'),
          Locale('pt', 'BR'),
          Locale('it', 'IT'),
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          if (supportedLocales.contains(locale)) {
            return locale;
          }

          if (localeCode == 'pt') {
            return const Locale('pt', 'PT');
          }
          if (localeCode == 'es') {
            return const Locale('es', 'ES');
          }
          if (localeCode == 'it') {
            return const Locale('it', 'IT');
          }
          return const Locale('en', 'GB');
        },
        title: 'Beba Bolebos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen());
  }
}
