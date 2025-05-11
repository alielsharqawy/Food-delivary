import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/constant/app_color.dart';
import 'package:app/constant/app_typography.dart';
import 'package:app/constant/app_size.dart';
import 'package:app/widgets/Custom_form.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:app/data/cubits/auth/register/register_cubit.dart';
import 'package:app/data/cubits/auth/register/register_state.dart';
import 'package:app/data/repos/auth/auth_repo.dart';
import 'package:app/constant/app_images.dart';
import 'package:app/presentation/auth/login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(AuthRepository()),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) async {
          if (state is RegisterLoading) {
            setState(() => _isLoading = true);
          } else {
            setState(() => _isLoading = false);
          }

          if (state is RegisterSuccess) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                title: const Text('Registration Successful'),
                content: const Text('Your account has been created successfully.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: const Text('Go to Login'),
                  ),
                ],
              ),
            );
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Scaffold(
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
                      'Create your\naccount.',
                      style: AppTypography.heading1Bold.copyWith(
                        color: Colors.black,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 1.5)),
                    Text(
                      'Join us today by filling the form below',
                      style: AppTypography.bodyMediumRegular.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 4)),
                    CustomFormField(
                      controller: _nameController,
                      fieldType: FormFieldType.name,
                      hintText: 'Full Name',
                      label: "Name",
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 2)),
                    CustomFormField(
                      controller: _emailController,
                      fieldType: FormFieldType.email,
                      hintText: 'Email',
                      label: "Email Address",
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 2)),
                    CustomFormField(
                      controller: _passwordController,
                      fieldType: FormFieldType.password,
                      hintText: 'Password',
                      label: 'Password',
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 2)),
                    CustomFormField(
                      controller: _confirmPasswordController,
                      fieldType: FormFieldType.confirmPassword,
                      hintText: 'Confirm Password',
                      label: 'Confirm Password',
                      passwordController: _passwordController,
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 3)),
                    CustomButton(
                      text: 'Register',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<RegisterCubit>().register(
                                _nameController.text.trim(),
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                              );
                        }
                      },
                      isLoading: _isLoading,
                      backgroundColor: AppColors.primaryAccent,
                      textColor: Colors.white,
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 3)),
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey[300])),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Or register with',
                            style: AppTypography.bodySmallRegular.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey[300])),
                      ],
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon(AppImages.googleIcon),
                        SizedBox(width: 20),
                        _buildSocialIcon(AppImages.facebookIcon),
                        SizedBox(width: 20),
                        _buildSocialIcon(AppImages.appleIcon),
                      ],
                    ),
                    SizedBox(height: AppResponsive.getHeight(context, 4)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: AppTypography.bodyMediumRegular.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login',
                            style: AppTypography.bodyMediumBold.copyWith(
                              color: AppColors.secondary,
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildSocialIcon(String asset) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey.shade200,
      child: Image.asset(asset, width: 24, height: 24),
    );
  }
}
