import 'package:flutter/material.dart';

import 'package:responsive_framework/responsive_framework.dart';

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

class AnoniaApp extends StatefulWidget {
  const AnoniaApp({Key? key}) : super(key: key);

  @override
  State<AnoniaApp> createState() => AnoniaAppState();
}

class AnoniaAppState extends State<AnoniaApp> with ChangeNotifier {
  String title = 'Anonia';

  @override
  Widget build(BuildContext context) {
    const widget = Widget;

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark(),
      title: title,
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        maxWidth: MediaQuery.of(context).size.width,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(1366, name: TABLET),
          const ResponsiveBreakpoint.resize(1366, name: DESKTOP),
        ],
        background: Container(
          color: const Color(0xFFF5F5F5),
        ),
      ),
      // home: ChatPage(),
      onGenerateRoute: route.getRoute,
      initialRoute: '/',
    );
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
