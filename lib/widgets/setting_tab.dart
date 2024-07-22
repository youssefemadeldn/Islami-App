import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/generated/l10n.dart';
import 'package:islamic_app/provider/localizations_provider.dart';
import 'package:islamic_app/provider/theme_provider.dart';
import 'package:islamic_app/widgets/language_bottom_sheet.dart';
import 'package:islamic_app/widgets/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    LocalizationsProvider loc = Provider.of<LocalizationsProvider>(context);
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
                            theme.isLight
                                ? S.of(context).light
                                : S.of(context).dark,
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
                              return const LanguageBottomSheet();
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
                            loc.isEnglish
                                ? S.of(context).english
                                : S.of(context).arabic,
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
