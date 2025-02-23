import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesk_app/providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("تسجيل الدخول", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: "اسم المستخدم"),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "كلمة المرور"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  bool success = await Provider.of<AuthProvider>(context, listen: false)
                      .login(_usernameController.text, _passwordController.text);
                  if (!success) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("فشل تسجيل الدخول!")));
                  }
                },
                child: Text("تسجيل الدخول"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
