// import 'package:anonia/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../route/route.dart' as route;
import 'forgot_pass_screen.dart';
// import 'package:flutter/services.dart';

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

  @override
  // void dispose() {
  //   _text.dispose();
  //   super.dispose();
  // }

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

  // Future<void> _signInAnonymously() async {
  //   try {
  //     await FirebaseAuth.instance.signInAnonymously();
  //   } catch (e) {
  //     print(e); // TODO: show dialog with error
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            const SizedBox(height: 80.0),
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: formkey,
              child: Column(
                children: [
                  //img
                  //Image.asset(
                  //'Place logo here'),
                  // const SizedBox(height: 16.0),
                  RichText(
                    text: const TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.blue,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: ''),
                        TextSpan(
                          text: 'Anonia',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.network(
                        'https://img.freepik.com/free-vector/people-putting-puzzle-pieces-together_52683-28610.jpg?size=626&ext=jpg'),
                  ),
                ],
              ),
            ),

            //this one is textfield boxification
            const SizedBox(height: 60.0),
            //textfield is a box that can be filled with user input keyboard
            //TODO:Create A Validator for textfield 1
            TextFormField(
              //create the controller
              controller: _usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  Navigator.pushNamed(context, route.homeScreenPage);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Oops, kamu lupa masukkan password nih')));
                }
              },

              decoration: const InputDecoration(
                labelText: 'Enter Your Persona ID',
                //errorText:
              ),
            ),
            const SizedBox(height: 12.0),
            //
            TextField(
              //create the controller
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              decoration: const InputDecoration(
                labelText: 'Your Treasure Key',
              ),
              obscureText: true,
              //enter your node here
            ),
            //Buttonbar goes BRRRRR~!
            ButtonBar(
              children: [
                //--Login Anonymously Button--//
                TextButton(
                  key: _loginAnonymousKey,
                  child: const Text('Login Anonymously'),
                  onPressed: () {
                    Navigator.pushNamed(context, route.homeScreenPage);
                    // Navigator.pushNamed(context, route.homeScreenPage);
                  },
                  //async {await AuthServices.signInAnonymous();},
                ),
                //login Button//
                TextButton(
                  //still unfunctional give it snackbar
                  // it said I/flutter (22164): [core/no-app] No Firebase App '[DEFAULT]' has been created - call Firebase.initializeApp()
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Still under services, use login anonymously instead!')));
                  },

                  child: const Text('Login'),
                ),
              ],
            ),
            const Spacer(flex: 1),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, route.registerPage);
              },
              child: const Text("Register"),
            ),
            const Spacer(flex: 1),
            Row(
              children: [
                const Text('Do you forget your password?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, route.forgotPasswordScreen);
                  },
                  child: const Text('Tap here'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
