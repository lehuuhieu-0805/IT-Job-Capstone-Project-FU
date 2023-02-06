import 'package:flutter/material.dart';
import 'package:it_job_mobile/view/success/success.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image_path.dart';
import '../../constants/app_text_style.dart';
import '../../constants/label.dart';
import '../../constants/route.dart';
import '../../widgets/button/button.dart';

class SuccessChangePasswordPage extends StatelessWidget {
  const SuccessChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Success(
      contentPage: Label.contentSuccessChangePasswordPage,
      contentButton: "Sign In",
      press: () {
        Navigator.of(context).pushNamed(
          RoutePath.signInRoute,
        );
      },
    );
  }
}
