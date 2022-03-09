import 'package:flutter/material.dart';
import 'dart:ui';
import '../../route/route.dart' as route;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  //TODONE: create controller variables in here
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  // final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

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

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 20.0),
            Column(
              children: [
                //img
                //Image.asset(
                //'Place logo here'),
                const SizedBox(height: 16.0),

                //Header of this page.
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
              ],
            ),
            //this one is textfield boxification
            const SizedBox(height: 60.0),
            //textfield is a box that can be filled with user input keyboard

            //TODO:Create A Validator for textfield 1

            const TextField(
              //create the controller
              //controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Create Your Persona ID',
              ),
            ),
            const SizedBox(height: 12.0),

            //Password
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Your Email',
              ),
            ),
            const SizedBox(height: 12.0),

            //
            TextField(
              //create the controller
              controller: _passwordController,
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
                  child: const Text('Login Anonymously'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Register'),
                ),
              ],
            ),
            const Spacer(flex: 1),

            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, route.loginPage);
                },
                child: const Text("Register")),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}





// Study case of validators
// Create a corresponding State class.
// This class holds data related to the form.
// class MyCustomFormState extends State<MyCustomForm> {
// Create a global key that uniquely identifies the Form widget
// and allows validation of the form.
//
// Note: This is a GlobalKey<FormState>,
// not a GlobalKey<MyCustomFormState>.
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
// Build a Form widget using the _formKey created above.
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextFormField(
// The validator receives the text that the user has entered.
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: ElevatedButton(
//               onPressed: () {
// Validate returns true if the form is valid, or false otherwise.
//                 if (_formKey.currentState!.validate()) {
// If the form is valid, display a snackbar. In the real world,
// you'd often call a server or save the information in a database.
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Processing Data')),
//                   );
//                 }
//               },
//               child: const Text('Submit'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }