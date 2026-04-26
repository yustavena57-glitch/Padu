import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/dashboard_page.dart';
import 'screens/lupa_password_page.dart';

void main() {
  runApp(PaduApp());
}

class PaduApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PADU',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/dashboard': (context) => HomePage(),  
        '/lupa-password': (context) => LupaPasswordPage(),
      },
    );
  }
}