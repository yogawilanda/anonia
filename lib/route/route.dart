import 'package:anonia/ui/register.dart';
import 'package:flutter/material.dart';
import '../ui/login.dart';
import 'package:anonia/home_screen.dart';
import '../messaging.dart';

//Navigation Protocol for this app
const String loginPage = '/';
const String registerPage = 'register';
const String homeScreenPage = 'homescreen';
const String chatUIPage = 'homescreen';
const String chatScreen = 'chatscreen';

Route<dynamic>? getRoute(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    // case registerPage:
    //   return MaterialPageRoute(builder: (context) => registerPage());
    case homeScreenPage:
      return MaterialPageRoute(builder: (context) => Homescreen());

    case registerPage:
      return MaterialPageRoute(builder: (context) => const RegisterPage());

    case chatScreen:
      return MaterialPageRoute(builder: (context) => const ChatScreen());
    default:
      throw ('this route is still on the hustle');
  }
}
