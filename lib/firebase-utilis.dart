import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoc8/models/task.dart';

CollectionReference<Task> getTaskCollection(){
  return FirebaseFirestore.instance.collection('task').
  withConverter<Task>(
    fromFirestore: (snapshot, options) => Task.fromJason(snapshot.data()!),
    toFirestore: (task, options) => task.toJason(),
  );
}

Future<void> addTaskToFirestore(Task task){
  var taskCollection = getTaskCollection(); //Collection
  var docRef = taskCollection.doc(); //Document Auto ID Because is empty

  task.id = docRef.id; //auto id set on idTask

  return docRef.set(task);


}
