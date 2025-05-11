import 'package:flutter/material.dart';
import 'package:app/constant/app_color.dart';
import 'package:app/constant/app_typography.dart';
import 'package:app/constant/app_size.dart';
import 'package:app/widgets/Custom_form.dart';
import 'package:app/widgets/custom_button.dart';

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
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset link sent!')),
      );
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppResponsive.getPadding(context),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppResponsive.getHeight(context, 5)),
                Text(
                  'Forgot password?',
                  style: AppTypography.heading1Bold.copyWith(
                    color: Colors.black,
                    fontSize: 28,
                  ),
                ),
                SizedBox(height: AppResponsive.getHeight(context, 1.5)),
                Text(
                  'Enter your email address and we’ll send you confirmation code to reset your password',
                  style: AppTypography.bodyMediumRegular.copyWith(
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: AppResponsive.getHeight(context, 4)),
                CustomFormField(
                  controller: _emailController,
                  fieldType: FormFieldType.email,
                  hintText: 'Email Address',
                ),
                SizedBox(height: AppResponsive.getHeight(context, 3)),
                CustomButton(
                  text: 'Continue',
                  onPressed: _handleResetPassword,
                  isLoading: _isLoading,
                  backgroundColor: AppColors.primaryAccent,
                  textColor: Colors.white,
                ),
                SizedBox(height: AppResponsive.getHeight(context, 2)),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Back to Login',
                      style: AppTypography.bodyMediumRegular.copyWith(
                        color: AppColors.primaryAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
