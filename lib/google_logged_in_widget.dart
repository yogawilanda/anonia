import 'package:anonia/authentication/login.dart';
import 'package:anonia/authentication/register.dart';
import 'package:anonia/home_screen.dart';
import 'package:anonia/login_success_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//if this method fail, use the main.dart method again.
//HomePage is a stream builder, so itshould be the first things this app will renders
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              //create this instance.
              return UserLoginSuccess();
            } else if (snapshot.hasError) {
              return Center(child: Text('Something went wrong!'));
            } else {
              //Create this widget too.
              // return const RegisterPage();
              return const LoginPage();
            }
          },
        ),
      );
}
