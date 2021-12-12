import 'package:anonia/authentication/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserLoginSuccess extends StatelessWidget {
  const UserLoginSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              const Text('This is your profile'),
              CircleAvatar(
                radius: 8,
                //to channel the current user photo profile
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              const SizedBox(height: 8),
              Text(
                'Name: ' + user.displayName!,
                style: TextStyle(color: Colors.amber, fontSize: 16),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: CircleAvatar(
                radius: 8,
                //to channel the current user photo profile
                backgroundImage: NetworkImage(user.photoURL!),
              ),
            ),
            ListTile(
              title: const Text('Sign Out'),
              onTap: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
