import 'package:flutter/material.dart';

class AppResponsive {
  // Get responsive width as a percentage of screen width
  static double getWidth(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * (percentage / 100);
  }

  // Get responsive height as a percentage of screen height
  static double getHeight(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * (percentage / 100);
  }

  // Get responsive font size based on screen width
  static double getFontSize(BuildContext context, double baseSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Scale font size based on a reference width of 375 (standard mobile)
    return baseSize * (screenWidth / 375);
  }

  // Get responsive padding/margin
  static EdgeInsets getPadding(BuildContext context, {double horizontalPercent = 5, double verticalPercent = 2}) {
    return EdgeInsets.symmetric(
      horizontal: getWidth(context, horizontalPercent),
      vertical: getHeight(context, verticalPercent),
    );
  }

  // Determine if the device is a tablet (based on width > 600)
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }

  // Get responsive icon size
  static double getIconSize(BuildContext context, double baseSize) {
    return isTablet(context) ? baseSize * 1.5 : baseSize;
  }
}