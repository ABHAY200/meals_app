import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Bloc flutter package import

import 'package:meals_app/cubit/favorite_meals_cubit.dart';
import 'package:meals_app/screens/tabs.dart';

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
    // Bloc provider added
    return BlocProvider(
      create: (context) => FavoriteMealsCubit(),
      child: MaterialApp(
          title: 'Meals App', theme: theme, home: const TabScreen()),
    );
  }
}
