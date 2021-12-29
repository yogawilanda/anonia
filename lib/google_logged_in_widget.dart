import 'package:anonia/home_screen.dart';
import 'package:anonia/login.dart';
// import 'package:anonia/register.dart';
// import 'package:anonia/home_screen.dart';
import 'package:anonia/login_success_profile.dart';
import 'package:anonia/route/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//if this method fail, use the main.dart method again.
//HomePage is a stream builder, so itshould be the first things this app will renders
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              //create this instance.
              return const UserLoginSuccess();
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong!'));
            } else {
              return LoginPage();
            }
          },
        ),
      );
}
