import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signupWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user!= null && !user.emailVerified) {
//       await user.sendEmailVerification();
// }
    return null;
  }

  Future<User?> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      // print('inside firebase');
      // print(email);
      // print(password);
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      // print('outside firebase');
    } on FirebaseAuthException catch (e) {
      // print('inside firebaseerror ');

      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    // print('beore return null');

    return null;
  }

  // Future<void> userSignOut() async {
  //   await auth.signOut();
  // }
}

class FirebaseFirestoreService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(
      {required String firstname,
      required String lastname,
      required String email,
      required String role,
      required String managercode}) {
    return users
        .add({
          'first_name': firstname,
          'last_name': lastname,
          'email_address': email,
          'role': role,
          'manager_code': managercode
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
