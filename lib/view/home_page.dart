import 'package:anonia/route/google_sign_in.dart';
import 'package:anonia/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../route/route.dart';
import '../widget/show_dialog.dart';
import 'package:anonia/model/dummy_list.dart';
import 'package:provider/provider.dart';

// import 'person_data.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => HomescreenState();
}

class HomescreenState extends State<Homescreen> {
  //place the arrays here.
  //positional parameter will create array based on your order, not in a sequence.
  final List<Dummy> personData = [
    Dummy(
        personName: "Lisa",
        imageUrl: "assets/lisa.jpg",
        textMessage: "Yo! You Up Mate?",
        timeStamp: "sekarang"),
    Dummy(
        personName: "Abah Hamed",
        imageUrl: "assets/abah-hamed.jpg",
        textMessage: "Sehat kan antum?",
        timeStamp: "22.03"),
    Dummy(
        personName: "Brian USA",
        imageUrl: "assets/rich-brian-1.jpg",
        textMessage: "Eh kemarin project lo lancar bro?",
        timeStamp: "kemarin"),
    Dummy(
        personName: "Osas",
        imageUrl: "assets/Osas.jpg",
        textMessage:
            "Tanggal 25 tolong ambil filenya sekaligus deliv ke saya ya",
        timeStamp: "kemarin"),
    Dummy(
        personName: "Demian Google Dev",
        imageUrl: "assets/Demian.jpg",
        textMessage: "Kapan main lagi ke kantor?",
        timeStamp: "kemarin"),
    Dummy(
        personName: "Lisa",
        imageUrl: "assets/lisa.jpg",
        textMessage: "Yo! You Up Mate?",
        timeStamp: "sekarang"),
    Dummy(
        personName: "Abah Hamed",
        imageUrl: "assets/abah-hamed.jpg",
        textMessage: "Sehat kan antum?",
        timeStamp: "22.03"),
    Dummy(
        personName: "Brian USA",
        imageUrl: "assets/rich-brian-1.jpg",
        textMessage: "Eh kemarin project lo lancar bro?",
        timeStamp: "kemarin"),
    Dummy(
        personName: "Osas",
        imageUrl: "assets/Osas.jpg",
        textMessage:
            "Tanggal 25 tolong ambil filenya sekaligus deliv ke saya ya",
        timeStamp: "kemarin"),
    Dummy(
        personName: "Demian Google Dev",
        imageUrl: "assets/Demian.jpg",
        textMessage: "Kapan main lagi ke kantor?",
        timeStamp: "kemarin"),
  ];

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    //in html those command will work as equal as a responsive website//
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        title: const Text(
          'Anonia',
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, searchScreen);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.blue,
              size: 28,
            ),
          ),
        ],
      ),
      //Contents.
      backgroundColor: Colors.white,
      body: ListView.builder(
        // physics: BouncingScrollPhysics(),
        itemCount: personData.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(personData[index].imageUrl),
                ),
                title: Text(personData[index].personName),
                subtitle: Text(personData[index].textMessage),
                trailing: Text(personData[index].timeStamp),
                onTap: () {
                  Navigator.pushNamed(context, chatScreen);
                },
                onLongPress: () {
                  //TODO: Find how to call the showDialog into this actions.
                  //------------success method but not effective-------------------//
                  // Navigator.pop(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => const AlertDialogHapus()));
                  //===================fail method=========================//
                  Navigator.pushNamed(context, loginPage);
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, chatScreen);
        },
        child: const Icon(Icons.message),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Properties'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.pushNamed(context, loginSuccess);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pushNamed(context, settingsScreen);
              },
            ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
              onTap: () async {
                // Update the state of the app.
                Navigator.pushReplacementNamed(context, loginPage);
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                await provider.logout();
                Navigator.pushReplacementNamed(context, loginPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
