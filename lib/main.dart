import 'package:anonia/authentication/loginview.dart';
import 'package:anonia/login.dart';
import 'package:anonia/google_logged_in_widget.dart';
import 'package:anonia/authenticator.dart';
import 'package:anonia/home_screen.dart';
import 'package:anonia/login_success_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'route/route.dart' as route;
// import 'search_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:anonia/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'authenticator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(AnoniaApp());
}

class AnoniaApp extends StatelessWidget {
  const AnoniaApp({Key? key}) : super(key: key);
  static const String title = 'Anonia';
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          home: HomePage(),
          onGenerateRoute: route.getRoute,
        ),
      );
}

//if this code fail to do the task, restore #1
// class AnoniaApp extends StatelessWidget {
//   const AnoniaApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Provider(
//       create: (context) => HomePage(),
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Anonia',
//         home: HomePage(),
//         onGenerateRoute: route.getRoute,
//       ),
//     );
//   }
// }



// /----------------------#1-----------------------///
// class AnoniaApp extends StatefulWidget {
//   const AnoniaApp({Key? key}) : super(key: key);

//   @override
//   State<AnoniaApp> createState() =>
//       AnoniaAppState(); //this one should be follow the right code i guess

// }

// class AnoniaAppState extends State<AnoniaApp> {
//   final String title = 'Anonia';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: StreamBuilder<User?>(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return HomePage();
//             }

//             // Render your application if authenticated
//             return const Homescreen();
//           },
//         ),
//       ),
//     );
//   }
// }













// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     /// wrap MaterialApp in Provider widget
//     return ChangeNotifierProvider(
//       create: (context) => GoogleSignInProvider(), // ← create/init your state model
//       child: MaterialApp(
//           home: Homescreen(),
//           Navigator.of(MaterialApp).push(
//   MaterialPageRoute(builder: (MaterialAppContext) => route.homeScreenPage())
// )
//       ),
//     );
//   }
// //}