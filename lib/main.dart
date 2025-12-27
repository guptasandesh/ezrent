import 'package:ezrent/features/auth/view/pages/login_page.dart';
import 'package:ezrent/features/splash/view/pages/splash_page.dart';
import 'package:ezrent/features/search/view/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TEMP: Switch between LoginPage and SearchPage for UI testing
    // Set to true to show SearchPage directly
    const bool showSearchPage = true;
    return MaterialApp(
      title: 'Flutter Demo',
      home: showSearchPage ? SearchPage() : const LoginPage(),
    );
  }
}
