import 'package:flutter/material.dart';
import 'package:user_profile/models/account_overview.dart';
import 'package:user_profile/user_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserProfile(
        profileType: 'student',
        backgroundColor: Colors.pink,
        image:
            'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
        imageType: ImageType.url,
        accountTitle: 'Account Overview',
        profileInformationCard: [
          ProfileInformationCard(title: 'Date of Birth', subtitle: '1999'),
          ProfileInformationCard(
            title: 'Place Of Birth',
            subtitle: 'Mogadishu',
          ),
        ],
        accountOverview: [
          AccountOverview(
            icon: Icons.person,
            title: 'My Profile',
            color: Colors.lightBlue,
          ),
          AccountOverview(
            icon: Icons.sports_basketball,
            title: 'My Order',
            color: Colors.amber,
          ),
          AccountOverview(
            icon: Icons.monetization_on,
            title: 'Refund',
            color: Colors.lightGreen,
          ),

          AccountOverview(
            onTap: () {
              showDialog(
                context: context,
                builder:
                    (context) =>
                        AlertDialog(title: Text('welcome to notification')),
              );
            },
            icon: Icons.notification_add,
            title: 'Notifications',
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}
