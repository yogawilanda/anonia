// import 'package:anonia/person_data.dart';
import 'package:anonia/main.dart';
import 'package:flutter/material.dart';
import 'route/route.dart';
import 'show_dialog.dart';
import 'package:provider/provider.dart';

// import 'person_data.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => HomescreenState();
}

class HomescreenState extends State<Homescreen> {
  final List<String> personData = [
    "Januari",
    "Fabruari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];

  //place the arrays here.

  @override
  Widget build(BuildContext context) {
    //in html those command will work as equal as a responsive website//
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              //change this to navigate into chat screen.
              Navigator.pushNamed(context, searchScreen);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        // physics: BouncingScrollPhysics(),
        itemCount: personData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, chatScreen);
            },
            onLongPress: () {
              //TODO: Find how to call the showDialog into this actions.
              //------------success method but not effective-------------------//
              Navigator.pop(context,
                  MaterialPageRoute(builder: (_) => const AlertDialogHapus()));
              //===================fail method=========================//
            },
            child: const Card(
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/beautiful-girl-image-57.jpg'),
                  ),
                  title: Text('PersonName'),
                  subtitle: Text('list.MessageText'),
                  trailing: Text('timestamp'),
                ),
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
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
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
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
