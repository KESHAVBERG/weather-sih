import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather/pages/AuthPages/login.dart';
import 'package:weather/pages/navigatorClass.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primarySwatch: Colors.blue,
        tabBarTheme: const TabBarTheme(
            indicator: UnderlineTabIndicator( // color for indicator (underline)
                borderSide: BorderSide(color: Colors.deepOrangeAccent))
        ),
      ),

      // home:FirebaseAuth.instance.currentUser != null? NavigatorClass():SignIn(),
      home:NavigatorClass()
    );
  }
}


