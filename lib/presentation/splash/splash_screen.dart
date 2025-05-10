// // ignore_for_file: deprecated_member_use

// import 'package:app/constant/app_color.dart';
// import 'package:app/constant/app_typography.dart';
// import 'package:app/constant/app_size.dart';
// import 'package:app/presentation/onboarding/onboarding_screen.dart';
// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize animation controller
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );

//     // Define fade and scale animations
//     _fadeAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
//     _scaleAnimation = Tween<double>(
//       begin: 0.8,
//       end: 1.0,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

//     // Start animation
//     _controller.forward();

//     // Navigate to onboarding screen after 3 seconds
//     Future.delayed(const Duration(seconds: 3), () {
//       if (mounted) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const OnboardingScreen(),
//           ),
//         );
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [AppColors.gradientStart, AppColors.gradientEnd],
//           ),
//         ),
//         child: Center(
//           child: FadeTransition(
//             opacity: _fadeAnimation,
//             child: ScaleTransition(
//               scale: _scaleAnimation,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.star_rounded,
//                     size: AppResponsive.getIconSize(context, 100),
//                     color: Colors.white,
//                   ),
//                   SizedBox(height: AppResponsive.getHeight(context, 2)),
//                   Text(
//                     'MyApp',
//                     style: TextStyle(
//                       fontSize: AppResponsive.getFontSize(context, AppFontSizes.headingLarge),
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       letterSpacing: 2,
//                       shadows: [
//                         Shadow(
//                           blurRadius: 10,
//                           color: Colors.black.withOpacity(0.3),
//                           offset: const Offset(2, 2),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: AppResponsive.getHeight(context, 1)),
//                   Text(
//                     'Your Journey Begins',
//                     style: TextStyle(
//                       fontSize: AppResponsive.getFontSize(context, AppFontSizes.bodyRegular),
//                       color: Colors.white.withOpacity(0.8),
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// ignore_for_file: deprecated_member_use

import 'package:app/constant/app_color.dart';
import 'package:app/constant/app_typography.dart';
import 'package:app/constant/app_size.dart';
import 'package:app/presentation/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primaryAccent, AppColors.secondary],
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_rounded,
                    size: AppResponsive.getIconSize(context, 100),
                    color: AppColors.neutral10,
                  ),
                  SizedBox(height: AppResponsive.getHeight(context, 2)),
                  Text(
                    'MyApp',
                    style: AppTypography.heading2Regular.copyWith(
                      color: AppColors.neutral10,
                      letterSpacing: 2,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppResponsive.getHeight(context, 1)),
                  Text(
                    'Your Journey Begins',
                    style: AppTypography.bodyMediumRegular.copyWith(
                      color: AppColors.neutral10.withOpacity(0.8),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
