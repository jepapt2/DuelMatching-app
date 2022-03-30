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
