


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  ThemeData getTheme() => ThemeData(

    colorSchemeSeed: Colors.blue,

    textTheme: TextTheme(
      titleSmall: GoogleFonts.montserratAlternates(),
      titleMedium: GoogleFonts.montserratAlternates(),
      titleLarge: GoogleFonts.montserratAlternates(),
    ),

    listTileTheme: ListTileThemeData(
      tileColor: Colors.blueGrey.shade200
    )

  );

}