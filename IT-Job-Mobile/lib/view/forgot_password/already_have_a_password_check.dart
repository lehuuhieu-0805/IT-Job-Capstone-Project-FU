import 'package:flutter/material.dart';

import '../../constants/app_text_style.dart';

class AlreadyHaveAPasswordCheck extends StatelessWidget {
  final bool forgot;
  final Function() press;
  const AlreadyHaveAPasswordCheck({
    Key? key,
    this.forgot = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          forgot ? "Forgot Password? " : "Remember your password? ",
          style: AppTextStyles.h5Black,
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            forgot ? "Click Here" : "Sign In",
            style: AppTextStyles.h5darkBlue,
          ),
        ),
      ],
    );
  }
}
