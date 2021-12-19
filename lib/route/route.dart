// import 'dart:js';

import 'package:anonia/login_success_profile.dart';
import 'package:anonia/register.dart';
// import 'package:anonia/google_logged_in_widget.dart';
import 'package:anonia/messaging.dart';
import 'package:flutter/material.dart';
import 'package:anonia/login.dart';
import 'package:anonia/home_screen.dart';
// import '../messaging.dart';
import 'package:anonia/language_screen.dart';
import 'package:anonia/settings_page.dart';
import 'package:anonia/search_screen.dart';
// import 'package:anonia/authentication/forgot_pass_screen.dart';

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
const String loginSuccess = 'loginsuccessscreen';

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

    case searchScreen:
      return MaterialPageRoute(builder: (context) => const SearchScreen());

    case loginSuccess:
      return MaterialPageRoute(builder: (context) => const UserLoginSuccess());

    default:
      throw ('this route is still on the hustle');
  }
}


 // case forgotPasswordScreen:
    //   return MaterialPageRoute(
    //       builder: (context) => const ForgotPasswordWidget());