// ignore_for_file: file_names
import 'package:app/constant/app_color.dart';
import 'package:app/constant/app_typography.dart';
import 'package:flutter/material.dart';

enum FormFieldType { email, password, name, confirmPassword }
class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  final FormFieldType fieldType;
  final String hintText;
  final String? label; 
  final TextEditingController? passwordController;
  final ValueChanged<bool>? onToggleObscure;

  const CustomFormField({
    super.key,
    required this.controller,
    required this.fieldType,
    required this.hintText,
    this.label,
    this.passwordController,
    this.onToggleObscure,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText =
        widget.fieldType == FormFieldType.password ||
        widget.fieldType == FormFieldType.confirmPassword;
  }

  IconData _getPrefixIcon() {
    switch (widget.fieldType) {
      case FormFieldType.email:
        return Icons.email;
      case FormFieldType.password:
      case FormFieldType.confirmPassword:
        return Icons.lock;
      case FormFieldType.name:
        return Icons.person;
    }
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter ${widget.hintText.toLowerCase()}';
    }
    switch (widget.fieldType) {
      case FormFieldType.email:
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        break;
      case FormFieldType.password:
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        break;
      case FormFieldType.confirmPassword:
        if (value != widget.passwordController?.text) {
          return 'Passwords do not match';
        }
        break;
      case FormFieldType.name:
        if (value.length < 2) {
          return 'Name must be at least 2 characters';
        }
        break;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppTypography.bodyMediumBold.copyWith(
              color: AppColors.neutral90,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: widget.controller,
          keyboardType:
              widget.fieldType == FormFieldType.email
                  ? TextInputType.emailAddress
                  : TextInputType.text,
          obscureText:
              _obscureText &&
              (widget.fieldType == FormFieldType.password ||
                  widget.fieldType == FormFieldType.confirmPassword),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.neutral10,
            prefixIcon: Icon(_getPrefixIcon(), color: AppColors.infoDark),
            suffixIcon:
                (widget.fieldType == FormFieldType.password ||
                        widget.fieldType == FormFieldType.confirmPassword)
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.infoDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                            widget.onToggleObscure?.call(_obscureText);
                          });
                        },
                      )
                    : null,
            hintText: widget.hintText,
            hintStyle: AppTypography.bodyMediumRegular.copyWith(
              color: AppColors.neutral50,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          style: AppTypography.bodyMediumRegular.copyWith(
            color: AppColors.neutral90,
          ),
          validator: _validateInput,
        ),
      ],
    );
  }
}
