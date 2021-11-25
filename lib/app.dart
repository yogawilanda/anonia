import 'package:flutter/material.dart';
import 'home_screen.dart';

import 'login.dart';
import 'package:anonia/home_screen.dart';
import 'dart:ui';

//this sc will be work as general appereance of this app. Including ThemeData, Navigation Routing, and TextTheme

class AnoniaApp extends StatefulWidget {
  const AnoniaApp({Key? key}) : super(key: key);

  @override
  State<AnoniaApp> createState() =>
      _AnoniaAppState(); //this one should be follow the right code i guess

}

class _AnoniaAppState extends State<AnoniaApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anonia',
      home: Homescreen(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      //TODO: Buat routing setelah pembuatan login interface selesai
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const LoginPage(),
      fullscreenDialog: true,
    );
  }
}
