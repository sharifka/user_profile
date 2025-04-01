  import 'package:flutter/material.dart';

class AccountOverview{
  final void Function()? onTap;
  final IconData icon;
  final Color? color;
  final String title;
  AccountOverview({this.onTap,required this.icon,this.color, required this.title});
  }