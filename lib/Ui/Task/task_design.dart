import 'package:flutter/material.dart';

import '../../Shared_Components/color.dart';

class DesignTasks extends StatelessWidget {
  const DesignTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            width: mediaQuery.width * 0.01,
            height: mediaQuery.height * 0.08,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(15)),
          ),
          const Spacer(
            flex: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Play basket ball",
                style: theme.bodyMedium!.copyWith(color: primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/time.png",
                  ),
                  Text(
                    "10:30 AM",
                    style: theme.bodySmall,
                  ),
                ],
              )
            ],
          ),
          const Spacer(flex: 2),
          Container(
            width: mediaQuery.width * 0.2,
            height: mediaQuery.height * 0.05,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(15)),
            child: Image.asset(
              "assets/images/check.png",
            ),
          )
        ],
      ),
    );
  }
}
