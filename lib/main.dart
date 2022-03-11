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

class AnoniaAppState extends State<AnoniaApp> {
  String title = 'Anonia';
  @override
  Widget build(BuildContext context) {
    const widget = Widget;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      title: title,
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
        background: Container(
          color: const Color(0xFFF5F5F5),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: route.getRoute,
    );
  }
}
