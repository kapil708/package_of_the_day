import 'package:flutter/material.dart';

import 'views/flutter_dotenv/environment.dart';
import 'views/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Set up environment values
  await Environment().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Package OTD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
