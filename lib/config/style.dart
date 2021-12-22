import 'package:flutter/material.dart';

Color whiteColor = const Color(0xFFFFFFFF);
Color blackColor = const Color(0xFF2C3E50);
Color lightColor = const Color(0xFFDDDDDD);
Color greyColor = const Color(0xFFBBBBBB);
Color blueColor = const Color(0xFF2980B9);
Color greenColor = const Color(0xFF33CCCC);

TextStyle titleTextStyle =  TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w600,
  fontSize: 16,
);

TextStyle subtitleTextStyle = TextStyle(
  color: greyColor,
  fontSize: 13,
);

TextStyle titleListTextStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w500,
  fontSize: 14,
);

TextStyle subtitleListTextStyle = TextStyle(
  color: greyColor,
  fontWeight: FontWeight.w400,
  fontSize: 13,
);

TextStyle priceTextStyle = TextStyle(
  color: blueColor,
  fontWeight: FontWeight.w500,
  fontSize: 18,
);

TextStyle discountTextStyle = TextStyle(
  color: greyColor,
  fontWeight: FontWeight.w400,
  fontSize: 13,
  decoration: TextDecoration.lineThrough,
);

TextStyle priceListTextStyle = TextStyle(
  color: blueColor,
  fontWeight: FontWeight.w500,
  fontSize: 15,
);

TextStyle discountListTextStyle = TextStyle(
  color: greyColor,
  fontWeight: FontWeight.w400,
  fontSize: 11,
  decoration: TextDecoration.lineThrough,
);

TextStyle infoTextStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w500,
  fontSize: 13,
);