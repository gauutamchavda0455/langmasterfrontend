import 'package:flutter/material.dart';
import 'package:app/app.dart';
import 'package:app/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const App());
}
