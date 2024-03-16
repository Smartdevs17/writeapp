import 'package:flutter/material.dart';

//static colors
const Color textColor = Colors.black;
// const Color hintColor = Color(0xffcccccc);
// const Color hintColor = Color.fromRGBO(47, 46, 43, 100);
const Color hintColor = Color.fromRGBO(151, 151, 151, 100);
const Color subTextColor = Color.fromRGBO(47, 46, 43, 100);
const Color bottomBarColor = Color.fromRGBO(21, 21, 21, 95);
const Color primaryColorLT = Colors.white;
const Color primaryColorDK = Colors.black;
const Color secondaryColor = Color.fromRGBO(151, 151, 151, 100);
const Color darkGrey = Color.fromARGB(1000, 231, 231, 231);

///Text
const bodyText1 =
    TextStyle(color: textColor, fontSize: 16.0, fontWeight: FontWeight.bold);

const bodyText2 =
    TextStyle(color: textColor, fontSize: 14.0, fontWeight: FontWeight.normal);

///App Theme
final ThemeData appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.black,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  tabBarTheme: const TabBarTheme(
      labelColor: Colors.white, unselectedLabelColor: Colors.grey),
  fontFamily: "NunitoSans",
  inputDecorationTheme: const InputDecorationTheme(),
  elevatedButtonTheme: elevatedButtonThemeData,
  textTheme: const TextTheme(
    bodyLarge: bodyText1,
    bodyMedium: bodyText2,
  ),
);

final InputDecoration inputDecoration = InputDecoration(
    hintStyle: bodyText2.copyWith(color: textColor.withOpacity(0.6)),
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    fillColor: hintColor,
    filled: true,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ));
final ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)))));

final OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    side: const BorderSide(color: primaryColorDK),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
  ),
);
