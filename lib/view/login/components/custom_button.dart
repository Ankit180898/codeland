import 'package:codeland/res/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double height;
  final double width;
  final FontWeight fontWeight;
  final double textSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.height,
    required this.width,
    required this.textSize,
    required this.textColor,
    required this.fontWeight,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.2))
            ],
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: normalText(
                    textSize,
                    textColor,
                    fontWeight
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
