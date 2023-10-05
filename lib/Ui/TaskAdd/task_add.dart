import 'package:flutter/material.dart';
import 'package:todo_app/Shared_Components/color.dart';

class TaskAdd extends StatelessWidget {
  const TaskAdd({Key? key}) : super(key: key);
  static const String routName = "TaskAdd";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Add New Task",
            style: theme.bodyLarge!.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "you must entre text";
              } else {
                return value;
              }
            },
            decoration: const InputDecoration(
                hintText: "entre your task name",
                hintStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder()),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "you must entre text";
              } else {
                return value;
              }
            },
            decoration: const InputDecoration(
                hintText: "entre your description",
                hintStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder()),
          ),
          const SizedBox(
            height: 25,
          ),
          Text("Selected Time",
              textAlign: TextAlign.start,
              style: theme.bodyLarge!.copyWith(color: Colors.black)),
          TextButton(
            child: Text(
              "5/10/2023",
              style: theme.bodyMedium!.copyWith(color: Colors.grey),
            ),
            onPressed: () {},
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Submit New Task",
                style: theme.bodyMedium!.copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
