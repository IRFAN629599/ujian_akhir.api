import 'package:flutter/material.dart';

class AppBaris extends StatelessWidget {
  const AppBaris({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apk flutter"),
        backgroundColor: Colors.yellow[300],
        foregroundColor: Colors.red[100],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('halloo'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('simpan'),
            ),
            ElevatedButton(
              onPressed: () {
                print('di tekan');
              },
              child: const Text('Batal'),
            ),
          ],
        ),
      ),
    );
  }
}