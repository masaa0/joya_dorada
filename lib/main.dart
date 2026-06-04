import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/main_navigation.dart';

void main() {
  runApp(const JoyaDoradaApp());
}

// root app widget - sets theme then opens MainNavigation
class JoyaDoradaApp extends StatelessWidget {
  const JoyaDoradaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joya Dorada',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF800020)),
        scaffoldBackgroundColor: const Color(0xFFFAF9F6),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const MainNavigation(),
    );
  }
}
