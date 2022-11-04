import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> check_new() async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('UserTasks')
        .get();
    if (querySnapshot.docs.length == 0) {
      print("NOT FOUND");
      return true; //True means is a new user
    } else {
      print(querySnapshot.docs.length);
      return false;
    }
  } catch (e) {
    print("ERROR");
    return true;
  }
}
