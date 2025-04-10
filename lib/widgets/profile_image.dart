import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../user_profile.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.urlImage,
    required this.assetImage,
    required this.imageType,
    this.circleImageHeight,
    this.circleImageWidth,
    this.uploadImage,
  });
  final String? urlImage;
  final String? assetImage;
  final File? uploadImage;
  final ImageType imageType;
  final double? circleImageHeight;
  final double? circleImageWidth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Platform.isAndroid
            ? showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: ImageTypeCard(
                      imageType: imageType,
                      urlImage: urlImage,
                      assetImage: assetImage,
                      uploadImage: uploadImage,
                    ),
                  ),
            )
            : showCupertinoDialog(
              barrierDismissible: true,
              context: context,
              builder:
                  (context) => CupertinoAlertDialog(
                    title: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(),
                      child: ImageTypeCard(
                        imageType: imageType,
                        urlImage: urlImage,
                        assetImage: assetImage,
                        uploadImage: uploadImage,
                      ),
                    ),
                  ),
            );
      },
      child: Container(
        height: circleImageHeight ?? 125,
        width: circleImageWidth ?? 125,
        decoration: BoxDecoration(
          // color: Colors.amber,
          border: Border.all(color: Colors.white, width: 5),
          borderRadius: BorderRadius.circular(100),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: ImageTypeCard(
            imageType: imageType,
            urlImage: urlImage,
            assetImage: assetImage,
            uploadImage: uploadImage,
          ),
        ),
      ),
    );
  }
}

class ImageTypeCard extends StatelessWidget {
  const ImageTypeCard({
    super.key,
    required this.imageType,
    this.urlImage,
    this.assetImage,
    this.uploadImage,
  });
  final ImageType imageType;
  final String? urlImage;
  final String? assetImage;
  final File? uploadImage;
  @override
  Widget build(BuildContext context) {
    return imageType == ImageType.upload
        ? uploadImage != null
            ? Image.file(uploadImage!, fit: BoxFit.cover)
            : Center(child: Text('No image'))
        : imageType == ImageType.url
        ? urlImage != null
            ? Image.network(urlImage!, fit: BoxFit.cover)
            : Center(child: Text('No image'))
        : imageType == ImageType.asset
        ? assetImage != null
            ? Image.asset(assetImage!, fit: BoxFit.cover)
            : Center(child: Text('No image'))
        : Center(child: Text('No image specified'));
  }
}
