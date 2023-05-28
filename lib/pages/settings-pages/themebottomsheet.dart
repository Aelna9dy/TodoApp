import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoc8/provider/settings_provider.dart';
import 'package:todoc8/shared/theme/colors.dart';

class themeBottomsheet extends StatefulWidget {
  @override
  State<themeBottomsheet> createState() => _themeBottomsheetState();
}

class _themeBottomsheetState extends State<themeBottomsheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    var theme = Theme.of(context);
    return Container(
      color: theme.accentColor,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              settingsProvider.changeTheme(ThemeMode.light);
            },
            child: settingsProvider.isDark()
                ? getUnselectItems("Light")
                : getSelectItems("Light"),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              settingsProvider.changeTheme(ThemeMode.dark);
            },
            child: settingsProvider.isDark()
                ? getSelectItems("Dark")
                : getUnselectItems("Dark"),
          ),
        ],
      ),
    );
  }

  Widget getSelectItems(String title) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(),
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.center,
      width: double.infinity,
      child: Text(
        title,
        style: theme.textTheme.headlineMedium!.copyWith(
          color: primaryColor,
        ),
      ),
    );
  }

  Widget getUnselectItems(String title) {
    var theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      child: Text(
        title,
        style: theme.textTheme.headlineMedium!.copyWith(
          color: primaryColor,
        ),
      ),
    );
  }
}
