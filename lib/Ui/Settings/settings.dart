import 'package:flutter/material.dart';
import 'package:todo_app/Shared_Components/color.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Language",
            style: theme.bodyLarge!.copyWith(color: Colors.black),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2, color: primaryColor)),
            width: mediaQuery.width,
            height: mediaQuery.height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "English",
                  style: theme.bodyMedium!.copyWith(color: primaryColor),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: primaryColor,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Mode",
            style: theme.bodyLarge!.copyWith(color: Colors.black),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2, color: primaryColor)),
            width: mediaQuery.width,
            height: mediaQuery.height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Light",
                  style: theme.bodyMedium!.copyWith(color: primaryColor),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
