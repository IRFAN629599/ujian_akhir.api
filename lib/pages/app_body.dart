import 'package:flutter/material.dart';

class AppBodyPage extends StatelessWidget {

  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Body'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: const Center(
        child: Text('Hallo Selamat Datang di Aplikasi Mobile',
          style:  TextStyle(
            fontSize: 32,
            color: Colors.blue,
            fontStyle: FontStyle.italic
          ),
        ),
      ),
    );
  }
}