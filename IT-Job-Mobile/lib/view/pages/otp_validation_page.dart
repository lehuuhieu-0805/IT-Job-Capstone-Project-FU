import 'dart:async';
import 'package:flutter/material.dart';
import 'package:it_job_mobile/constants/app_color.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../../constants/app_text_style.dart';
import '../../constants/label.dart';
import '../../constants/route.dart';

class OTPValidationPage extends StatefulWidget {
  const OTPValidationPage({Key? key}) : super(key: key);

  @override
  State<OTPValidationPage> createState() => _OTPValidationPageState();
}

class _OTPValidationPageState extends State<OTPValidationPage> {
  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;
  bool _onEditing = true;
  String _code = "";

  late Timer _time;
  int _start = 60;

  void resend() {
    setState(() {
      _isResendAgain = true;
    });

    const oneSec = Duration(seconds: 1);
    _time = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 60;
          _isResendAgain = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  verify() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = Duration(milliseconds: 5000);
    _time = Timer.periodic(oneSec, (timer) {
      setState(() {
        _isLoading = false;
        _isVerified = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
          child: Container(
        width: 100.w,
        height: 100.h,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
                    Label.titleOTPValidationPage,
                    style: AppTextStyles.h2Black,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    Label.contentOTPValidationPage,
                    style: AppTextStyles.h4Grey,
                  ),
                  Text(
                    "+84 *****9136",
                    style: AppTextStyles.h4Grey,
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              VerificationCode(
                textStyle: AppTextStyles.h3Black,
                keyboardType: TextInputType.number,
                underlineColor: AppColor.black,
                length: 4,
                cursorColor: AppColor.black,
                onCompleted: (String value) {
                  setState(() {
                    _code = value;
                  });
                },
                onEditing: (bool value) {
                  setState(() {
                    _onEditing = value;
                  });
                  if (!_onEditing) FocusScope.of(context).unfocus();
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't receive the OTP? ",
                    style: AppTextStyles.h5Black,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_isResendAgain) return;
                      resend();
                    },
                    child: Text(
                      _isResendAgain
                          ? "Try again in " + _start.toString()
                          : "Resend",
                      style: AppTextStyles.h5darkBlue,
                    ),
                  )
                ],
              ),
            ],
          ),
          MaterialButton(
            disabledColor: AppColor.primary,
            onPressed: _code.length < 4
                ? null
                : () {
                    verify();
                    if (_isVerified) {
                      Navigator.of(context).pushNamed(
                        RoutePath.changeNewPasswordRouter,
                      );
                    }
                  },
            color: AppColor.blue,
            minWidth: 80.w,
            height: 7.h,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(12,),),),
            child: _isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      backgroundColor: AppColor.white,
                      strokeWidth: 3,
                    ),
                  )
                : _isVerified
                    ? Text(
                        "Submit",
                        style: AppTextStyles.h3White,
                      )
                    : Text(
                        "Verify",
                        style: AppTextStyles.h3White,
                      ),
          ),
        ]),
      )),
    );
  }
}
