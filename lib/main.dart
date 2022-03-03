import 'package:anonia/appGate.dart';
import 'package:anonia/authenticator.dart';
import 'package:flutter/material.dart';
import 'route/route.dart' as route;
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'authenticator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const AnoniaApp());
}

class AnoniaApp extends StatelessWidget {
  const AnoniaApp({Key? key}) : super(key: key);
  static const String title = 'Anonia';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: AppGate(),
        onGenerateRoute: route.getRoute,
      ),
    );
  }
}
