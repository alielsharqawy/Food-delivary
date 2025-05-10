import 'package:app/constant/app_routes.dart';
import 'package:app/presentation/auth/forget_password/forget_password.dart';
import 'package:app/presentation/auth/login/login_screen.dart';
import 'package:app/presentation/auth/register/register_screen.dart';
import 'package:app/presentation/auth/reset_password/reset_password.dart';
import 'package:app/presentation/home/home_screen.dart';
import 'package:app/presentation/onboarding/onboarding_screen.dart';
import 'package:app/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case AppRoutes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      case AppRoutes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case AppRoutes.home:
        final email = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => HomeScreen(email: email));
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case AppRoutes.splash:
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
