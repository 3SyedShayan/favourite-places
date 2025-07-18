import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/screens/places%20_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

final ColorScheme colorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 102, 6, 247),
  brightness: Brightness.dark,
  surface: Color.fromARGB(255, 56, 49, 66),
);

final ThemeData themeData = ThemeData().copyWith(
  colorScheme: colorScheme,
  scaffoldBackgroundColor: colorScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: colorScheme.primary,
    foregroundColor: colorScheme.onPrimary,
  ),
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
    titleMedium: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
  ),
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: themeData,
      debugShowCheckedModeBanner: false,

      routes: {
        '/': (context) => PlacesListScreen(),
        '/addPlace': (context) => AddPlace(),
      },
    );
  }
}
