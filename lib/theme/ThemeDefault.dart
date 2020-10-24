import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/constants.dart';

class ThemeDefault {
  static final ThemeData _base = ThemeData();

  static TextTheme _textThemeDefault() => _base.textTheme.copyWith(
        bodyText2: TextStyle(
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: kPrimaryColor,
        ),
      );

  static ThemeData themeDataDefault() => _base.copyWith(
        primaryColor: kPrimaryColor,
        accentColor: ColorsTheme.secondary,
        textTheme: _textThemeDefault(),
        brightness: Brightness.light,
        splashColor: Colors.black12,
        hoverColor: Colors.black12,
        highlightColor: Colors.black12,
        buttonTheme: ButtonThemeData(
          disabledColor: ColorsTheme.secondary,
          buttonColor: ColorsTheme.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(ThemeDefault.borderRadius),
            ),
          ),
          height: 35,
          minWidth: 35,
        ),
        dialogTheme: DialogTheme(),
        tabBarTheme: TabBarTheme(
          unselectedLabelStyle: TextStyle(fontSize: 10),
          labelStyle: TextStyle(fontSize: 10),
          labelPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          unselectedLabelColor: Colors.grey[600],
          labelColor: Colors.red[600],
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: Color.fromRGBO(171, 27, 22, 1.0),
                  style: BorderStyle.solid,
                  width: 2.0),
            ),
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 5),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(
            color: kPrimaryColor,
            fontSize: 16,
            fontFamily: "Metropolis",
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      );

  //variavel para os cantos arredondados dos elementos
  static final double borderRadius = 5;

  //espacamento nas bordas laterais do app inteiro
  static final EdgeInsets horizontalSpacingDefault =
      const EdgeInsets.symmetric(horizontal: 23);
}

class ColorsTheme {
  static final Color primary = Color(0xff62170A);
  static final Color accent = Color(0xffE5E5E5);
  static final Color secondary = Color(0xffE1E1E1);
  static final Color greyMedium = Color(0xffB7B7B7);
  static final Color greyDark = Color(0xff4A4A4A);
  static final Color greyLite = Color(0xffF3F3F3);
  static final Color white = Color(0xffffffff);
  static final Color black = Color(0xff000000);
  static final Color red = Color(0xffC80000);
  static final Color green = Color(0xff048C09);
  static final Color blue = Color(0xff007BBF);
}
