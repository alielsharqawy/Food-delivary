// // ignore_for_file: deprecated_member_use

// import 'package:app/constant/app_color.dart';
// import 'package:app/constant/app_typography.dart';
// import 'package:app/constant/app_size.dart';
// import 'package:app/widgets/Custom_form.dart';
// import 'package:app/widgets/custom_button.dart';
// import 'package:flutter/material.dart';

// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
// }

// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
//   }

//   void _handleResetPassword() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() => _isLoading = true);
//       // Simulated network delay
//       await Future.delayed(const Duration(seconds: 1));
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Password reset link sent!')),
//       );
//       setState(() => _isLoading = false);
//     }
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
//         child: SafeArea(
//           child: Center(
//             child: SingleChildScrollView(
//               padding: AppResponsive.getPadding(context),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.lock_reset_rounded,
//                       size: AppResponsive.getIconSize(context, 80),
//                       color: Colors.white,
//                     ),
//                     SizedBox(height: AppResponsive.getHeight(context, 2)),
//                     Text(
//                       'Forgot Password',
//                       style: TextStyle(
//                         fontSize: AppResponsive.getFontSize(
//                           context,
//                           AppFontSizes.headingLarge,
//                         ),
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: AppResponsive.getHeight(context, 1)),
//                     Text(
//                       'Enter your email to reset your password',
//                       style: TextStyle(
//                         fontSize: AppResponsive.getFontSize(
//                           context,
//                           AppFontSizes.bodyRegular,
//                         ),
//                         color: Colors.white.withOpacity(0.8),
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: AppResponsive.getHeight(context, 5)),
//                     CustomFormField(
//                       controller: _emailController,
//                       fieldType: FormFieldType.email,
//                       hintText: 'Email',
//                     ),
//                     SizedBox(height: AppResponsive.getHeight(context, 3)),
//                     CustomButton(
//                       text: 'Reset Password',
//                       onPressed: _handleResetPassword,
//                       isLoading: _isLoading,
//                     ),
//                     SizedBox(height: AppResponsive.getHeight(context, 2)),
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: Text(
//                         'Back to Login',
//                         style: TextStyle(
//                           color: Colors.white.withOpacity(0.9),
//                           fontSize: AppResponsive.getFontSize(
//                             context,
//                             AppFontSizes.bodyRegular,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
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
import 'package:app/widgets/Custom_form.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleResetPassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset link sent!')),
      );
      setState(() => _isLoading = false);
    }
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
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: AppResponsive.getPadding(context),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_reset_rounded,
                      size: AppResponsive.getIconSize(context, 80),
                      color: AppColors.neutral10,
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 2)),
                    Text(
                      'Forgot Password',
                      style: AppTypography.heading1Regular.copyWith(
                        color: AppColors.neutral10,
                      ),
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 1)),
                    Text(
                      'Enter your email to reset your password',
                      style: AppTypography.bodyMediumRegular.copyWith(
                        color: AppColors.neutral10.withOpacity(0.8),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 5)),
                    CustomFormField(
                      controller: _emailController,
                      fieldType: FormFieldType.email,
                      hintText: 'Email',
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 3)),
                    CustomButton(
                      text: 'Reset Password',
                      onPressed: _handleResetPassword,
                      isLoading: _isLoading,
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 2)),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Back to Login',
                        style: AppTypography.bodyMediumRegular.copyWith(
                          color: AppColors.neutral10.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
