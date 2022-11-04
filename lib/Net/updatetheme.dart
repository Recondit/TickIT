import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updatetheme(int bg, int txt) async {
  try {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('Settings')
        .doc('Theme');
    FirebaseFirestore.instance.runTransaction((transaction) async {
      documentReference.update({
        "Bg": bg,
        "txt": txt,
      });
    });
  } catch (e) {}
}
