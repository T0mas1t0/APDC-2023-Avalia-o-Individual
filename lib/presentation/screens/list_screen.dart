import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
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
      title: const Text('List Page'),
    ),
  );
  }
}
