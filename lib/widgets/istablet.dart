import 'package:flutter/material.dart';

bool isTablet(BuildContext context) {
  // Use MediaQuery to get the device's screen width
  double width = MediaQuery.of(context).size.width;

  // Set your threshold for tablet screen size (e.g., 600px width or more)
  return width >= 600;
}
