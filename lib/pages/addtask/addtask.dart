import 'package:flutter/material.dart';
import 'package:todoc8/firebase-utilis.dart';
import 'package:todoc8/models/task.dart';
import 'package:todoc8/shared/theme/colors.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var formKey = GlobalKey<FormState>();

  DateTime selectTime = DateTime.now();

  String title = '';

  String description = '';

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        color: theme.accentColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Add Task",
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "must not empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      "Task is Title",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "must not empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      "task details",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Select Time",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    showBottomSheetDatePicker();
                  },
                  child: Text(
                    "${selectTime.day}/${selectTime.month}/${selectTime.year}",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // print("text is valid");
                      setState(() {
                        addTask();
                      });
                    }
                  },
                  child: Container(
                    color: primaryColor,
                    child: Text(
                      "Submit New Task",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addTask() {
    if (formKey.currentState!.validate() == true) {
      Task task = Task(
        title: title,
        description: description,
        date: selectTime.millisecondsSinceEpoch,
      );
      addTaskToFirestore(task).timeout(
        const Duration(
          milliseconds: 500,
        ),
        onTimeout: () {
          print("todo was add");
          Navigator.pop(context);
        },
      );
    }
  }

  void showBottomSheetDatePicker() async{
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: selectTime,
      firstDate: selectTime,
      lastDate: selectTime.add(
        const Duration(days: 365),
      ),
    );
    if(chooseDate != null){
      selectTime = chooseDate;
      setState(() {});
    }
  }
}
