import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(255, 255, 98, .1),
  100: const Color.fromRGBO(255, 255, 98, .2),
  200: const Color.fromRGBO(255, 255, 98, .3),
  300: const Color.fromRGBO(255, 255, 98, .4),
  400: const Color.fromRGBO(255, 255, 98, .5),
  500: const Color.fromRGBO(255, 255, 98, .6),
  600: const Color.fromRGBO(255, 255, 98, .7),
  700: const Color.fromRGBO(255, 255, 98, .8),
  800: const Color.fromRGBO(255, 255, 98, .9),
  900: const Color.fromRGBO(255, 255, 98, 1),
};

abstract class CustomColors {
  static Color customContrastColor = const Color.fromARGB(255, 255, 98, 0);
  static MaterialColor customSwatchColor =
      MaterialColor(0xFFFF6233, _swatchOpacity);
}

const colorPrimaryClient = Color.fromARGB(255, 255, 98, 0);

const linearColor = BoxDecoration(
    gradient: LinearGradient(
        colors: [
          Color(0xFFFF6233),
          Color(0xFFFFD000),
        ],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp));

const boxLinear = BoxDecoration(
    gradient: LinearGradient(
        colors: [
          Color(0xFFFF6233),
          Color(0xFFFFD000),
        ],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(60)));

const linearOrange = LinearGradient(
    colors: [
      Color(0xFFFF6233),
      Color(0xFFFFD000),
    ],
    begin: FractionalOffset(0.0, 0.0),
    end: FractionalOffset(1.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp);
