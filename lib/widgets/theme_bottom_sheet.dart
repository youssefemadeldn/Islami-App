import 'package:flutter/material.dart';
import 'package:islamic_app/generated/l10n.dart';
import 'package:islamic_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeObject = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              themeObject.changeThemeMode(ThemeMode.light);
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
              themeObject.changeThemeMode(ThemeMode.dark);
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
