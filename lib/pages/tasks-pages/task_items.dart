import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItems extends StatelessWidget {
  const TaskItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.4,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: "Delete",
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14.0),
                bottomLeft: Radius.circular(14.0),
              ),
            ),
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.amber,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: "update",
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(14.0),
                bottomRight: Radius.circular(14.0),
              ),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 14,
          ),
          decoration: BoxDecoration(
            color: theme.accentColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Container(
                width: 5,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              const SizedBox(
                width: 14.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "play BasketBall",
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "10:30 AM",
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 14.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22.0,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Icon(
                  Icons.check,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
