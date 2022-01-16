import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anonia/route/route.dart' as route;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserLoginSuccess extends StatefulWidget {
  const UserLoginSuccess({Key? key}) : super(key: key);

  @override
  State<UserLoginSuccess> createState() => _UserLoginSuccessState();
}

class _UserLoginSuccessState extends State<UserLoginSuccess> {
  @override
  Widget build(BuildContext context) {
    //to show firebase user credentials.
    final user = FirebaseAuth.instance.currentUser!;

    return GestureDetector(
      onVerticalDragUpdate: (dragUpdateDetails) {
        Navigator.pushNamed(context, route.chatUIPage);
      },  
      onHorizontalDragUpdate: (details) =>
          Navigator.pushNamed(context, route.chatScreen),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text('User Profile'),
          centerTitle: true,
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(
              color: Colors.blue,
              fontSize: 30,
              letterSpacing: 2,
              fontWeight: FontWeight.w600),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  clipBehavior: Clip.none,
                  child: Column(
                    children: [
                      mainContent(
                        // width,
                        // height,
                        user,
                      ),
                      const ButtonBar(children: [
                        // AddUser('rosa', 'hero', 25),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
            // GetUserName('rosa'),
          ],
        ),
      ),
    );
    // OldScaffold(user: user, height: height);
  }

  Container mainContent(User user) {
    return Container(
      // color: Colors.white,
      // margin: EdgeInsets.all(30),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 30,
            ),
            userProfileImage(user),
            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                userNameDisplayText(user),
                userEmailText(user),
                SizedBox(
                  width: 300,
                  child: user.uid == 'user.isAnonymous.toString()'
                      ? const Text(
                          'Selamat datang, anonims!',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black, // <-- to change text colors.
                            fontSize: 16,
                            // fontFamily: '', //<-- TODO: Import Googlefonts.
                          ),
                        )
                      : Row(
                          children: [
                            Text(
                              user.emailVerified.toString(),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color:
                                    Colors.black, // <-- to change text colors.
                                fontSize: 16,
                                // fontFamily: '', //<-- TODO: Import Googlefonts.
                              ),
                            ),
                            user.emailVerified == 'not verified'
                                ? const Text('not verified')
                                : const Icon(Icons.verified)
                          ],
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  userNameDisplayText(User user) {
    return SizedBox(
      width: 300,
      child: 'user.isAnonymous' == user.displayName
          ? const Text('Anonymous')
          : Row(
              children: [
                Text(
                  user.displayName.toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black, // <-- to change text colors.
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    // fontFamily: '', //<-- TODO: Import Googlefonts.
                  ),
                ),
                user.emailVerified == 'not verified'
                    ? const Text('not verified')
                    : const Icon(
                        Icons.verified,
                        color: Colors.blue,
                      ),
              ],
            ),
    );
  }

  userEmailText(User user) {
    return SizedBox(
      width: 300,
      child: user.email != user.isAnonymous
          ? const Text('Anonymous')
          : Text(
              user.email!,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.black, // <-- to change text colors.
                fontSize: 16,
                // fontFamily: '', //<-- TODO: Import Googlefonts.
              ),
            ),
    );
  }

  genderIconButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.male,
              color: Colors.blue,
              size: 45,
            )),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.female,
            color: Colors.pink,
            size: 45,
          ),
        ),
      ],
    );
  }

  userProfileImage(User user) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          user.photoURL == 'user.isAnonymous'
              ? CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    user.photoURL!,
                  ),
                )
              : const CircleAvatar(
                  radius: 60,
                  backgroundImage: const AssetImage(
                    'assets/lisa.jpg',
                  ),
                ),
          if (user.emailVerified == 'not verified')
            const Text('not verified')
          else
            const Icon(
              Icons.verified,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }
}

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: Container(
              color: Colors.white,
            ),
          ),
          Container(
            color: Colors.white,
            child: const SpinKitFoldingCube(
              color: Colors.blue,
              duration: Duration(
                seconds: 3,
              ),
            ),
          ),
          Container(
            width: 60,
            color: Colors.white,
            child: SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.white : Colors.blue,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OldScaffold extends StatelessWidget {
  const OldScaffold({
    Key? key,
    required this.user,
    required this.height,
  }) : super(key: key);

  final User user;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(241, 81, 94, 1), // <-- Bottom Color Gradient
                  Color.fromRGBO(29, 189, 230, 1), // <-- Top Color Gradient
                ],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
              ),
            ),
          ),
          //Scaffold for
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 60,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.arrow_back, color: Colors.white),
                        //Create Logout Button Action.
                        IconButton(
                          onPressed: () {
                            // showDialog(
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       return AlertDialogLogOut();
                            //     });
                          },
                          icon: const Icon(Icons.logout),
                          color: Colors.white,
                        ),
                      ], // <-- This is topbar altenative children.
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //move this Name on the cards.
                    //TODO: get this some operat
                    SizedBox(
                        //solution is solved by only using an operator

                        child: user.displayName == "Anonymous"
                            ? const Text('Anonymous')
                            : Text(
                                'Hello, ' + user.displayName!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors
                                      .black, // <-- to change text colors.
                                  fontSize: 34,
                                  // fontFamily: '', //<-- TODO: Import Googlefonts.
                                ),
                              )),
                    const SizedBox(height: 25),
                    Container(
                      height: height * 0.43,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double innerHeight = constraints.maxHeight;
                          double innerWidth = constraints.maxWidth;
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: innerHeight * 0.72,
                                  width: innerWidth,
                                  decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    children: const [
                                      // const SizedBox(
                                      //   height: 10,
                                      // ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Great! You have created your first move!',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -150,
                                left: 0,
                                right: 0,
                                bottom: 0.8,
                                child: user.photoURL == "lisa"
                                    ? CircleAvatar(
                                        radius: 60,
                                        child: Image.asset(
                                          'assets/lisa.jpg',
                                        ),
                                      )
                                    : CircleAvatar(
                                        radius: 60,
                                        backgroundImage: NetworkImage(
                                          user.photoURL!,
                                        ),
                                      ),
                              ),
                              Positioned(
                                //change this to button.
                                top: 110,
                                right: 20,
                                child: ElevatedButton(
                                  child: const Text('Next'),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, route.homeScreenPage);
                                  },
                                ),
                                // Icon(Icons.settings,color: Colors.grey[700],size: 30,),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const ProfileDrawer(),
    );
  }
}

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: CircleAvatar(
              radius: 10,

              //to channel the current user photo profile
              // backgroundImage: NetworkImage(user.photoURL!),
            ),
          ),
          ListTile(
            title: const Text('Sign Out'),
            onTap: () {
              Navigator.pushNamed(context, route.loginPage);
              // final provider =
              //     Provider.of<GoogleSignInProvider>(context, listen: false);
              // provider.logout();
            },
          ),
        ],
      ),
    );
  }
}
