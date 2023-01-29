import 'package:flutter/material.dart';
import 'package:package_of_the_day/views/flutter_dotenv/environment.dart';

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
            const SizedBox(height: 16),
            Text("BASE_URL: ${Environment.baseUrl}"),
            const SizedBox(height: 16),
            Text("SENTRY_DSN: ${Environment.sentryDSN}"),
            const SizedBox(height: 16),
            Text("GOOGLE_API_KEY: ${Environment.googleApiKey}"),
          ],
        ),
      ),
    );
  }
}
