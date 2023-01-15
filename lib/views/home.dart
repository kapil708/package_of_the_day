import 'package:flutter/material.dart';
import 'FlutterSecureStorage/flutter_secure_storage_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Packages")),
      body: Column(
        children: [
          ListTile(
            title: const Text("Flutter Secure Storage"),
            trailing: const Icon(Icons.arrow_forward),
            tileColor: Colors.black12,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FlutterSecureStorageScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
