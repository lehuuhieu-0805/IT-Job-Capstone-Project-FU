import 'package:flutter/material.dart';
import 'package:it_job_mobile/widgets/input/password_field.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_color.dart';
import '../../constants/app_text_style.dart';
import '../../constants/label.dart';
import '../../constants/route.dart';
import '../../widgets/button/button.dart';

class ChangeNewPasswordPage extends StatefulWidget {
  const ChangeNewPasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangeNewPasswordPage> createState() => _ChangeNewPasswordPageState();
}

class _ChangeNewPasswordPageState extends State<ChangeNewPasswordPage> {
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmNewPassword = TextEditingController();
  bool _isNewPasswordEightCharacters = false;
  bool _hasNewPasswordOneNumber = false;
  bool _matchingPassword = false;

  onNewPasswordChange(String newPassword) {
    final numericRegex = RegExp(r'[0-9]');
    setState(
      () {
        _isNewPasswordEightCharacters = false;
        if (newPassword.length >= 8) _isNewPasswordEightCharacters = true;
        _hasNewPasswordOneNumber = false;
        if (numericRegex.hasMatch(newPassword)) _hasNewPasswordOneNumber = true;
      },
    );
  }

  onMatchingPassword(String password) {
    setState(
      () {
        _matchingPassword = false;
        if (_newPassword.text == _confirmNewPassword.text) {
          _matchingPassword = true;
        }
      },
    );
  }

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Label.titleChangeNewPasswordPage,
                      style: AppTextStyles.h2Black,
                    ),
                    Text(
                      Label.contentChangeNewPasswordPage,
                      style: AppTextStyles.h4Grey,
                    ),
                  ],
                ),
                Column(
                  children: [
                    PasswordField(
                      hintText: "New Password",
                      textInputAction: TextInputAction.next,
                      controller: _newPassword,
                      onChanged: (newPassword) =>
                          onNewPasswordChange(newPassword),
                      validator: null,
                    ),
                    PasswordField(
                      hintText: "Confirm New Password",
                      textInputAction: TextInputAction.done,
                      controller: _confirmNewPassword,
                      onChanged: (password) => onMatchingPassword(password),
                      validator: null,
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(
                                  milliseconds: 500,
                                ),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: _isNewPasswordEightCharacters
                                      ? AppColor.success
                                      : Colors.transparent,
                                  border: _isNewPasswordEightCharacters
                                      ? Border.all(color: Colors.transparent)
                                      : Border.all(
                                          color: AppColor.grey,
                                        ),
                                  borderRadius:
                                      BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: AppColor.primary,
                                    size: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              const Text("Contains at least 8 characters"),
                            ],
                          ),
                          SizedBox(
                            height: 2.w,
                          ),
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(
                                  milliseconds: 500,
                                ),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: _hasNewPasswordOneNumber
                                      ? AppColor.success
                                      : Colors.transparent,
                                  border: _hasNewPasswordOneNumber
                                      ? Border.all(color: Colors.transparent)
                                      : Border.all(
                                          color: AppColor.grey,
                                        ),
                                  borderRadius:
                                      BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: AppColor.primary,
                                    size: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              const Text("Contains at least 1 number"),
                            ],
                          ),
                          SizedBox(
                            height: 2.w,
                          ),
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(
                                  milliseconds: 500,
                                ),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: _matchingPassword
                                      ? AppColor.success
                                      : Colors.transparent,
                                  border: _matchingPassword
                                      ? Border.all(color: Colors.transparent)
                                      : Border.all(
                                          color: AppColor.grey,
                                        ),
                                  borderRadius:
                                      BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: AppColor.primary,
                                    size: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              const Text("Matching password"),
                            ],
                          ),
                        ],
                      ),
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
                    if (_isNewPasswordEightCharacters &&
                        _hasNewPasswordOneNumber &&
                        _matchingPassword) {
                      Navigator.of(context).pushNamed(
                        RoutePath.successChangePasswordRouter,
                      );
                    }
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
