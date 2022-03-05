import 'package:anonia/view/login.dart';
import 'package:anonia/route/authenticator.dart';
import 'package:anonia/route/google_sign_in.dart';
import 'package:anonia/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'route/route.dart' as route;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const AnoniaApp());
}

class AnoniaApp extends StatefulWidget {
  const AnoniaApp({Key? key}) : super(key: key);

  @override
  State<AnoniaApp> createState() => AnoniaAppState();
}

class AnoniaAppState extends State<AnoniaApp> {
  String title = 'Anonia';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      title: title,
      home: const LoginPage(),
      initialRoute: '/',
      onGenerateRoute: route.getRoute,
    );
  }
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