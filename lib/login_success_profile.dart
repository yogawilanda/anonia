import 'package:anonia/authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anonia/route/route.dart' as route;
import 'package:anonia/widget/show_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserLoginSuccess extends StatelessWidget {
  const UserLoginSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //this code will show user informations.
    final user = FirebaseAuth.instance.currentUser!;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onVerticalDragUpdate: (dragUpdateDetails) {
        Navigator.pushReplacementNamed(context, route.chatUIPage);
      },
      onHorizontalDragUpdate: (details) =>
          Navigator.restorablePopAndPushNamed(context, route.chatScreen),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text('User Profile'),
          centerTitle: true,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
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
                  padding: EdgeInsets.all(2),
                  clipBehavior: Clip.none,
                  child: Column(
                    children: [
                      mainContent(
                        width,
                        height,
                        user,
                      ),
                      // SizedBox(
                      //   height: 70,
                      //   child: Container(
                      //     color: Colors.white,
                      //   ),
                      // ),
                      // // Container(
                      //   color: Colors.white,
                      //   child: SpinKitFoldingCube(
                      //     color: Colors.blue,
                      //     duration: Duration(
                      //       seconds: 3,
                      //     ),
                      //   ),
                      // ),

                      // Container(
                      //   width: 60,
                      //   color: Colors.white,
                      //   child: SpinKitFadingCircle(
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return DecoratedBox(
                      //         decoration: BoxDecoration(
                      //           color:
                      //               index.isEven ? Colors.white : Colors.blue,
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // OldScaffold(user: user, height: height);
  }

  Container mainContent(double width, double height, User user) {
    return Container(
      // color: Colors.white,
      // margin: EdgeInsets.all(30),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 30,
            ),
            userProfileImage(user),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                userNameDisplayText(user),
                userEmailText(user),
                SizedBox(
                  width: 300,
                  child: user.uid == user.isAnonymous.toString()
                      ? Text(
                          'Selamat datang, anonims!',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.black, // <-- to change text colors.
                            fontSize: 16,
                            // fontFamily: '', //<-- TODO: Import Googlefonts.
                          ),
                        )
                      // : Text(
                      //     user.emailVerified.toString(),
                      //     textAlign: TextAlign.left,
                      //     style: const TextStyle(
                      //       color: Colors.black, // <-- to change text colors.
                      //       fontSize: 16,
                      //       // fontFamily: '', //<-- TODO: Import Googlefonts.
                      //     ),
                      //   ),
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
                                ? Text('not verified')
                                : Icon(Icons.verified)
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

  userNameDisplayText(User user) => SizedBox(
        width: 300,
        child: user.displayName == "Anonymous"
            ? Text('Anonymous')
            : Row(
                children: [
                  Text(
                    user.displayName.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black, // <-- to change text colors.
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      // fontFamily: '', //<-- TODO: Import Googlefonts.
                    ),
                  ),
                  user.emailVerified == 'not verified'
                      ? Text('not verified')
                      : Icon(
                          Icons.verified,
                          color: Colors.blue,
                        ),
                ],
              ),
      );

  userEmailText(User user) {
    return SizedBox(
      width: 300,
      child: user.email == "Anonymous"
          ? Text('Anonymous')
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
            icon: Icon(
              Icons.male,
              color: Colors.blue,
              size: 45,
            )),
        IconButton(
          onPressed: () {},
          icon: Icon(
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
          user.photoURL == "lisa"
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
          if (user.emailVerified == 'not verified')
            Text('not verified')
          else
            Icon(
              Icons.verified,
              color: Colors.blue,
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
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialogLogOut();
                                });
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
                            ? Text('Anonymous')
                            : Text(
                                'Hello, ' + user.displayName!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors
                                      .white70, // <-- to change text colors.
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
      drawer: ProfileDrawer(),
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
          DrawerHeader(
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

// class UserInformation extends StatelessWidget {
//   const UserInformation({
//     Key? key,
//     required this.user,
//   }) : super(key: key);

//   final User user;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Card(
//           elevation: 5,
//           child: Column(
//             children: [
//               const Text('This is your profile'),
//               CircleAvatar(
//                 radius: 8,
//                 //to channel the current user photo profile
//                 backgroundImage: NetworkImage(user.photoURL!),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 //to channel its name based on its email username.
//                 'Name: ' + user.displayName!,
//                 style: const TextStyle(color: Colors.amber, fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// this is original form as if the builds fails.

// @override
//   Widget build(BuildContext context) {
//     //this code will show user informations.
//     final user = FirebaseAuth.instance.currentUser!;
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.end,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width * 1,
//             height: MediaQuery.of(context).size.height * 0.7,
//             decoration: const BoxDecoration(
//               color: Colors.amber,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(25),
//                 topRight: Radius.circular(25),
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Card(
//                 elevation: 5,
//                 child: Column(
//                   children: [
//                     const Text('This is your profile'),
//                     CircleAvatar(
//                       radius: 80,
//                       //to channel the current user photo profile
//                       backgroundImage: NetworkImage(user.photoURL!),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       //to channel its name based on its email username.
//                       'Name: ' + user.displayName!,
//                       style: const TextStyle(color: Colors.amber, fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             DrawerHeader(
//               child: CircleAvatar(
//                 radius: 8,
//                 //to channel the current user photo profile
//                 backgroundImage: NetworkImage(user.photoURL!),
//               ),
//             ),
//             ListTile(
//               title: const Text('Sign Out'),
//               onTap: () {
//                 final provider =
//                     Provider.of<GoogleSignInProvider>(context, listen: false);
//                 provider.logout();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
