import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:it_job_mobile/constants/app_color.dart';
import 'package:it_job_mobile/constants/app_text_style.dart';
import 'package:it_job_mobile/widgets/button/icon_button_widget.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:sizer/sizer.dart';

import '../../constants/route.dart';
import '../../widgets/profile/profile_widget.dart';
import '../profile/user_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  'Hồ Sơ',
                  style: AppTextStyles.h4Black,
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Transform.scale(
                      scale: 1.1,
                      child: Switch.adaptive(
                        activeColor: AppColor.black,
                        value: value,
                        onChanged: (value) =>
                            setState(() => this.value = value),
                      ),
                    ),
                  ),
                ],
              ),
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () async {
                  await Navigator.of(context).pushNamed(
                    RoutePath.editProfileRouter,
                  );
                  setState(() {});
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Column(
                children: [
                  Text(
                    user.name,
                    style: AppTextStyles.h2Black,
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.fmd_good_outlined,
                        size: 20,
                        color: AppColor.darkGrey,
                      ),
                      Text(
                        user.email,
                        style: AppTextStyles.h4darkGrey,
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButtonWidget(
                        text: 'CÀI ĐẶT',
                        icon: const Icon(
                          Iconsax.setting_2,
                          size: 25,
                        ),
                        size: 25,
                        onClicked: () {},
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          IconButtonWidget(
                            text: 'CHỈNH SỬA THÔNG TIN',
                            icon: const Icon(
                              Iconsax.edit,
                              size: 30,
                            ),
                            size: 30,
                            onClicked: () async {
                              await Navigator.of(context).pushNamed(
                                RoutePath.editProfileRouter,
                              );
                            },
                          ),
                        ],
                      ),
                      IconButtonWidget(
                        text: 'HỒ SƠ',
                        icon: const Icon(
                          Iconsax.user_tag,
                          size: 25,
                        ),
                        size: 25,
                        onClicked: () {},
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
            child: ClipPath(
              clipper: ProsteBezierCurve(
                position: ClipPosition.top,
                list: [
                  BezierCurveSection(
                    start: Offset(100.w, 0),
                    top: Offset(50.w, 30),
                    end: Offset(0, 0),
                  ),
                ],
              ),
              child: Container(
                color: AppColor.primary,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Giới thiệu',
                      style: AppTextStyles.h3Black,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      user.email,
                      style: AppTextStyles.h4Black,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
