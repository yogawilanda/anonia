import 'package:anonia/authentication/authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../route/route.dart' as route;
import '../../model/validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  //TODONE: create controller variables in here
  final _formRegisterKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _usernameRegisterFocusNode = FocusNode();
  final _passwordRegisterFocusNode = FocusNode();
  final email = String;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        //
      });
    });
    _passwordController.addListener(() {
      setState(() {
        //
      });
    });
    _emailFocusNode.addListener(() {
      setState(() {});
    });
    _passwordRegisterFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 70),
            //Header of register page.
            const Text(
              'Let\'s Join Our Nice Community',
              style: TextStyle(
                fontSize: 28,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              width: 300,
              height: 300,
              //Image Network widget is not const, so you cant use const in the parent widget
              child: Image.network(
                  'https://img.freepik.com/free-vector/people-putting-puzzle-pieces-together_52683-28610.jpg?size=626&ext=jpg'),
            ),

            //Forms for register
            Form(
              key: _formRegisterKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //email register form
                  TextFormField(
                    //create the controller
                    controller: _usernameController,
                    focusNode: _usernameRegisterFocusNode,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: (value) =>
                        Validator.validateName(name: value.toString()),
                    //new validator rule, if the the string is not empty, it is equal to should not be null
                  ),

                  //Create a password to authenticate
                  TextFormField(
                    //create the controller
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    //new validator rule, if the the string is not empty, it is equal to should not be null
                    validator: (value) =>
                        Validator.validateEmail(email: value.toString()),
                  ),

                  //password register actions
                  TextFormField(
                    //create the controller
                    controller: _passwordController,
                    focusNode: _passwordRegisterFocusNode,
                    decoration: const InputDecoration(
                      labelText: 'Your Treasure Key',
                    ),
                    obscureText: true,
                    validator: (value) =>
                        Validator.validatePassword(password: value.toString()),
                  ),
                  const SizedBox(height: 32.0),
                  _isProcessing

                      //if form requirement doesn't meet its fullfillment, user will be asked to modify his/her data.
                      ? const CircularProgressIndicator()

                      //if form were correct, user will be directed to profile.
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                if (_formRegisterKey.currentState!.validate()) {
                                  User? user = await SignWithEmail
                                      .registerUsingEmailPassword(
                                    name: _usernameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );

                                  setState(() {
                                    _isProcessing = false;
                                  });

                                  if (_formRegisterKey.currentState!
                                      .validate()) {
                                    Navigator.pushNamed(
                                        context, route.loginPage);
                                    // setState(() {
                                    //   _isProcessing = true;
                                    // });
                                  }
                                }
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
