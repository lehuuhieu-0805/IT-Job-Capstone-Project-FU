import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image_path.dart';
import '../../constants/app_text_style.dart';
import '../../widgets/button/button.dart';

class Success extends StatelessWidget {
  final String contentPage;
  final String contentButton;
  final VoidCallback press;
  const Success(
      {Key? key,
      required this.contentPage,
      required this.contentButton,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          20,
        ),
        child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  ImagePath.success,
                ),
                Text(
                  contentPage,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h2Black,
                ),
                ButtonDefault(
                  width: 80.w,
                  height: 7.h,
                  content: contentButton,
                  textStyle: AppTextStyles.h3White,
                  backgroundBtn: AppColor.btnColor,
                  voidCallBack: press,
                ),
              ],
            )),
      ),
    );
  }
}
