import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFFF5862A);

const Color textColor = Color(0xffffffff);

TextStyle normalText(double size, Color color,FontWeight fontWeight) => GoogleFonts.poppins(
      textStyle:
          TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
    );
