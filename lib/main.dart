import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/categories_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FreshFood',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        fontFamily: 'Raleway',
        accentColor: Colors.amber,
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              textTheme: TextTheme(
                title: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontSize: 24,
                ),
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
      ),
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoriesMealsScreen.routeName: (ctx) => CategoriesMealsScreen(),
      },
    );
  }
}
