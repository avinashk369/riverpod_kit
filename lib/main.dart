import 'package:flutter/material.dart';
import 'package:riverpod_kit/core/di/di.dart';
import 'package:riverpod_kit/starter_kit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const StarterKit());
}
