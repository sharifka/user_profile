// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import './models/account_overview.dart';
import 'package:image_picker/image_picker.dart';

import 'widgets/widgets.dart';

enum ImageType { asset, url }

class UserProfile extends StatefulWidget {
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
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File? _image;
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color:
              widget.backgroundColor?.withOpacity(0.2) ??
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
            Stack(
              children: [
                // _image != null
                //     ? Container(
                //       height: 150,
                //       width: 150,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(100),
                //       ),
                //       child: ClipRRect(
                //          borderRadius: BorderRadius.circular(100),
                //         child:Image.file(_image!)),
                //     )
                //     : Text('No image selected'),
                ProfileImage(
                  image: widget.image,
                  imageType: widget.imageType ?? ImageType.url,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: pickImage,
                      icon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          border: Border.all(color: Colors.white, width: 4),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(Icons.edit, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),

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
                          widget.accountTitle,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      for (
                        int i = 0;
                        i < widget.accountOverview.length;
                        i++
                      ) ...{
                        InkWell(
                          onTap: widget.accountOverview[i].onTap,
                          child: Ink(
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color:
                                      widget.accountOverview[i].color
                                          ?.withOpacity(0.2) ??
                                      Colors.lightBlue.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  widget.accountOverview[i].icon,
                                  color: widget.accountOverview[i].color,
                                ),
                              ),
                              title: Text(
                                widget.accountOverview[i].title,
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
