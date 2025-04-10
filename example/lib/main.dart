import 'package:flutter/material.dart';
import 'package:user_profile/models/profile_details.dart';
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
        onTapBack: () {
          print('on tap back');
        },
        backgroundColor: Colors.blue,
        name: 'Abdifatah Sharif Mohamed',
        tell: '+25261899887766',
        email: 'Sharifka@gmail.com',
        urlImage:
            'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
        assetImage: 'assets/bg_image.jpg',
        imageType: ImageType.upload,
        circleImageHeight: 125,
        circleImageWidth: 125,
        accountTitle: 'Profile Details',
        profileDetails: [
          ProfileDetails(
            icon: Icons.person,
            title: 'My Profile',
            color: Colors.lightBlue,
          ),
          ProfileDetails(
            icon: Icons.sports_basketball,
            title: 'My Order',
            color: Colors.amber,
          ),
          ProfileDetails(
            icon: Icons.monetization_on,
            title: 'Refund',
            color: Colors.lightGreen,
          ),
          ProfileDetails(
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
