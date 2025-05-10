// import 'package:app/constant/app_color.dart';
// import 'package:app/constant/app_font_size.dart';
// import 'package:app/constant/app_size.dart';
// import 'package:flutter/material.dart';

// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback? onPressed;
//   final bool isLoading;
//   final Color? backgroundColor;
//   final Color? textColor;

//   const CustomButton({
//     super.key,
//     required this.text,
//     this.onPressed,
//     this.isLoading = false,
//     this.backgroundColor,
//     this.textColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: isLoading ? null : onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: backgroundColor ?? AppColors.primary,
//         foregroundColor: textColor ?? Colors.white,
//         minimumSize: Size(
//           AppResponsive.getWidth(context, 100),
//           AppResponsive.getHeight(context, 6),
//         ),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         elevation: 2,
//         padding: AppResponsive.getPadding(
//           context,
//           horizontalPercent: 4,
//           verticalPercent: 1,
//         ),
//       ),
//       child:
//           isLoading
//               ? const CircularProgressIndicator(color: Colors.white)
//               : Text(
//                 text,
//                 style: TextStyle(
//                   fontSize: AppResponsive.getFontSize(
//                     context,
//                     AppFontSizes.bodyLarge,
//                   ),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//     );
//   }
// }

import 'package:app/constant/app_color.dart';
import 'package:app/constant/app_typography.dart';
import 'package:app/constant/app_size.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primary,
        foregroundColor: textColor ?? AppColors.neutral10,
        minimumSize: Size(
          AppResponsive.getWidth(context, 100),
          AppResponsive.getHeight(context, 6),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        padding: AppResponsive.getPadding(
          context,
          horizontalPercent: 4,
          verticalPercent: 1,
        ),
      ),
      child: isLoading
          ? const CircularProgressIndicator(
              color: AppColors.neutral10,
            )
          : Text(
              text,
              style: AppTypography.bodyLargeBold.copyWith(
                color: textColor ?? AppColors.neutral10,
              ),
            ),
    );
  }
}
