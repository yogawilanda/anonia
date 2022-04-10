import 'package:anonia/authentication/authenticator.dart';
import 'package:anonia/authentication/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../route/route.dart' as route;
import '../../authentication/validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  //TODONE: create controller variables in here
  final formRegisterKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final usernameRegisterFocusNode = FocusNode();
  final passwordRegisterFocusNode = FocusNode();
  final email = String;
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
        //
      });
    });
    passwordController.addListener(() {
      setState(() {
        //
      });
    });
    emailFocusNode.addListener(() {
      setState(() {});
    });
    passwordRegisterFocusNode.addListener(() {
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
              key: formRegisterKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //email register form
                  TextFormField(
                    //create the controller
                    controller: usernameController,
                    focusNode: usernameRegisterFocusNode,
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
                    controller: emailController,
                    focusNode: emailFocusNode,
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
                    controller: passwordController,
                    focusNode: passwordRegisterFocusNode,
                    decoration: const InputDecoration(
                      labelText: 'Your Treasure Key',
                    ),
                    obscureText: true,
                    validator: (value) =>
                        Validator.validatePassword(password: value.toString()),
                  ),
                  const SizedBox(height: 32.0),
                  isProcessing

                      //if form requirement doesn't meet its fullfillment, user will be asked to modify his/her data.
                      ? const CircularProgressIndicator()

                      //if form were correct, user will be directed to profile.
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                if (formRegisterKey.currentState!.validate()) {
                                  User? user = await GoogleSignWithEmail
                                      .registerUsingEmailPassword(
                                    name: usernameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );

                                  setState(() {
                                    isProcessing = false;
                                  });

                                  if (formRegisterKey.currentState!
                                      .validate()) {
                                    Navigator.pushNamed(
                                        context, route.loginPage);
                                    // setState(() {
                                    //   isProcessing = true;
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
