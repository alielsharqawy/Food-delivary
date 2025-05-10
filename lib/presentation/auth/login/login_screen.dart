// // // ignore_for_file: deprecated_member_use

// // import 'package:app/constant/app_color.dart';
// // import 'package:app/constant/app_typography.dart';
// // import 'package:app/constant/app_size.dart';
// // import 'package:app/data/cubits/auth/login/login_cubit.dart';
// // import 'package:app/data/cubits/auth/login/login_state.dart';
// // import 'package:app/presentation/auth/forget_password/forget_password.dart';
// // import 'package:app/presentation/auth/register/register_screen.dart';
// // import 'package:app/presentation/home/home_screen.dart';
// // import 'package:app/widgets/Custom_form.dart';
// // import 'package:app/widgets/custom_button.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // class LoginScreen extends StatefulWidget {
// //   const LoginScreen({super.key});

// //   @override
// //   State<LoginScreen> createState() => _LoginScreenState();
// // }

// // class _LoginScreenState extends State<LoginScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _emailController = TextEditingController();
// //   final _passwordController = TextEditingController();

// //   bool _isLoading = false;

// //   @override
// //   void dispose() {
// //     _emailController.dispose();
// //     _passwordController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: BlocListener<AuthCubit, AuthState>(
// //         listener: (context, state) {
// //           if (state is AuthLoading) {
// //             setState(() => _isLoading = true);
// //           } else {
// //             setState(() => _isLoading = false);
// //           }

// //           if (state is AuthSuccess) {
// //             Navigator.pushReplacement(
// //               context,
// //               MaterialPageRoute(
// //                 builder: (_) => HomeScreen(email: state.user.email),
// //               ),
// //             );
// //           }

// //           if (state is AuthFailure) {
// //             ScaffoldMessenger.of(
// //               context,
// //             ).showSnackBar(SnackBar(content: Text(state.error)));
// //           }
// //         },
// //         child: Container(
// //           decoration: const BoxDecoration(
// //             gradient: LinearGradient(
// //               begin: Alignment.topCenter,
// //               end: Alignment.bottomCenter,
// //               colors: [AppColors.gradientStart, AppColors.gradientEnd],
// //             ),
// //           ),
// //           child: SafeArea(
// //             child: Center(
// //               child: SingleChildScrollView(
// //                 padding: AppResponsive.getPadding(context),
// //                 child: Form(
// //                   key: _formKey,
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Icon(
// //                         Icons.lock_rounded,
// //                         size: AppResponsive.getIconSize(context, 80),
// //                         color: Colors.white,
// //                       ),
// //                       SizedBox(height: AppResponsive.getHeight(context, 2)),
// //                       Text(
// //                         'Welcome Back',
// //                         style: TextStyle(
// //                           fontSize: AppResponsive.getFontSize(
// //                             context,
// //                             AppFontSizes.headingLarge,
// //                           ),
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                       SizedBox(height: AppResponsive.getHeight(context, 1)),
// //                       Text(
// //                         'Sign in to continue',
// //                         style: TextStyle(
// //                           fontSize: AppResponsive.getFontSize(
// //                             context,
// //                             AppFontSizes.bodyRegular,
// //                           ),
// //                           color: Colors.white.withOpacity(0.8),
// //                         ),
// //                       ),
// //                       SizedBox(height: AppResponsive.getHeight(context, 5)),
// //                       CustomFormField(
// //                         controller: _emailController,
// //                         fieldType: FormFieldType.email,
// //                         hintText: 'Email',
// //                       ),
// //                       SizedBox(height: AppResponsive.getHeight(context, 2)),
// //                       CustomFormField(
// //                         controller: _passwordController,
// //                         fieldType: FormFieldType.password,
// //                         hintText: 'Password',
// //                       ),
// //                       SizedBox(height: AppResponsive.getHeight(context, 3)),
// //                       CustomButton(
// //                         text: 'Login',
// //                         onPressed: () {
// //                           if (_formKey.currentState!.validate()) {
// //                             context.read<AuthCubit>().login(
// //                               _emailController.text.trim(),
// //                               _passwordController.text.trim(),
// //                             );
// //                           }
// //                         },
// //                         isLoading: _isLoading,
// //                       ),
// //                       SizedBox(height: AppResponsive.getHeight(context, 2)),
// //                       TextButton(
// //                         onPressed: () {
// //                           Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder:
// //                                   (context) => const ForgotPasswordScreen(),
// //                             ),
// //                           );
// //                         },
// //                         child: Text(
// //                           'Forgot Password?',
// //                           style: TextStyle(
// //                             color: Colors.white.withOpacity(0.9),
// //                             fontSize: AppResponsive.getFontSize(
// //                               context,
// //                               AppFontSizes.bodyRegular,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       TextButton(
// //                         onPressed: () {
// //                           Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder: (context) => const RegisterScreen(),
// //                             ),
// //                           );
// //                         },
// //                         child: Text(
// //                           'Don’t have an account? Register',
// //                           style: TextStyle(
// //                             color: Colors.white.withOpacity(0.9),
// //                             fontSize: AppResponsive.getFontSize(
// //                               context,
// //                               AppFontSizes.bodyRegular,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }


// // ignore_for_file: deprecated_member_use

// import 'package:app/constant/app_color.dart';
// import 'package:app/constant/app_typography.dart';
// import 'package:app/constant/app_size.dart';
// import 'package:app/data/cubits/auth/login/login_cubit.dart';
// import 'package:app/data/cubits/auth/login/login_state.dart';
// import 'package:app/presentation/auth/forget_password/forget_password.dart';
// import 'package:app/presentation/auth/register/register_screen.dart';
// import 'package:app/presentation/home/home_screen.dart';
// import 'package:app/widgets/Custom_form.dart';
// import 'package:app/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<AuthCubit, AuthState>(
//         listener: (context, state) {
//           if (state is AuthLoading) {
//             setState(() => _isLoading = true);
//           } else {
//             setState(() => _isLoading = false);
//           }

//           if (state is AuthSuccess) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => HomeScreen(email: state.user.email),
//               ),
//             );
//           }

//           if (state is AuthFailure) {
//             ScaffoldMessenger.of(
//               context,
//             ).showSnackBar(SnackBar(content: Text(state.error)));
//           }
//         },
//         child: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [AppColors.primaryAccent, AppColors.secondary],
//             ),
//           ),
//           child: SafeArea(
//             child: Center(
//               child: SingleChildScrollView(
//                 padding: AppResponsive.getPadding(context),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.lock_rounded,
//                         size: AppResponsive.getIconSize(context, 80),
//                         color: AppColors.neutral10,
//                       ),
//                       SizedBox(height: AppResponsive.getHeight(context, 2)),
//                       Text(
//                         'Welcome Back',
//                         style: AppTypography.heading1Regular.copyWith(
//                           color: AppColors.neutral10,
//                         ),
//                       ),
//                       SizedBox(height: AppResponsive.getHeight(context, 1)),
//                       Text(
//                         'Sign in to continue',
//                         style: AppTypography.bodyMediumRegular.copyWith(
//                           color: AppColors.neutral10.withOpacity(0.8),
//                         ),
//                       ),
//                       SizedBox(height: AppResponsive.getHeight(context, 5)),
//                       CustomFormField(
//                         controller: _emailController,
//                         fieldType: FormFieldType.email,
//                         hintText: 'Email',
//                       ),
//                       SizedBox(height: AppResponsive.getHeight(context, 2)),
//                       CustomFormField(
//                         controller: _passwordController,
//                         fieldType: FormFieldType.password,
//                         hintText: 'Password',
//                       ),
//                       SizedBox(height: AppResponsive.getHeight(context, 3)),
//                       CustomButton(
//                         text: 'Login',
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             context.read<AuthCubit>().login(
//                                   _emailController.text.trim(),
//                                   _passwordController.text.trim(),
//                                 );
//                           }
//                         },
//                         isLoading: _isLoading,
//                       ),
//                       SizedBox(height: AppResponsive.getHeight(context, 2)),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   const ForgotPasswordScreen(),
//                             ),
//                           );
//                         },
//                         child: Text(
//                           'Forgot Password?',
//                           style: AppTypography.bodyMediumRegular.copyWith(
//                             color: AppColors.neutral10.withOpacity(0.9),
//                           ),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const RegisterScreen(),
//                             ),
//                           );
//                         },
//                         child: Text(
//                           'Don’t have an account? Register',
//                           style: AppTypography.bodyMediumRegular.copyWith(
//                             color: AppColors.neutral10.withOpacity(0.9),
//                           ),
//                         ),
//                       ),
//                     ],
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


import 'package:app/constant/app_color.dart';
import 'package:app/constant/app_typography.dart';
import 'package:app/constant/app_size.dart';
import 'package:app/constant/app_images.dart';
import 'package:app/data/cubits/auth/login/login_cubit.dart';
import 'package:app/data/cubits/auth/login/login_state.dart';
import 'package:app/presentation/auth/forget_password/forget_password.dart';
import 'package:app/presentation/auth/register/register_screen.dart';
import 'package:app/presentation/home/home_screen.dart';
import 'package:app/widgets/Custom_form.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            setState(() => _isLoading = true);
          } else {
            setState(() => _isLoading = false);
          }

          if (state is AuthSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(email: state.user.email),
              ),
            );
          }

          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: AppResponsive.getPadding(context),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppResponsive.getHeight(context, 5)),
                  Text(
                    'Login to your\naccount.',
                    style: AppTypography.heading1Bold.copyWith(
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: AppResponsive.getHeight(context, 1.5)),
                  Text(
                    'Please sign in to your account',
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
                  SizedBox(height: AppResponsive.getHeight(context, 2)),
                  CustomFormField(
                    controller: _passwordController,
                    fieldType: FormFieldType.password,
                    hintText: 'Password',
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Forgot password?',
                        style: AppTypography.bodyMediumRegular.copyWith(
                          color: AppColors.primaryAccent,
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    text: 'Sign In',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
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
                          'Or sign in with',
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
                        "Don’t have an account? ",
                        style: AppTypography.bodyMediumRegular.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Register',
                          style: AppTypography.bodyMediumBold.copyWith(
                            color: AppColors.primaryAccent,
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
    );
  }

  Widget _buildSocialIcon(String asset) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey.shade200,
      child: Image.asset(
        asset,
        width: 24,
        height: 24,
      ),
    );
  }
}
