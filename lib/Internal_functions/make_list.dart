import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> make_list() async{
  try {
    List tasky = List();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('UserTasks')
        .orderBy("Timestamp", descending: true)
        .get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      tasky.add((a.data()['Todo']));
    }
    return tasky;
  } catch (e) {
    print("Found ERROR");
    print(e.toString());
  }
}
