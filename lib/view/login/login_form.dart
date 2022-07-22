import 'package:flutter/material.dart';

import 'package:anonia/route/route.dart' as route;

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
    
    //Todo: Change this to sizedbox(if there is no width bugs) and padding 
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        key: formkey,
        child: Column(
          children: [
            //Textfield is a box that can be filled with user input keyboard
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Persona ID',
                ),
              ),
            ),

            //Passwords Field
            
            //Todo: Change this to sizedbox(if there is no width bugs) and padding 
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                decoration: const InputDecoration(
                  labelText: 'Your Treasure Key',
                ),
                obscureText: true,
              ),
            ),

            //ForgotPasswordButton
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    //Todo: refactor this name.
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
                  //Todo: refactor this name.
                  Navigator.pushNamed(context, route.homeScreenPage,
                      arguments: route.homeScreenPage);
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
