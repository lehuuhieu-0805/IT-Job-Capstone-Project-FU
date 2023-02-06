import 'package:flutter/material.dart';
import 'package:it_job_mobile/view/pages/change_new_password_page.dart';
import 'package:it_job_mobile/view/pages/edit_profile_page.dart';
import 'package:it_job_mobile/view/pages/forgot_password_page.dart';
import 'package:it_job_mobile/view/pages/otp_validation_page.dart';
import 'package:it_job_mobile/view/pages/profile_page.dart';
import 'package:it_job_mobile/view/pages/success_change_password_page.dart';

import '../../constants/route.dart';

import '../../view/bottom_tab_bar/bottom_tab_bar.dart';
import '../../view/pages/sign_in_page.dart';
import '../../view/pages/not_found_page.dart';
import '../../view/pages/onboarding_page.dart';
import '../../view/pages/sign_up_page.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutePath.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case RoutePath.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case RoutePath.forgotPasswordRouter:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case RoutePath.changeNewPasswordRouter:
        return MaterialPageRoute(builder: (_) => const ChangeNewPasswordPage());
      case RoutePath.otpValidationRouter:
        return MaterialPageRoute(builder: (_) => const OTPValidationPage());
      case RoutePath.successChangePasswordRouter:
        return MaterialPageRoute(
            builder: (_) => const SuccessChangePasswordPage());
      case RoutePath.signUpRouter:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case RoutePath.bottomTabBarRouter:
        return MaterialPageRoute(builder: (_) => const BottomTabBar());
      case RoutePath.profileRouter:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case RoutePath.editProfileRouter:
        return MaterialPageRoute(builder: (_) => const EditProfilePage());

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
