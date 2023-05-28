import 'package:flutter/material.dart';
import 'package:todoc8/shared/theme/colors.dart';

class languageBottomsheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      color: theme.accentColor,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          InkWell(
            onTap: (){},
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                "english",
                style: theme.textTheme.headlineMedium!.copyWith(
                  color: primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: (){},
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                "arabic",
                style: theme.textTheme.headlineMedium!.copyWith(
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
