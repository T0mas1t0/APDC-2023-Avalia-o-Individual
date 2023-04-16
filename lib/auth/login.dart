import 'package:avaliacao_individual/presentation/screens/main_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_individual/presentation/screens/register_screen.dart';
import 'package:logging/logging.dart';

import '../services/functions/auth_functions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final log = Logger("Login Screen Class");
  final _formKey = GlobalKey<FormState>();

  late TextEditingController userIDController;
  late TextEditingController passwordController;

  late String userId;
  late String password;

  @override
  void initState() {
    userIDController = TextEditingController();
    passwordController = TextEditingController();

    //getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  /// Image
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Transform.scale(
                    scale: 0.8,
                    child: Image.network('https://cdn-icons-png.flaticon.com'
                        '/512/3456/3456388.png'),
                  ),
                ),
                Container(
                  ///USER ID Text Field
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  width: 400,
                  child: TextFormField(
                    key: const ValueKey('userID'),
                    maxLength: 50,
                    controller: userIDController,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 40),
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                      labelText: 'User ID, Username or Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter full name';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        userId = value!;
                      });
                    },
                  ),
                ),
                Container(
                  ///PASSWORD Text Field
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  width: 400,
                  child: TextFormField(
                    key: const ValueKey('Password'),
                    maxLength: 20,
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 40),
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        password = value!;
                      });
                    },
                  ),
                ),
                Container(
                  /// Register Page Button
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black12,
                    ),
                    child: const Text('Go to Register Page'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()),
                      );
                    },
                  ),
                ),
                Container(
                  /// Login Button
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lime,
                      ),
                      child: const Text('Login'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Future<int> res = AuthServices.signinUser(
                              userId, password, context);
                          if (res.toString() == 1.toString()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainScreen()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Container(
                                  padding: const EdgeInsets.all(16),
                                  height: 90,
                                  decoration: const BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 48),
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                'Oh Oh!',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                "Go to Register Page, "
                                                "or try again. :)",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
