import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> find_index(String task_name) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('UserTasks')
        .orderBy("Timestamp", descending: true)
        .get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      if ((a.data()['Todo']) == task_name) {
        
        return i;
      }
    }
    return null;
  } catch (e) {
    print("Found ERROR");
    print(e.toString());
    return 3;
  }
}
