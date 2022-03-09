// import 'package:anonia/authentication/google_sign_in.dart';
// import 'dart:html';

import 'package:anonia/route/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anonia/route/route.dart';

class UserLoginSuccess extends StatelessWidget {
  const UserLoginSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //this code will show user informations.
    final user = FirebaseAuth.instance.currentUser!;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                      children: const [
                        Icon(Icons.arrow_back, color: Colors.white),
                        //Create Logout Button Action.
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                      ], // <-- This is topbar altenative children.
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //move this Name on the cards.
                    Text(
                      'Hello, ' + user.displayName!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white70, // <-- to change text colors.
                        fontSize: 34,
                        // fontFamily: '', //<-- TODO: Import Googlefonts.
                      ),
                    ),
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
                                child: Center(
                                  child: CircleAvatar(
                                    // padding: EdgeInsets.only(left: 12),

                                    child: Image.asset(
                                      'assets/lisa.jpg',
                                      // width: innerWidth * 0.45,
                                      fit: BoxFit.cover,
                                    ),
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
                                        context, homeScreenPage);
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
