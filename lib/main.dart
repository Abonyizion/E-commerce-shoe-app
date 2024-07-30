import 'package:authentication/models/cart.dart';
import 'package:authentication/pages/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:
   const FirebaseOptions(
      apiKey: "AIzaSyDCOLKy4_sNIs2ZHFLNTwADc4B6dvYWY_E",
      appId: "1:373524725423:android:38beb9458f18548d005e5a",
      messagingSenderId: '373524725423',
      projectId: "authentication-7d55f",));
  runApp(const MyApp());}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple),
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Navigator.maybePop(context);
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
      ),
    ),
    );
  }
}


