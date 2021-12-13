// import 'package:anonia/home_screen.dart';
// import 'package:anonia/route/route.dart';
// import 'package:anonia/ui/login.dart';
// import 'package:anonia/ui/register.dart';
import 'package:anonia/login.dart';
import 'package:anonia/google_logged_in_widget.dart';
import 'package:anonia/google_sign_in.dart';
import 'package:anonia/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'route/route.dart' as route;
// import 'search_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:anonia/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(AnoniaApp());
}

//if this code fail to do the task, restore #1

// class AnoniaApp extends StatelessWidget {
//   const AnoniaApp({Key? key}) : super(key: key);
//   static final String title = 'Anonia';
//   @override
//   Widget build(BuildContext context) => ChangeNotifierProvider(
//         create: (context) => GoogleSignInProvider(),
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: title,
//           home: HomePage(),
//           onGenerateRoute: route.getRoute,
//         ),
//       );
// }

// /----------------------#1-----------------------///
class AnoniaApp extends StatefulWidget {
  const AnoniaApp({Key? key}) : super(key: key);

  @override
  State<AnoniaApp> createState() =>
      AnoniaAppState(); //this one should be follow the right code i guess

}

class AnoniaAppState extends State<AnoniaApp> {
  static final String title = 'Anonia';
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          home: HomePage(),
          // initialRoute: '/',
          // onGenerateRoute: route.getRoute,

          // TODO: Pindahkan ThemeData ini ke theme data file terpisah

          // TODO: Buat routing setelah pembuatan login interface selesai
        ),
      );
}













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