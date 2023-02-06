import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:it_job_mobile/view/sign_in/already_have_an_account_check.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image_path.dart';
import '../../constants/app_text_style.dart';
import '../../constants/label.dart';
import '../../constants/route.dart';
import '../../widgets/button/button.dart';
import '../../widgets/input/input_field.dart';
import '../../widgets/input/password_field.dart';
import '../forgot_password/already_have_a_password_check.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppColor.primary,
          height: 100.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Label.titleSignInPage,
                textAlign: TextAlign.center,
                style: AppTextStyles.h1Black,
              ),
              Image.asset(
                ImagePath.logo,
                width: 65.w,
                height: 30.h,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    InputField(
                      hintText: "Phone Number",
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {},
                      validator: (value) {
                        if (value != null && value.length < 10) {
                          return "Phone must 10 character";
                        } else {
                          return null;
                        }
                      },
                    ),
                    PasswordField(
                        hintText: "Password",
                        textInputAction: TextInputAction.done,
                        controller: _password,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value != null && value.length < 8) {
                            return "Password must 8 character";
                          } else {
                            return null;
                          }
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              AlreadyHaveAPasswordCheck(
                press: () {
                  Navigator.of(context).pushNamed(
                    RoutePath.forgotPasswordRouter,
                  );
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              ButtonDefault(
                  width: 80.w,
                  height: 7.h,
                  content: 'Sign In',
                  textStyle: AppTextStyles.h3White,
                  backgroundBtn: AppColor.btnColor,
                  voidCallBack: () {
                    final isValidForm = formKey.currentState!.validate();
                    if (isValidForm) {
                      Navigator.of(context).pushNamed(
                        RoutePath.signInRoute,
                      );
                    }
                  }),
              SizedBox(
                height: 2.h,
              ),
              const OrDivider(),
              SizedBox(
                height: 2.h,
              ),
              SignInButton(
                Buttons.Google,
                padding: const EdgeInsets.all(
                  4,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    RoutePath.bottomTabBarRouter,
                  );
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              AlreadyHaveAnAccountCheck(press: () {
                setState(() {
                  Navigator.of(context).pushNamed(
                    RoutePath.signUpRouter,
                  );
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.2.h),
      width: 80.w,
      child: Row(children: [
        Expanded(
          child: Divider(
            color: AppColor.darkBlue,
            height: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "OR",
            style: AppTextStyles.h4Grey,
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColor.darkBlue,
            height: 1,
          ),
        ),
      ]),
    );
  }
}
