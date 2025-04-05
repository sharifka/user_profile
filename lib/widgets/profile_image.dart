import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../user_profile.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.image, required this.imageType});
  // final String? image;
  final File? image;
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
                        image != null
                            ? Image.file(image!, fit: BoxFit.cover)
                            : Center(child: Text('No image')),
                    // image == null
                    //     ? Text('No image')
                    //     : imageType == ImageType.asset
                    //     ? Image.asset('')
                    //     : Image.network(image!),
                  ),
            )
            : showCupertinoDialog(
              context: context,
              builder:
                  (context) => CupertinoAlertDialog(
                    title:
                        image != null
                            ? Image.file(image!, fit: BoxFit.cover)
                            : Center(child: Text('No image')),
                    // image == null
                    //     ? Text('No image')
                    //     : imageType == ImageType.asset
                    //     ? Image.asset('')
                    //     : Image.network(image!),
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child:
              image != null
                  ? Image.file(image!, fit: BoxFit.cover)
                  : Center(child: Text('No image')),
        ),
        // image == null
        //     ? Text('no image')
        //     : ClipRRect(
        //       borderRadius: BorderRadius.circular(100),
        //       child:
        //           imageType == ImageType.asset
        //               ? Image.asset('')
        //               : Image.network(image!),
        // ),
      ),
    );
  }
}
