import 'package:flutter/material.dart';
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
                  top: 100,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Theme",
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
                            'Light',
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
                        "Language",
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
                            'English',
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
                  'Light',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const Icon(
                  Icons.done,
                )
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
                  'Dark',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                // const Icon(Icons.done),
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Arabic',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Icon(
                Icons.done,
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'English',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              // const Icon(Icons.done),
            ],
          ),
        ],
      ),
    );
  }
}
