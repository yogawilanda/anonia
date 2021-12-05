import 'package:anonia/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../route/route.dart' as route;
import 'package:flutter/services.dart';

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

  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        child: Scaffold(
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
                    const SizedBox(height: 20.0),
                    Container(
                      width: 300,
                      height: 300,
                      child: Image.network(
                          'https://img.freepik.com/free-vector/people-putting-puzzle-pieces-together_52683-28610.jpg?size=626&ext=jpg'),
                    ),
                  ],
                ),

                //this one is textfield boxification
                const SizedBox(height: 60.0),
                //textfield is a box that can be filled with user input keyboard

                //TODO:Create A Validator for textfield 1

                const TextField(
                  //create the controller
                  //controller: _usernameController,
                  //controller: _text,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Persona ID',
                    //errorText:
                  ),
                ),
                const SizedBox(height: 12.0),

                //
                const TextField(
                  //create the controller
                  //controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Your Treasure Key',
                  ),
                  obscureText: true,
                  //enter your node here
                ),

                //Buttonbar goes BRRRRR~!
                ButtonBar(
                  children: [
                    TextButton(
                      onPressed: () {},
                      //async {await AuthServices.signInAnonymous();},
                      child: const Text('Login Anonymously'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, route.homeScreenPage);
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
                    child: const Text("Register")),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      );
    });
  }
}
