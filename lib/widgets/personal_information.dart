
import 'package:flutter/material.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Abdifatah Sharif',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text('+2526171234567'),
      ],
    );
  }
}
