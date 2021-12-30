import 'package:anonia/login.dart';
import 'package:anonia/login_success_profile.dart';
import 'package:anonia/route/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn(signInOption: SignInOption.standard);

  

//Holds fields describing a signed in user's identity, following [GoogleSignInUserData].
//[id] is guaranteed to be non-null.
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;


  

  Future<User> signInAnonymously() async {
    User user = (await firebaseAuth.signInAnonymously()) as User;
    print("Signed in ${user.uid}");
    return user;
  }

  void signOut() {
    firebaseAuth.signOut();
    print('Signed Out!');
  }

  // Future signInAnonymously() async {
  //   // UserCredential userCredential =
  //   await FirebaseAuth.instance.signInAnonymously();

  //   // Disable persistence on web platforms
  //   await FirebaseAuth.instance.setPersistence(Persistence.NONE);
    

  //   FirebaseAuth.instance.userChanges().listen(
      
  //     (User? user) async {
  //       // if (user != null) {
  //       // } else {}
  //     },
  //   );
  //   notifyListeners();
  //   Future<void> anonymousLogout() async {
  //     // await FirebaseAuth.instance.signOut();
  //     // Route;
  //     await firebaseAuth.signOut();

  //     await googleSignIn.disconnect();

  //     Route;
  //   }
    
    
  // }

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      // print(e.toString());
    }
    notifyListeners();
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    Route;
  }
}

class SignWithEmail extends ChangeNotifier {
  final userWithEmailAndPassWord = UserCredential;
  final displayName = String;
  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user?.updateDisplayName(name);
      await user?.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
      }
    } catch (e) {
      // print(e);
    }
    return user;
  }

  Future
      // <User?>
      signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
    notifyListeners();

    Future logout() async {
      await FirebaseAuth.instance.signOut();
      Route;
    }
  }
}
