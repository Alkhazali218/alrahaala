import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message, Color showColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: showColor,
    ),
  );
}
