import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesk_app/providers/auth_provider.dart';
import 'package:tesk_app/providers/task_provider.dart';
import 'package:tesk_app/screens/login_screen.dart'; // تأكد من وجود هذا المسار

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(), // تأكد من أن الشاشة الرئيسية موجودة
      ),
    );
  }
}
