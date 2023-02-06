import 'package:flutter/material.dart';
import 'package:it_job_mobile/constants/app_color.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: BackButton(
      color: AppColor.black,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
