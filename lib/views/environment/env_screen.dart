import 'package:flutter/material.dart';
import 'package:package_of_the_day/views/environment/environment.dart';

class EnvScreen extends StatelessWidget {
  const EnvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Dotenv")),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("API_URL: ${Environment.apiUrl}"),
            Text("BASE_URL: ${Environment.baseUrl}"),
            Text("SENTRY_DSN: ${Environment.sentryDSN}"),
            Text("GOOGLE_API_KEY: ${Environment.googleApiKey}"),
          ],
        ),
      ),
    );
  }
}
