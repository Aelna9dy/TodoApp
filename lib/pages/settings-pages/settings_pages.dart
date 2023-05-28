import 'package:flutter/material.dart';
import 'package:todoc8/pages/settings-pages/languagebottomsheet.dart';
import 'package:todoc8/pages/settings-pages/themebottomsheet.dart';
import 'package:todoc8/shared/theme/colors.dart';

class SettingsPages extends StatefulWidget {
  const SettingsPages({Key? key}) : super(key: key);

  @override
  State<SettingsPages> createState() => _SettingsPagesState();
}

class _SettingsPagesState extends State<SettingsPages> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "language",
            textAlign: TextAlign.start,
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: theme.accentColor,
                  border: Border.all(
                    color: primaryColor,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                   InkWell(
                    child: Text(
                      "english",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                   Icon(
                    Icons.keyboard_arrow_down,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "mode",
            textAlign: TextAlign.start,
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.accentColor,
                border: Border.all(
                  color: primaryColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "light",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return languageBottomsheet();
      },
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return themeBottomsheet();
      },
    );
  }
}
