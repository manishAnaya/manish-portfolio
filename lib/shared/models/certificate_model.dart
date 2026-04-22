import 'package:flutter/material.dart';

class Certificate {
  final String imagePath;
  final String title;
  final String issuer;
  final String type;
  final String date;
  final Color accentColor;

  const Certificate({
    required this.imagePath,
    required this.title,
    required this.issuer,
    required this.type,
    required this.date,
    required this.accentColor,
  });
}
