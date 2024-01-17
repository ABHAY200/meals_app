import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color.fromARGB(255, 168, 233, 127)),
    textTheme: GoogleFonts.latoTextTheme());

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meals App',
        theme: theme,
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.purpleAccent],
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight),
            ),
            child: const Center(
              child: Text('Abhay'),
            ),
          ),
        ));
  }
}
