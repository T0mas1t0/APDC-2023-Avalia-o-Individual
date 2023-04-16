import 'package:avaliacao_individual/presentation/screens/main_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_individual/presentation/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController userIDController;
  late TextEditingController passwordController;

  late String userId;
  late String password;
  late bool login;

  @override
  void initState() {
    userIDController = TextEditingController();
    passwordController = TextEditingController();
    login = false;

    //getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body:
      Form(
        key: _formKey,
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              /// Image
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Transform.scale(
                scale: 0.8,
                child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/3456/3456388.png'),
              ),
            ),
            Container(
              /// UserID text field
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              width: 400,
              child: TextFormField(
                key: const ValueKey('UserID'),
                maxLength: 50,
                controller: userIDController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 40),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90.0),
                  ),
                  labelText: 'User ID, Username or Email',
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter full name';
                  }else{
                    return null;
                  }
                },
                onSaved: (value){
                  setState(() {
                    userId = value!;
                  });
                },
              ),
            ),
            Container(
              /// Password text field
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              width: 400,
              child: TextFormField(
                key: const ValueKey('Password'),
                maxLength: 20,
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 40),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90.0),
                  ),
                  labelText: 'Password',
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter password';
                  }else{
                    return null;
                  }
                },
                onSaved: (value){
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
                onPressed: () {

                },
              ),
            ),
          ],
        ),
      ),),
    );
  }
}
