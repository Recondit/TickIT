import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> addtask(String task_name, String task_time) async {
  try {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('UserTasks')
        .doc(task_name);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      documentReference.set({
        "Todo": task_name,
        "Timestamp": FieldValue.serverTimestamp(),
        "GDB": task_time
      });
      return true;
    });
  } catch (e) {
    return false;
  }
}
