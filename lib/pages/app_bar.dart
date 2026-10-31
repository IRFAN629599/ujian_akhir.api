import 'package:flutter/material.dart';

class AppBarPage extends StatelessWidget {

  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Flutter'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true
      ),
    );
  }
}