import 'package:anonia/model/dummy_list.dart';

import 'package:anonia/route/google_sign_in.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../model/chat_user_model.dart';

import '../../route/route.dart';

import 'package:provider/provider.dart';

// import 'person_data.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => HomescreenState();
}

class HomescreenState extends State<Homescreen> {
  // final chatModel = ChatList().chatModel;

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    //in html those command will work as equal as a responsive website//
    return Scaffold(
      appBar: const AppBarHomePage(),

      //Contents.
      body: HomePageBodyView(),

      //.
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: () {
          Navigator.pushNamed(context, messagingPage);
        },
        child: const Icon(Icons.message),
        backgroundColor: Colors.grey.shade200,
      ),

      //.
      drawer: const DrawerHomePageView(),
    );
  }
}

class AppBarHomePage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return PreferredSize(
      preferredSize: Size(width, kToolbarHeight),
      child: AppBar(
        title: const Text(
          'Anonia',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, searchScreen);
            },
            icon: const Icon(
              Icons.search,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}

class HomePageBodyView extends StatelessWidget {
  HomePageBodyView({
    Key? key,
    // required this.chatModel,
  }) : super(key: key);

  final chatModel = ChatList().chatModel;

  // final List<Dummy> chatModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: BouncingScrollPhysics(),
      itemCount: chatModel.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(chatModel[index].imageUrl),
              ),
              title: Text(chatModel[index].personName),
              subtitle: Text(chatModel[index].textMessage),
              trailing: Text(chatModel[index].timeStamp),
              onTap: () {
                Navigator.pushNamed(context, messagingPage);
              },
              onLongPress: () {
                Navigator.pushNamed(context, visitorProfilePage);
              },
            ),
          ),
        );
      },
    );
  }
}

class DrawerHomePageView extends StatelessWidget {
  const DrawerHomePageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            margin: EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.elliptical(60, 60),
                bottomLeft: Radius.elliptical(60, 60),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, profilePage);
                  },
                  child: Container(
                    child: StreamBuilder<Object>(
                      // stream: null,
                      builder: (context, snapshot) {
                        return CircleAvatar(
                          maxRadius: 50,
                          backgroundImage: AssetImage('assets/lisa.jpg'),
                        );
                      },
                    ),
                  ),
                ),
                Text('Lisa', textScaleFactor: 1.5),
              ],
            ),
          ),

          //Properties listTile.
          ListTile(
            title: const Text('Properties'),
            enabled: false,
            onLongPress: () {
              print('');
            },
          ),

          //Profile listTile.
          ListTile(
            title: const Text('Profile'),
            leading: const Icon(Icons.person),
            onTap: () {
              //Pushing from this contect to settingScreen
              Navigator.pushNamed(context, profilePage);
            },
          ),

          //Logout listTile
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () async {
              // Update the state of the app.

              //Pushing from this contect to loginPage
              //Todo: refactor this name.
              Navigator.pushReplacementNamed(context, loginPage);
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              await provider.logout();
              Navigator.pushReplacementNamed(context, loginPage);
            },
          ),

          //Setting listTile
          Expanded(
            child: ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                //Todo: refactor this name.
                //Pushing from this contect to settingScreen
                Navigator.pushNamed(context, settingsScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
