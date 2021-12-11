// import 'package:anonia/home_screen.dart';
// import 'package:anonia/route/route.dart';
// import 'package:anonia/ui/login.dart';
// import 'package:anonia/ui/register.dart';
import 'package:anonia/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'route/route.dart' as route;
// import 'search_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:anonia/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const AnoniaApp());
}

class AnoniaApp extends StatefulWidget {
  const AnoniaApp({Key? key}) : super(key: key);

  @override
  State<AnoniaApp> createState() =>
      AnoniaAppState(); //this one should be follow the right code i guess

}

class AnoniaAppState extends State<AnoniaApp> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Anonia',
          // home: SearchScreen(),
          initialRoute: '/',
          onGenerateRoute: route.getRoute,

          // TODO: Pindahkan ThemeData ini ke theme data file terpisah

          // TODO: Buat routing setelah pembuatan login interface selesai
        ),
      );
}
