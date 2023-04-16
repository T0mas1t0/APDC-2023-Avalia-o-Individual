import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:avaliacao_individual/auth/login.dart';
import 'package:avaliacao_individual/presentation/screens/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDyKlOgQYlduhum6w_T088i-Yf6Z8wOh4U",
      appId: "1:653232880008:web:95c4a07ac28cf2f550a23d",
      projectId: "avaliacao-individual-adc",
      messagingSenderId: "653232880008",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Avaliaçâo Individual 60734',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MainScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
