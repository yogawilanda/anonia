import 'package:anonia/view/login/login_form.dart';
import 'package:anonia/view/login/login_page.dart';
import 'package:flutter/material.dart';

class DesktopViewLogin extends StatelessWidget {
  const DesktopViewLogin({
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
      child: Row(
        children: [
          //Visual Section
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('This is Desktop View')),
                //spacer
                const SizedBox(height: 40.0),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
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

                    //Simple Spacer
                    const SizedBox(
                      height: 20.0,
                    ),

                    //Image Hero
                    Container(
                      width: 300,
                      height: 300,
                      child: Image.network(
                          'https://img.freepik.com/free-vector/people-putting-puzzle-pieces-together_52683-28610.jpg',
                          fit: BoxFit.scaleDown,
                          scale: 2),
                    ),
                  ],
                ),

                //Forms properties
              ],
            ),
          ),

          //InputSection
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 19,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 300,
                    child: FormLogin(
                        formkey: formkey,
                        usernameController: _usernameController,
                        passwordController: _passwordController,
                        passwordFocusNode: _passwordFocusNode),
                  ),
                ),
                QuickLogin(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
