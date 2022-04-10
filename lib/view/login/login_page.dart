import 'package:anonia/authentication/google_sign_in.dart';
import 'package:anonia/view/login/desktop_login.dart';
import 'package:anonia/view/login/mobile_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../../route/route.dart' as route;
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  //TODONE: create controller variables in here
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _loginAnonymousKey = GlobalKey();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {
      setState(() {
        //
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        //
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    double mobileViewConstraint = 600;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > mobileViewConstraint) {
            return DesktopViewLogin(
                formkey: formkey,
                usernameController: _usernameController,
                passwordController: _passwordController,
                passwordFocusNode: _passwordFocusNode);
          } else {
            return MobileViewLogin(
                formkey: formkey,
                usernameController: _usernameController,
                passwordController: _passwordController,
                passwordFocusNode: _passwordFocusNode);
          }
        },
      ),
    );
  }

  String passwordValidator(String value) {
    if (value.isEmpty) {
      return "*Masukan Password kamu dahulu";
    } else if (value.length < 6) {
      return "Password minimal 6 digit";
    }
    return 'Password benar';
  }

  String userIdValidator(String value) {
    if (value.isEmpty) {
      return "*Masukan Password kamu dahulu";
    } else if (value.length < 6) {
      return "Password minimal 6 digit";
    }
    return 'Password benar';
  }
}

class QuickLogin extends StatelessWidget {
  const QuickLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          const Text(
            'Sign in faster with',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blue),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              //Anonymous Login
              IconButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                icon: FaIcon(
                  FontAwesomeIcons.mask,
                  color: Colors.blue,
                ),
              ),
              //Google Login
              IconButton(
                onPressed: () async {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                  // Navigator.pushNamed(context, route.homeScreenPage);
                },
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.blue,
                ),
              ),

              //Facebook Login
              IconButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                ),
              ),
              //Facebook Login
              IconButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                icon: FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Colors.blue,
                ),
              ),

              //Facebook Login
              IconButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                icon: FaIcon(
                  FontAwesomeIcons.phone,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
