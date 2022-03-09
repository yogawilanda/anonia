import 'package:flutter/material.dart';
<<<<<<< HEAD:lib/view/language_page.dart
import '../route/route.dart' as route;
=======
>>>>>>> master:lib/language_screen.dart

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Languages')),
    );
  }
}
