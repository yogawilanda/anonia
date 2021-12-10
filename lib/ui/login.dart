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

  Future<void> _signInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }

  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: [
                const SizedBox(height: 80.0),
                Column(
                  children: [
                    //img
                    //Image.asset(
                    //'Place logo here'),
                    const SizedBox(height: 16.0),
                    const Text('Anonia',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                        )),
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

                //this one is textfield boxification
                const SizedBox(height: 60.0),
                //textfield is a box that can be filled with user input keyboard
                //TODO:Create A Validator for textfield 1
                TextField(
                  //create the controller
                  controller: _usernameController,

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
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, route.homeScreenPage);
                      },
                      //async {await AuthServices.signInAnonymous();},
                      child: const Text('Login Anonymously'),
                    ),
                    TextButton(
                      //still unfunctional give it snackbar
                      // it said I/flutter (22164): [core/no-app] No Firebase App '[DEFAULT]' has been created - call Firebase.initializeApp()
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Still under services, use login anonymously instead!')));
                        //
                        //                       if (priceController.text == "") {
                        //     showDialog(
                        //         context: context,
                        //         builder: (BuildContext context) {
                        //           return AlertDialog(
                        //             title: Text("Enter a price"),
                        //           );
                        //         });
                        //   } else {
                        //     apiRequest(url, {'price': priceController.text, 'user_id': "user2"});
                        //   }
                        // },
                        // final snackBar = SnackBar(
                        //   content: Text('Sorry, Still under development'),
                        //   action: SnackBarAction(
                        //     label: 'Undo',
                        //     onPressed: () {
                        //       // Some code to undo the change.
                        //     },
                        //   ),
                        // );
                        // _signInAnonymously();
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
                        Navigator.pushNamed(
                            context, route.forgotPasswordScreen);
                      },
                      child: const Text('Tap here'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
