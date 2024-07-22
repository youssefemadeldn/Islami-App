import 'package:flutter/material.dart';
import 'package:islamic_app/generated/l10n.dart';
import 'package:islamic_app/provider/localizations_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({
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
