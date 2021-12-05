// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_core/firebase_core.dart';

// class AuthServices {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//    static Future<User?> signInAnonymous() async {
//     try {
//       UserCredential result = await _auth.signInAnonymously();
//       User? user = result.user;

//       return user;
//     } catch (e) {
//       (e.toString());

//       return null;
//     }
//   }

//    Future<void> signOut() async {
//     _auth.signOut();
//   }
// }
