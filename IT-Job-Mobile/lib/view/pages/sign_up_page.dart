import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image_path.dart';
import '../../constants/app_text_style.dart';
import '../../constants/label.dart';
import '../../constants/route.dart';
import '../../widgets/button/button.dart';
import '../../widgets/input/input_field.dart';
import '../../widgets/input/password_field.dart';
import '../sign_in/already_have_an_account_check.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppColor.primary,
          height: 105.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Label.titleSignUpPage,
                textAlign: TextAlign.center,
                style: AppTextStyles.h1Black,
              ),
              Image.asset(
                ImagePath.create,
                width: 65.w,
                height: 30.h,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    InputField(
                      hintText: "Full Name",
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name cannot be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
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
                height: 5.h,
              ),
              ButtonDefault(
                  width: 80.w,
                  height: 7.h,
                  content: 'Create an Account',
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
              SizedBox(
                height: 2.h,
              ),
              AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    setState(() {
                      Navigator.of(context).pushNamed(
                        RoutePath.signInRoute,
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
