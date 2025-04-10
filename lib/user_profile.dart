// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'models/profile_details.dart';
import 'package:image_picker/image_picker.dart';
import 'widgets/widgets.dart';

enum ImageType { asset, url, upload }

class UserProfile extends StatefulWidget {
  const UserProfile({
    super.key,
    this.onTapBack,
    required this.name,
    this.tell,
    this.email,
    this.backgroundColor,
    this.urlImage,
    this.assetImage,
    this.circleImageHeight,
    this.circleImageWidth,
    required this.imageType,
    required this.accountTitle,
    required this.profileDetails,
  });
  final void Function()? onTapBack;
  final String name;
  final String? tell;
  final String? email;
  final String? urlImage;
  final String? assetImage;
  final double? circleImageHeight;
  final double? circleImageWidth;
  final ImageType imageType;
  final String accountTitle;
  final Color? backgroundColor;
  // final String? backgroundImage;
  final List<ProfileDetails> profileDetails;

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
      child:
      // widget.profileType == 'student'
      //     ? Column(
      //       children: [
      //         Container(
      //           width: double.infinity,
      //           height: 200,
      //           decoration: BoxDecoration(
      //             color: Colors.blue,
      //             borderRadius: BorderRadius.only(
      //               bottomLeft: Radius.circular(50),
      //               bottomRight: Radius.circular(50),
      //             ),
      //           ),
      //           child: Center(
      //             child: ProfileImage(
      //               image: _image,
      //               imageType: ImageType.url,
      //             ),
      //           ),
      //         ),
      //         //
      //         Container(
      //           padding: EdgeInsets.all(5),
      //           margin: EdgeInsets.all(10),
      //           width: double.infinity,
      //           // height: 175,
      //           decoration: BoxDecoration(
      //             color: Colors.white54,
      //             border: Border.all(color: Colors.grey, width: 1.2),
      //             boxShadow: [
      //               BoxShadow(
      //                 color: Colors.white,
      //                 blurRadius: 5,
      //                 spreadRadius: -7,
      //               ),
      //             ],
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 'General',
      //                 style: TextStyle(
      //                   fontSize: 20,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //               for (
      //                 int i = 0;
      //                 i < widget.profileInformationCard.length;
      //                 i++
      //               ) ...{
      //                 ProfileInformationCard(
      //                   title:
      //                       widget.profileInformationCard?[i].title ?? '',
      //                   subtitle:
      //                       widget.profileInformationCard?[i].subtitle ??
      //                       '',
      //                 ),
      //               },
      //             ],
      //           ),
      //         ),
      //       ],
      //     )
      //     :
      Container(
        decoration: BoxDecoration(
          color:
              widget.backgroundColor?.withOpacity(0.2) ??
              Colors.lightBlue.withOpacity(0.2),
          // image: DecorationImage(
          //   image: AssetImage(widget.backgroundImage),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            //top header
            TopHeader(onTap: widget.onTapBack),
            //profile image
            SizedBox(height: 50),
            Stack(
              alignment: Alignment.center,
              children: [
                //profile image
                ProfileImage(
                  urlImage: widget.urlImage,
                  assetImage: widget.assetImage,
                  imageType: widget.imageType,
                  uploadImage: _image,
                  circleImageHeight: widget.circleImageHeight,
                  circleImageWidth: widget.circleImageWidth,
                ),
                //image type uplad
                widget.imageType == ImageType.upload
                    ? Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {
                            pickImage();
                            //   print('image path');
                            //   print(basename(_image!.path));
                          },
                          icon: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: widget.backgroundColor,
                              border: Border.all(color: Colors.white, width: 4),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                    : Container(),
              ],
            ),

            const SizedBox(height: 20),
            //prersonal informationn
            PersonalInformation(
              name: widget.name,
              tell: widget.tell,
              email: widget.email,
            ),
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
                        margin: EdgeInsets.only(left: 35, top: 20),
                        child: Text(
                          widget.accountTitle,
                          style: TextStyle(
                            fontSize: isTablet(context) ? 25 : 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      for (
                        int i = 0;
                        i < widget.profileDetails.length;
                        i++
                      ) ...{
                        InkWell(
                          onTap: widget.profileDetails[i].onTap,
                          child: Ink(
                            padding: EdgeInsets.only(left: 20, top: 10),
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color:
                                      widget.profileDetails[i].color
                                          ?.withOpacity(0.2) ??
                                      Colors.lightBlue.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  widget.profileDetails[i].icon,
                                  color: widget.profileDetails[i].color,
                                ),
                              ),
                              title: Text(
                                widget.profileDetails[i].title,
                                style: TextStyle(
                                  fontSize: isTablet(context) ? 25 : 18,
                                ),
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
