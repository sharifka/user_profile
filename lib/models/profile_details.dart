import 'package:flutter/material.dart';

class ProfileDetails {
  final void Function()? onTap;
  final IconData icon;
  final Color? color;
  final String title;
  ProfileDetails({
    this.onTap,
    required this.icon,
    this.color,
    required this.title,
  });
}
