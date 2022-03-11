import 'package:anonia/route/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../route/route.dart' as route;
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
    return Scaffold(
      body: Container(
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
                RichText(
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
              ],
            ),

            //Forms properties
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
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
                            Navigator.pushNamed(
                                context, route.forgotPasswordScreen);
                          },
                          child: const Text('Forget your password?'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //LoginButton
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, route.homeScreenPage);
              },
              child: const Text('Login'),
              style: ButtonStyle(),
            ),

            //Quick Login Buttons
            Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Text(
                    'Sign in faster with',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Anonymous Login
                      IconButton(
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
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
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
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
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
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
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
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
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
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
            ),

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
