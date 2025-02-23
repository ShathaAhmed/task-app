import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesk_app/app.dart';
import 'package:tesk_app/providers/auth_provider.dart';
import 'package:tesk_app/providers/task_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: MyApp(),
    ),
  );
}
