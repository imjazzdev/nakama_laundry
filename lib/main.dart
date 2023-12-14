import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakama_laundry/view/pages/home.dart';
import 'package:nakama_laundry/view/pages/login.dart';
import 'package:nakama_laundry/view/widget/main_navigator.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: Login(),
    );
  }
}
