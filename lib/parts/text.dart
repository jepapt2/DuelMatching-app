import 'package:flutter/material.dart';

RichText getRequiredLabel(String fieldName) {
  return RichText(
      text: TextSpan(
          style: const TextStyle(color: Color(0xff2a2a2a)),
          text: fieldName,
          children: const [
        TextSpan(text: '*', style: TextStyle(color: Colors.red))
      ]));
}

Widget getOverflowEllipsis(String text, double? fontSize, int maxLines,
    double? width, Color? textColor) {
  return SizedBox(
    width: width,
    child: Text(
      text,
      style: TextStyle(color: textColor ?? Colors.black54, fontSize: fontSize),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: TextAlign.start,
    ),
  );
}
