import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_individual/presentation'
    '/screens/delete_screen.dart';
import 'package:avaliacao_individual/presentation'
    '/screens/list_screen.dart';
import 'package:avaliacao_individual/presentation'
    '/screens/modify_attributes_screen.dart';
import 'package:avaliacao_individual/presentation'
    '/screens/modify_password_screen.dart';
import 'package:avaliacao_individual/presentation'
    '/screens/show_token_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //late TextEditingController emailController;

  @override
  void initState() {
    //emailController = TextEditingController();

    //getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout_outlined))
        ],
        title: const Text('Main Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Text('Welcome!',
                  style: DefaultTextStyle.of(context)
                      .style
                      .apply(fontSizeFactor: 1.6)),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeleteScreen()),
                  );
                },
                child: const Text('Delete User'),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListScreen()),
                  );
                },
                child: const Text('List User'),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListScreen()),
                  );
                },
                child: const Text('List User'),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListScreen()),
                  );
                },
                child: const Text('List User'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
