import 'package:flutter/material.dart';
import 'package:it_job_mobile/constants/app_text_style.dart';
import 'package:it_job_mobile/constants/label.dart';
import 'package:it_job_mobile/view/forgot_password/already_have_a_password_check.dart';
import 'package:it_job_mobile/widgets/button/button.dart';
import 'package:it_job_mobile/widgets/input/input_field.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_color.dart';
import '../../constants/route.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppColor.primary,
          height: 100.h,
          width: 100.h,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Label.titleForgotPasswordPage,
                          style: AppTextStyles.h2Black,
                        ),
                        Text(
                          Label.contentForgotPasswordPage,
                          style: AppTextStyles.h4Grey,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Form(
                      key: formKey,
                      child: InputField(
                        hintText: "Phone Number",
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value != null && value.length < 10) {
                            return "Phone must 10 character";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    AlreadyHaveAPasswordCheck(
                      forgot: false,
                      press: () {
                        Navigator.of(context).pushNamed(
                          RoutePath.signInRoute,
                        );
                      },
                    ),
                  ],
                ),
                ButtonDefault(
                    width: 80.w,
                    height: 7.h,
                    content: 'Submit',
                    textStyle: AppTextStyles.h3White,
                    backgroundBtn: AppColor.btnColor,
                    voidCallBack: () {
                      final isValidForm = formKey.currentState!.validate();
                      if (isValidForm) {
                        Navigator.of(context).pushNamed(
                          RoutePath.otpValidationRouter,
                        );
                      }
                    }),
              ]),
        ),
      ),
    );
  }
}
