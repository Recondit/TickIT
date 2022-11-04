import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> deletetask(String task_name) async {
  try {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('UserTasks')
        .doc(task_name);
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.delete(documentReference);
    });
    return true;
  } catch (e) {
    return false;
  }
}
