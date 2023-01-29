import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';

//Enum for easy access
enum ServerType { production, develop }

class Environment {
  //Set server type here...
  ServerType defaultServer = ServerType.develop;

  //Load .env file to application
  Future<void> init() async {
    String envFileName = '.env.${defaultServer.name}';
    await dotenv.load(fileName: envFileName);

    log("::: env \nfileName : $envFileName \n\ndotEnv : ${dotenv.env}");
  }

  //Common function to get data
  static String getEnvData(key) => dotenv.env[key].toString();

  //Get data by keys
  static String get apiUrl => getEnvData('API_URL');
  static String get sentryDSN => getEnvData('SENTRY_DSN');
  static String get googleApiKey => getEnvData('GOOGLE_API_KEY');
  static String get baseUrl => getEnvData('BASE_URL');
}
