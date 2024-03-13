import 'package:cv_maker/screens/create_resume/create_resume.dart';
import 'package:cv_maker/screens/create_resume/resume_view.dart';
import 'package:cv_maker/screens/home_ui/home_scr.dart';
import 'package:cv_maker/screens/login_register_ui/login_reg.dart';
import 'package:cv_maker/screens/splash_ui/splash_scr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const CVMaker());
}

class CVMaker extends StatelessWidget {
  const CVMaker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      //routes of screens
      initialRoute: '/resume',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/create': (context) => const CreateResume(),
        '/resume': (context) => const ResumeView(),
      },
    );
  }
}
