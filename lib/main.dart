import 'package:anonia/view/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:responsive_framework/responsive_framework.dart';

import 'authentication/google_sign_in.dart';
import 'authentication/appGate.dart';
import 'route/route.dart' as route;

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AnoniaApp());
}

class Authenticator {
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }
}

class AnoniaApp extends StatefulWidget {
  const AnoniaApp({Key? key}) : super(key: key);

  @override
  State<AnoniaApp> createState() => AnoniaAppState();
}

class AnoniaAppState extends State<AnoniaApp> with ChangeNotifier {
  String title = 'Anonia';

  @override
  Widget build(BuildContext context) {
    // const widget = Widget;

    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      builder: (context, widget) => MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData.dark(),
        onGenerateRoute: route.getRoute,
        initialRoute: '/',
        // home: const AppGate(), // C
        builder: (context, widget) => ResponsiveWrapper.builder(
          widget,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE), // Change this to 512 and refactor to a variable names
            const ResponsiveBreakpoint.autoScale(1366, name: TABLET), // 
            const ResponsiveBreakpoint.resize(1366, name: DESKTOP), //
          ],
          background: const AppGate(),

          // child: const AppGate(),
        ),
        // home: LoginPage(),
      ),
      // home: ChatPage(),
    );

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,

    //   theme: ThemeData.dark(),
    //   title: title,
    //   builder: (context, widget) =>
    //
    // ResponsiveWrapper.builder(
    //     widget,
    //     maxWidth: MediaQuery.of(context).size.width,
    //     minWidth: 480,
    //     defaultScale: true,
    //     breakpoints: [
    //       const ResponsiveBreakpoint.resize(480, name: MOBILE),
    //       const ResponsiveBreakpoint.autoScale(1366, name: TABLET),
    //       const ResponsiveBreakpoint.resize(1366, name: DESKTOP),
    //     ],
    //     background: Container(
    //       color: const Color(0xFFF5F5F5),
    //     ),
    //   ),
    //   // home: ChatPage(),
    //   onGenerateRoute: route.getRoute,
    //   initialRoute: '/',
    // );
  }

  themeManagement() {
    const Color secondDark = Color.fromARGB(221, 39, 39, 39);
    const Color complementary = Color.fromARGB(221, 216, 213, 213);
    const Color mainDark = Color.fromARGB(221, 26, 26, 30);
    return ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 37, 36, 36),
        primaryTextTheme: const TextTheme(
          button: TextStyle(color: Colors.white),
        ),
        appBarTheme: const AppBarTheme(
          color: mainDark,
          actionsIconTheme: IconThemeData(
            color: complementary,
          ),
          titleTextStyle: TextStyle(
            color: complementary,
          ),
          iconTheme: IconThemeData(
            color: mainDark,
          ),
        ),
        cardTheme: const CardTheme(
          color: secondDark,
          shadowColor: mainDark,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: complementary,
          ),
          caption: TextStyle(
            color: complementary,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: mainDark,
          focusColor: mainDark,
          foregroundColor: secondDark,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: mainDark,
        ),
        iconTheme: IconTheme.of(context));
  }
}
