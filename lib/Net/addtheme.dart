import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addtheme() async {
  try {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('Settings')
        .doc('Theme');
    FirebaseFirestore.instance.runTransaction((transaction) async {
      
      documentReference.set({
        "Bg": 0xFFe0e2d4,
        "txt": 0xFF000000,
      });
    });
  } catch (e) {}
}
