import 'package:flutter/material.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController userIDController;

  @override
  void initState() {
    userIDController = TextEditingController();

    //getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete User Page'),
      ),
      body: Form(key: _formKey,
        child: Center(
        child: Column(
          children: [
            const Text('Choose an User to delete'),
            Container(
              ///User ID text field
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              width: 400,
              child: TextFormField(
                maxLength: 50,
                controller: userIDController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 40),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90.0),
                  ),
                  labelText: 'User ID, Username or Email',
                ),
              ),
            ),
          ],
        ),
      ),),
    );
  }
}
