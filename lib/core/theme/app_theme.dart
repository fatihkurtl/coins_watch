import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.blueGrey[300],
  fontFamily: "Nunito",
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blueGrey,
    centerTitle: true,
  ),
  tabBarTheme: TabBarTheme(
    indicatorColor: Colors.blueAccent[400],
    dividerColor: Colors.blueGrey[900],
    unselectedLabelColor: Colors.white.withOpacity(0.5),
    labelStyle: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: 'Nunito',
    ),
  ),
);

final ThemeData darkAppTheme = ThemeData(
  primaryColor: Colors.blueGrey[800],
  fontFamily: "Nunito",
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueGrey[900],
    centerTitle: true,
  ),
  tabBarTheme: TabBarTheme(
    indicatorColor: Colors.blueAccent[400],
    dividerColor: Colors.blueGrey[300],
    unselectedLabelColor: Colors.white.withOpacity(0.5),
    labelStyle: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: 'Nunito',
    ),
  ),
);
