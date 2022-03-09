import 'package:anonia/authenticator.dart';
import 'package:anonia/protocoler/validator.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'route/route.dart' as route;
import 'package:provider/provider.dart';

//todo: use this to do toggler button
//toggle_switch 1.3.0 icon indicating copy to clipboard operation

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  //TODONE: create controller variables in here
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final formkey = GlobalKey<FormState>();

  @override
  // void dispose() {
  //   _text.dispose();
  //   super.dispose();
  // }

  void initState() {
    super.initState();

    _emailController.addListener(() {
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              width: 250,
              height: 250,
              child: Image.network(
                  'https://img.freepik.com/free-vector/people-putting-puzzle-pieces-together_52683-28610.jpg?size=626&ext=jpg',
                  fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: const TextSpan(
                  // Note: Styles for TextSpans must be explicitly defined.
                  // Child text spans will inherit styles from parent
                  style: TextStyle(
                    fontSize: 36,
                    letterSpacing: 4,
                    color: Colors.blue,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Anonia',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Form(
              key: formkey,
              child: Card(
                elevation: 0,
                child: Column(
                  children: [
                    SizedBox(height: height * 0.08),
                    //textfield is a box that can be filled with user input keyboard
                    //TODO:Create A Validator for textfield 1
                    TextFormField(
                      //create the controller
                      controller: _emailController,

                      decoration: const InputDecoration(
                        labelText: 'Enter Your Anonia ID',
                        //errorText:
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    //
                    TextFormField(
                      //create the controller
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,

                      decoration: const InputDecoration(
                        labelText: 'Your Treasure Key',
                      ),
                      obscureText: true,
                      //enter your node here
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, route.forgotPasswordScreen);
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    //Buttonbar goes BRRRRR~!
                    ElevatedButton(
                      onPressed: () async {},
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                //--Login Anonymously Button--//
                SizedBox(
                  height: height * 0.01,
                ),
                //IconButtons row
                SizedBox(
                  width: width * 1,
                  height: height * 0.1,
                  child: Column(
                    children: [
                      const Text('Sign in faster with'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Twitter Login Method
                          IconButton(
                            onPressed: () {
                              final provider =
                                  Provider.of<GoogleSignInProvider>(context,
                                      listen: false);
                              provider.googleLogin();
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.twitter,
                              color: Colors.blue,
                            ),
                          ),
                          //Facebook Login Button UI
                          IconButton(
                            onPressed: () {
                              final provider =
                                  Provider.of<GoogleSignInProvider>(context,
                                      listen: false);
                              provider.googleLogin();
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue,
                            ),
                          ),
                          //Google Sign In Button
                          IconButton(
                            onPressed: () {
                              final provider =
                                  Provider.of<GoogleSignInProvider>(context,
                                      listen: false);
                              provider.googleLogin();
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.blue,
                            ),
                            // label: const Text('Login with Google'),
                          ),
                          IconButton(
                            onPressed: () {
                              //TODO: find a way to resolve creating this user.
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Hang on, this sign in method still under maintenance, use google sign in instead!')));
                              //TODO DONT DELETE THIS
                              final provider =
                                  Provider.of<GoogleSignInProvider>(context,
                                      listen: false);
                              provider.signInAnonymously();
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.mask,
                              color: Colors.blue,
                            ),
                            // label: const Text('Login with Google'),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <InlineSpan>[
                const TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(color: Colors.black87)),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, route.registerPage);
                      },
                    text: 'Register',
                    style: const TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold)),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

//Elevater Icon with Text Button
// ElevatedButton.icon(
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.amber,
//                           onPrimary: Colors.black,
//                         ),
//                         onPressed: () {
//                           final provider = Provider.of<GoogleSignInProvider>(
//                               context,
//                               listen: false);
//                           provider.googleLogin();
//                         },
//                         icon: const FaIcon(
//                           FontAwesomeIcons.google,
//                           color: Colors.red,
//                         ),
//                         label: const Text('Login with Google')),

//ElevatedButton Icon Example with its routing.
// ElevatedButton.icon(
//                       key: _loginAnonymousKey,
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.blue,
//                         // <--- Layout button color
//                         onPrimary:
//                             Colors.white, // <--- Text Layout button Color
//                       ),
//                       onPressed: () {
//                         Navigator.pushNamed(context, route.homeScreenPage);
//                       },
//                       icon: const FaIcon(
//                         FontAwesomeIcons.mask,
//                         color: Colors.white,
//                       ),
//                       label: const Text('Login Anonymously'),
//                     ),

//Elevated Button Example.
// ElevatedButton(
//   onPressed: () {
//     Navigator.pushNamed(context, route.registerPage);
//   },
//   child: const Text("Register"),
// ),

//RichText Button Altenative.
// Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 const Text('Do you forget your password?'),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, route.forgotPasswordScreen);
//                   },
//                   child: const Text('Tap here'),
//                 ),
//               ],
//             ),
