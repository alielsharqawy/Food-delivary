import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showErrorPopup(BuildContext context, String message) {
  Flushbar(
    message: message,
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.redAccent,
    margin: const EdgeInsets.all(16),
    borderRadius: BorderRadius.circular(12),
    icon: const Icon(Icons.error, color: Colors.white),
    animationDuration: const Duration(milliseconds: 500),
    flushbarPosition: FlushbarPosition.TOP,
  ).show(context);
}
