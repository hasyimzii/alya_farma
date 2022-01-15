import 'package:flutter/material.dart';

Color whiteColor = const Color(0xFFFFFFFF);
Color blackColor = const Color(0xFF2C3E50);
Color lightColor = const Color(0xFFDDDDDD);
Color greyColor = const Color(0xFFBBBBBB);
Color blueColor = const Color(0xFF2980B9);
Color greenColor = const Color(0xFF33CCCC);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;

TextStyle titleText(double font) => TextStyle(
  color: blackColor,
  fontWeight: semibold,
  fontSize: font,
);

TextStyle subtitleText(double font) => TextStyle(
  color: greyColor,
  fontWeight: regular,
  fontSize: font,
);

TextStyle whiteText(double font) => TextStyle(
  color: whiteColor,
  fontWeight: semibold,
  fontSize: font,
);

TextStyle lightText(double font) => TextStyle(
  color: blackColor,
  fontWeight: light,
  fontSize: font,
);

TextStyle priceText(double font) => TextStyle(
  color: blueColor,
  fontWeight: medium,
  fontSize: font,
);

TextStyle subpriceText(double font) => TextStyle(
  color: greyColor,
  fontWeight: regular,
  fontSize: font,
  decoration: TextDecoration.lineThrough,
);

TextStyle searchText(double font) => TextStyle(
  color: blackColor,
  fontWeight: medium,
  fontSize: font,
  height: 1.5,
);