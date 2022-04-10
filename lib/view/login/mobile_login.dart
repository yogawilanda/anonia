import 'package:anonia/view/login/login_form.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

import 'package:anonia/route/route.dart' as route;

class MobileViewLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          //spacer
          // const SizedBox(height: 40.0),
          Column(
            children: [
              //Image Hero
              Container(
                margin: const EdgeInsets.only(top: 60),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/anonia-logo.png'),
                    opacity: 0.6,
                    colorFilter: ColorFilter.mode(
                        Colors.grey.shade600, BlendMode.overlay),
                  ),
                  // borderRadius: BorderRadius.circular(30),
                ),
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
          const QuickLogin(),

          //Register Actions
          Expanded(
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
  // static Image headerLoginImage = Image(
  //   image: NetworkImage(
  //       'https://img.freepik.com/free-vector/people-putting-puzzle-pieces-together_52683-28610.jpg?size=626&ext=jpg',
  //       scale: 2),
  // );
}
