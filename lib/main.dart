import 'package:cv_maker/screens/login_register_ui/login_reg.dart';
import 'package:cv_maker/screens/splash_ui/splash_scr.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CVMaker());
}

class CVMaker extends StatelessWidget {
  const CVMaker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      themeMode: ThemeMode.dark,

      //routes of screens
      initialRoute: '/login',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
