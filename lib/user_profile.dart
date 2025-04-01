// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './models/account_overview.dart';

enum ImageType { asset, url }

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    this.backgroundColor,
    this.image,
    this.imageType,
    required this.accountTitle,
    required this.accountOverview,
  });
  final String? image;
  final ImageType? imageType;
  final String accountTitle;
  final Color? backgroundColor;
  final List<AccountOverview> accountOverview;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color:
              backgroundColor?.withOpacity(0.2) ??
              Colors.lightBlue.withOpacity(0.2),
          // image: DecorationImage(
          //   image: AssetImage("bg_image.jpg"),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Column(
          children: [
            //top header
            TopHeader(),
            //profile image
            SizedBox(height: 50),
            ProfileImage(image: image, imageType: imageType ?? ImageType.url),
            const SizedBox(height: 20),
            //prersonal informationn
            PersonalInformation(),
            const SizedBox(height: 25),
            //overview
            Expanded(
              child: Container(
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //account overview
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          accountTitle,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      for (int i = 0; i < accountOverview.length; i++) ...{
                        InkWell(
                          onTap: accountOverview[i].onTap,
                          child: Ink(
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color:
                                      accountOverview[i].color?.withOpacity(
                                        0.2,
                                      ) ??
                                      Colors.lightBlue.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  accountOverview[i].icon,
                                  color: accountOverview[i].color,
                                ),
                              ),
                              title: Text(
                                accountOverview[i].title,
                                style: TextStyle(fontSize: 18),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      },
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.image, required this.imageType});
  final String? image;
  final ImageType imageType;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Platform.isAndroid
            ? showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title:
                        image == null
                            ? Text('No image')
                            : imageType == ImageType.asset
                            ? Image.asset('')
                            : Image.network(image!),
                  ),
            )
            : showCupertinoDialog(
              context: context,
              builder:
                  (context) => CupertinoAlertDialog(
                    title:
                        image == null
                            ? Text('No image')
                            : imageType == ImageType.asset
                            ? Image.asset('')
                            : Image.network(image!),
                  ),
            );
      },
      child: Container(
        height: 125,
        width: 125,
        decoration: BoxDecoration(
          // color: Colors.amber,
          border: Border.all(color: Colors.white, width: 5),
          borderRadius: BorderRadius.circular(100),
        ),
        child:
            image == null
                ? Text('no image')
                : ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child:
                      imageType == ImageType.asset
                          ? Image.asset('')
                          : Image.network(image!),
                ),
      ),
    );
  }
}

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Profile',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      trailing: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
