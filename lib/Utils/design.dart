import 'package:flutter/material.dart';

const hintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);
const labelStyleWhite = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);
const labelStyleBlack = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);
const inputBoxStyle = BoxDecoration(
  border: Border(bottom: BorderSide(width: 2.0, color: Color(0xFFFFFFFF))),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

class Design {
  static const Color redDarkColor = Color(0xFFA31F23);
  static const Color redDarkColor25 = Color(0x40A31F23);
  static const Color redDarkColor10 = Color(0x10A31F23);
  static const Color redLightColor = Color(0xFFD0021B);
  static const Color redSemi = Color(0xFFF7DFDE);
  static const Color darkColor = Color(0xFF4D4D4D);
  static const Color greyColor = Color(0xFFD4D4D4);
  static const Color grey2 = Color(0xFF8A8A8A);
  static const Color grey = Color(0xFFD4D4D4);
  static const Color whiteSemi = Color(0xFFFBF3F3);
  static const Color white = Color(0xFFFFFFFF);

  static const Color yellowMenu = Color(0xFFfeaf32);
  static const Color blueLightMenu = Color(0xFF5E95FA);
  static const Color greenLightMenu = Color(0xFF9FDE43);
  static const Color blueDrakMenu = Color(0xFF0766D2);

  static const buttonTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

  static const chartLabelsTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );

  static const tabTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );
}
