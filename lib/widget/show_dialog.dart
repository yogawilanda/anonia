import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anonia/authenticator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class AlertDialogHapus extends StatelessWidget {
  const AlertDialogHapus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const Text('AlertDialog description'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ]);
  }
}

class AlertDialogLogOut extends StatelessWidget {
  final googleSignIn = GoogleSignIn(signInOption: SignInOption.standard);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(''),
      content: const Text('Kamu yakin ingin log out? :('),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text('Ya'),
            ),
          ],
        )
      ],
    );
  }

  Future<void> logout() async {
    // await FirebaseAuth.instance.signOut();
    // Route;
    await FirebaseAuth.instance.signOut();

    await googleSignIn.disconnect();

    Route;
  }
}
