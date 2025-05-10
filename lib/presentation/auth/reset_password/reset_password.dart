// // ignore_for_file: use_build_context_synchronously, deprecated_member_use

// import 'package:app/constant/app_color.dart';
// import 'package:app/constant/app_typography.dart';
// import 'package:app/constant/app_size.dart';
// import 'package:app/widgets/custom_button.dart';
// import 'package:flutter/material.dart';

// class ResetPasswordScreen extends StatefulWidget {
//   const ResetPasswordScreen({super.key});

//   @override
//   State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
// }

// class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   void _handleResetPassword() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() => _isLoading = true);
//       // Simulated API call
//       await Future.delayed(const Duration(seconds: 1));
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Password reset successfully!')),
//       );
//       setState(() => _isLoading = false);
//       Navigator.pop(context);
//     }
//   }

//   Widget _buildPasswordField({
//     required String hintText,
//     required TextEditingController controller,
//     required bool obscureText,
//     required VoidCallback toggleObscure,
//     required String? Function(String?) validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white.withOpacity(0.9),
//         prefixIcon: const Icon(Icons.lock, color: Colors.blue),
//         suffixIcon: IconButton(
//           icon: Icon(
//             obscureText ? Icons.visibility_off : Icons.visibility,
//             color: Colors.blue,
//           ),
//           onPressed: toggleObscure,
//         ),
//         hintText: hintText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide.none,
//         ),
//       ),
//       validator: validator,
//     );
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
//                       Icons.lock_open_rounded,
//                       size: AppResponsive.getIconSize(context, 80),
//                       color: Colors.white,
//                     ),
//                     SizedBox(height: AppResponsive.getHeight(context, 2)),
//                     Text(
//                       'Reset Password',
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
//                       'Enter your new password',
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
//                     _buildPasswordField(
//                       hintText: 'New Password',
//                       controller: _passwordController,
//                       obscureText: _obscurePassword,
//                       toggleObscure: () {
//                         setState(() => _obscurePassword = !_obscurePassword);
//                       },
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a new password';
//                         }
//                         if (value.length < 6) {
//                           return 'Password must be at least 6 characters';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: AppResponsive.getHeight(context, 2)),
//                     _buildPasswordField(
//                       hintText: 'Confirm New Password',
//                       controller: _confirmPasswordController,
//                       obscureText: _obscureConfirmPassword,
//                       toggleObscure: () {
//                         setState(() => _obscureConfirmPassword =
//                             !_obscureConfirmPassword);
//                       },
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please confirm your password';
//                         }
//                         if (value != _passwordController.text) {
//                           return 'Passwords do not match';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: AppResponsive.getHeight(context, 3)),
//                     CustomButton(
//                       text: 'Reset Password',
//                       onPressed: _handleResetPassword,
//                       isLoading: _isLoading,
//                     ),
//                     SizedBox(height: AppResponsive.getHeight(context, 2)),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
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


// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:app/constant/app_color.dart';
import 'package:app/constant/app_typography.dart';
import 'package:app/constant/app_size.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleResetPassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 1));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset successfully!')),
      );
      setState(() => _isLoading = false);
      Navigator.pop(context);
    }
  }

  Widget _buildPasswordField({
    required String hintText,
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback toggleObscure,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.neutral10.withOpacity(0.9),
        prefixIcon: const Icon(Icons.lock, color: Colors.blue),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.blue,
          ),
          onPressed: toggleObscure,
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
    );
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
                      Icons.lock_open_rounded,
                      size: AppResponsive.getIconSize(context, 80),
                      color: AppColors.neutral10,
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 2)),
                    Text(
                      'Reset Password',
                      style: AppTypography.heading1Regular.copyWith(
                        color: AppColors.neutral10,
                      ),
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 1)),
                    Text(
                      'Enter your new password',
                      style: AppTypography.bodyMediumRegular.copyWith(
                        color: AppColors.neutral10.withOpacity(0.8),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 5)),
                    _buildPasswordField(
                      hintText: 'New Password',
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      toggleObscure: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a new password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 2)),
                    _buildPasswordField(
                      hintText: 'Confirm New Password',
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      toggleObscure: () {
                        setState(() => _obscureConfirmPassword =
                            !_obscureConfirmPassword);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 3)),
                    CustomButton(
                      text: 'Reset Password',
                      onPressed: _handleResetPassword,
                      isLoading: _isLoading,
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 2)),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
