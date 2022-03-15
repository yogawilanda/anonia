import 'package:anonia/route/google_sign_in.dart';
import 'package:anonia/view/login/desktop_login.dart';
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

class MobileViewLogin extends StatelessWidget {
  const MobileViewLogin({
    Key? key,
    required this.formkey,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required FocusNode passwordFocusNode,
  })  : _usernameController = usernameController,
        _passwordController = passwordController,
        _passwordFocusNode = passwordFocusNode,
        super(key: key);

  final GlobalKey<FormState> formkey;
  final TextEditingController _usernameController;
  final TextEditingController _passwordController;
  final FocusNode _passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          //spacer
          const SizedBox(height: 40.0),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),

              //Image Hero
              Container(
                width: 300,
                height: 300,
                child: Image.network(
                    'https://img.freepik.com/free-vector/people-putting-puzzle-pieces-together_52683-28610.jpg?size=626&ext=jpg',
                    fit: BoxFit.scaleDown,
                    scale: 2),
              ),

              //Simple Spacer
              const SizedBox(
                height: 20.0,
              ),

              //Title on Login Page
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.blue,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Anonia',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //Forms properties
          FormLogin(
              formkey: formkey,
              usernameController: _usernameController,
              passwordController: _passwordController,
              passwordFocusNode: _passwordFocusNode),

          //Quick Login Buttons
          QuickLogin(),

          //Register Actions
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account yet?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, route.registerPage);
                  },
                  child: const Text("Register"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuickLogin extends StatelessWidget {
  const QuickLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          const Text(
            'Sign in faster with',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blue),
          ),
          const SizedBox(
            height: 10,
          ),
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
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
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

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key? key,
    required this.formkey,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required FocusNode passwordFocusNode,
  })  : _usernameController = usernameController,
        _passwordController = passwordController,
        _passwordFocusNode = passwordFocusNode,
        super(key: key);

  final GlobalKey<FormState> formkey;
  final TextEditingController _usernameController;
  final TextEditingController _passwordController;
  final FocusNode _passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        key: formkey,
        child: Column(
          children: [
            //Textfield is a box that can be filled with user input keyboard
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Enter Your Persona ID',
              ),
            ),

            //Manual Spacer
            const SizedBox(height: 12.0),

            //Passwords Field
            TextField(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              decoration: const InputDecoration(
                labelText: 'Your Treasure Key',
              ),
              obscureText: true,
            ),
            //ForgotPasswordButton
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, route.forgotPasswordScreen);
                  },
                  child: const Text('Forget your password?'),
                ),
              ],
            ),

            //LoginButton
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, route.homeScreenPage);
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
