import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamic_app/generated/l10n.dart';
import 'package:islamic_app/provider/localizations_provider.dart';
import 'package:islamic_app/provider/theme_provider.dart';
import 'package:islamic_app/theme/theme.dart';
import 'package:islamic_app/views/bottom_navigation_bar_view.dart';
import 'package:islamic_app/views/hadith_content_view.dart';
import 'package:islamic_app/views/quran_content_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ThemeProvider provider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocalizationsProvider(),
        )
      ],
      builder: (context, child) => MaterialApp(
        locale: Provider.of<LocalizationsProvider>(context).loc,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        themeMode: Provider.of<ThemeProvider>(context).mode,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: BottomNavigationBarView.routName,
        routes: {
          BottomNavigationBarView.routName: (context) =>
              BottomNavigationBarView(),
          HadithContentView.routName: (context) => HadithContentView(),
          QuranContentView.routName: (context) => QuranContentView(),
        },
      ),
    );
  }
}
