import 'package:anonia/ui/register.dart';
import 'package:flutter/material.dart';
import '../ui/login.dart';
import 'package:anonia/home_screen.dart';
import '../messaging.dart';
import 'package:anonia/language_screen.dart';
import 'package:anonia/settings_page.dart';
import 'package:anonia/search_screen.dart';
import 'package:anonia/ui/forgot_pass_screen.dart';

//Navigation Protocol for this app
const String loginPage = '/';
const String registerPage = 'register';
const String homeScreenPage = 'homescreen';
const String chatUIPage = 'homescreen';
const String chatScreen = 'chatscreen';
const String settingsScreen = 'settings';
const String languageScreen = 'languagescreen';
const String searchScreen = 'searchscreen';
const String forgotPasswordScreen = 'forgotpasswordcreen';

Route<dynamic>? getRoute(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    // case registerPage:
    //   return MaterialPageRoute(builder: (context) => registerPage());
    case homeScreenPage:
      return MaterialPageRoute(builder: (context) => const Homescreen());

    case registerPage:
      return MaterialPageRoute(builder: (context) => const RegisterPage());

    case chatScreen:
      return MaterialPageRoute(builder: (context) => const ChatScreen());

    case settingsScreen:
      return MaterialPageRoute(builder: (context) => const SettingsScreen());

    case languageScreen:
      return MaterialPageRoute(builder: (context) => const LanguagesScreen());
    // case forgotPasswordScreen:
    //   return MaterialPageRoute(
    //       builder: (context) => const ForgotPasswordWidget());

    case searchScreen:
      return MaterialPageRoute(builder: (context) => const SearchScreen());

    default:
      throw ('this route is still on the hustle');
  }
}
