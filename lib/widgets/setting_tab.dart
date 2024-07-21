import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/generated/l10n.dart';
import 'package:islamic_app/provider/localizations_provider.dart';
import 'package:islamic_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          // backgroundColor: Colors.transparent,
          body: Padding(
            padding:
                const EdgeInsets.only(top: 80, bottom: 8, right: 10, left: 10),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -100,
                  left: 0,
                  right: 0,
                  child: Image.asset('assets/images/bg_removed.png'),
                ),
                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  child: Text(
                    S.of(context).islami,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.elMessiri(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).theme,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const ThemeBottomSheet();
                            },
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            // color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                          child: Text(
                            S.of(context).light,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                      ),

                      //
                      const SizedBox(
                        height: 30,
                      ),
                      //
                      Text(
                        S.of(context).language,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return const LangueBottomSheet();
                            },
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            // color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                          child: Text(
                            S.of(context).english,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider pro = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              pro.changeThemeMode(ThemeMode.light);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).light,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Provider.of<ThemeProvider>(context).isLight
                    ? const Icon(
                        Icons.done,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              pro.changeThemeMode(ThemeMode.dark);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).dark,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Provider.of<ThemeProvider>(context).isLight
                    ? const SizedBox()
                    : const Icon(Icons.done),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LangueBottomSheet extends StatelessWidget {
  const LangueBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LocalizationsProvider loc = Provider.of<LocalizationsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              loc.changeLanguage(const Locale('ar'));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).arabic,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Provider.of<LocalizationsProvider>(context).isEnglish
                    ? const SizedBox()
                    : const Icon(
                        Icons.done,
                      ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              loc.changeLanguage(const Locale('en'));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).english,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Provider.of<LocalizationsProvider>(context).isEnglish
                    ? const Icon(Icons.done)
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
