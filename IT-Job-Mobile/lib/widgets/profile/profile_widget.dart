import 'dart:io';

import 'package:flutter/material.dart';
import 'package:it_job_mobile/constants/app_color.dart';
import 'package:sizer/sizer.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(),
          if (isEdit)
            Positioned(
              bottom: 0,
              right: 3,
              child: buildEditIcon(),
            ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    return buildCircle(
      color: Colors.white,
      all: 3,
      child: ClipOval(
        child: Material(
          color: Colors.black,
          child: Ink.image(
            image: image as ImageProvider,
            fit: BoxFit.cover,
            width: 32.w,
            height: 32.w,
            child: InkWell(onTap: onClicked),
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon() => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: AppColor.black,
          all: 8,
          child: const Icon(
            Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColor.grey,
              blurRadius: 5,
            ),
          ],
        ),
        child: ClipOval(
          child: Container(
            padding: EdgeInsets.all(all),
            color: color,
            child: child,
          ),
        ),
      );
}
