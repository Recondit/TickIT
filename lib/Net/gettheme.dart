import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> gettheme() async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('Settings')
        .get();
    var a = querySnapshot.docs[0];
    List ret = [a.data()['Bg'], a.data()['txt']];
    print(ret);
    return ret;
  } catch (e) {}
}
