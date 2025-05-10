// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:app/data/cubits/auth/register/register_cubit.dart';
// import 'package:app/data/cubits/auth/register/register_state.dart';
// import 'package:app/data/repos/auth/auth_repo.dart';
// import 'package:app/constant/app_color.dart';
// import 'package:app/constant/app_typography.dart';
// import 'package:app/constant/app_size.dart';
// import 'package:app/widgets/Custom_form.dart';
// import 'package:app/widgets/custom_button.dart';
// import 'package:flutter/material.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => RegisterCubit(AuthRepository()),
//       child: BlocListener<RegisterCubit, RegisterState>(
//         listener: (context, state) {
//           if (state is RegisterSuccess) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Registration successful!')),
//             );
//             Navigator.pop(context); // أو روح للوجين
//           } else if (state is RegisterFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.error)),
//             );
//           }
//         },
//         child: Scaffold(
//           body: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [AppColors.gradientStart, AppColors.gradientEnd],
//               ),
//             ),
//             child: SafeArea(
//               child: Center(
//                 child: SingleChildScrollView(
//                   padding: AppResponsive.getPadding(context),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.person_add_rounded,
//                           size: AppResponsive.getIconSize(context, 80),
//                           color: Colors.white,
//                         ),
//                         SizedBox(height: AppResponsive.getHeight(context, 2)),
//                         Text(
//                           'Create Account',
//                           style: TextStyle(
//                             fontSize: AppResponsive.getFontSize(
//                               context,
//                               AppFontSizes.headingLarge,
//                             ),
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: AppResponsive.getHeight(context, 1)),
//                         Text(
//                           'Join us today',
//                           style: TextStyle(
//                             fontSize: AppResponsive.getFontSize(
//                               context,
//                               AppFontSizes.bodyRegular,
//                             ),
//                             color: Colors.white.withOpacity(0.8),
//                           ),
//                         ),
//                         SizedBox(height: AppResponsive.getHeight(context, 5)),
//                         CustomFormField(
//                           controller: _nameController,
//                           fieldType: FormFieldType.name,
//                           hintText: 'Full Name',
//                         ),
//                         SizedBox(height: AppResponsive.getHeight(context, 2)),
//                         CustomFormField(
//                           controller: _emailController,
//                           fieldType: FormFieldType.email,
//                           hintText: 'Email',
//                         ),
//                         SizedBox(height: AppResponsive.getHeight(context, 2)),
//                         CustomFormField(
//                           controller: _passwordController,
//                           fieldType: FormFieldType.password,
//                           hintText: 'Password',
//                         ),
//                         SizedBox(height: AppResponsive.getHeight(context, 2)),
//                         CustomFormField(
//                           controller: _confirmPasswordController,
//                           fieldType: FormFieldType.confirmPassword,
//                           hintText: 'Confirm Password',
//                           passwordController: _passwordController,
//                         ),
//                         SizedBox(height: AppResponsive.getHeight(context, 3)),
//                         BlocBuilder<RegisterCubit, RegisterState>(
//                           builder: (context, state) {
//                             final isLoading = state is RegisterLoading;
//                             return CustomButton(
//                               text: 'Register',
//                               isLoading: isLoading,
//                               onPressed: () {
//                                 if (_formKey.currentState!.validate()) {
//                                   context.read<RegisterCubit>().register(
//                                         _nameController.text.trim(),
//                                         _emailController.text.trim(),
//                                         _passwordController.text.trim(),
//                                       );
//                                 }
//                               },
//                             );
//                           },
//                         ),
//                         SizedBox(height: AppResponsive.getHeight(context, 2)),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: Text(
//                             'Already have an account? Login',
//                             style: TextStyle(
//                               color: Colors.white.withOpacity(0.9),
//                               fontSize: AppResponsive.getFontSize(
//                                 context,
//                                 AppFontSizes.bodyRegular,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/data/cubits/auth/register/register_cubit.dart';
import 'package:app/data/cubits/auth/register/register_state.dart';
import 'package:app/data/repos/auth/auth_repo.dart';
import 'package:app/constant/app_color.dart';
import 'package:app/constant/app_typography.dart';
import 'package:app/constant/app_size.dart';
import 'package:app/widgets/Custom_form.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

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
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registration successful!')),
            );
            Navigator.pop(context);
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Scaffold(
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
                          Icons.person_add_rounded,
                          size: AppResponsive.getIconSize(context, 80),
                          color: AppColors.neutral10,
                        ),
                        SizedBox(height: AppResponsive.getHeight(context, 2)),
                        Text(
                          'Create Account',
                          style: AppTypography.heading1Regular.copyWith(
                            color: AppColors.neutral10,
                          ),
                        ),
                        SizedBox(height: AppResponsive.getHeight(context, 1)),
                        Text(
                          'Join us today',
                          style: AppTypography.bodyMediumRegular.copyWith(
                            color: AppColors.neutral10.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: AppResponsive.getHeight(context, 5)),
                        CustomFormField(
                          controller: _nameController,
                          fieldType: FormFieldType.name,
                          hintText: 'Full Name',
                        ),
                        SizedBox(height: AppResponsive.getHeight(context, 2)),
                        CustomFormField(
                          controller: _emailController,
                          fieldType: FormFieldType.email,
                          hintText: 'Email',
                        ),
                        SizedBox(height: AppResponsive.getHeight(context, 2)),
                        CustomFormField(
                          controller: _passwordController,
                          fieldType: FormFieldType.password,
                          hintText: 'Password',
                        ),
                        SizedBox(height: AppResponsive.getHeight(context, 2)),
                        CustomFormField(
                          controller: _confirmPasswordController,
                          fieldType: FormFieldType.confirmPassword,
                          hintText: 'Confirm Password',
                          passwordController: _passwordController,
                        ),
                        SizedBox(height: AppResponsive.getHeight(context, 3)),
                        BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (context, state) {
                            final isLoading = state is RegisterLoading;
                            return CustomButton(
                              text: 'Register',
                              isLoading: isLoading,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<RegisterCubit>().register(
                                        _nameController.text.trim(),
                                        _emailController.text.trim(),
                                        _passwordController.text.trim(),
                                      );
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(height: AppResponsive.getHeight(context, 2)),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Already have an account? Login',
                            style: AppTypography.bodyMediumBold.copyWith(
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
        ),
      ),
    );
  }
}
