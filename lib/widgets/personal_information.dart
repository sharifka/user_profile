import 'package:flutter/material.dart';
import 'package:user_profile/widgets/istablet.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({
    super.key,
    required this.name,
    this.tell,
    this.email,
  });
  final String name;
  final String? tell;
  final String? email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: isTablet(context) ? 35 : 25,
            fontWeight: FontWeight.bold,
            height: 1.5,
          ),
        ),
        email != null
            ? Text(
              email!,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: isTablet(context) ? 20 : 15,
              ),
            )
            : Container(),
        tell != null
            ? Text(
              tell!,
              style: TextStyle(fontSize: isTablet(context) ? 15 : 14),
            )
            : Container(),
      ],
    );
  }
}
