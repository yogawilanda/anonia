import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 60,
            ),
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/lisa.jpg'),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'This is your name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.blue),
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text('Change your status here'),
                // tileColor: Colors.blue,
                onTap: () {
                  print('pressed');
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
