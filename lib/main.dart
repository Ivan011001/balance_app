import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

import 'package:balancer/app.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}
