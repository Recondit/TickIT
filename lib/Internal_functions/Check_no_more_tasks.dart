import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> check_no_more_tasks() async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('UserTasks')
        .orderBy("Timestamp", descending: true)
        .get();
    if (querySnapshot.docs.length == 0) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print("Found ERROR");
    print(e.toString());
    return false;
  }
}
