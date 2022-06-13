import 'package:anonia/view/user_login_success.dart';

import 'package:anonia/view/login/login_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

//if this method fail, use the main.dart method again.
//AppGate is a stream builder, so it should be the first things this app will renders
class AppGate extends StatelessWidget {
  const AppGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return const UserLoginSuccess();
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong!'));
            } else {
              return const LoginPage();
            }
          },
        ),
      );
}
