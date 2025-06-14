import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/utils/constants/appcolors/app_colors.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      this.textInputType = TextInputType.text,
      this.validator,
      this.suffixIcon,
      this.prefixIcon,
      this.isPasswordVisible = false,
      this.isReadOnly = false,
      this.maxLines});

  final String hintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isPasswordVisible;
  final bool isReadOnly;
  final int? maxLines;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      obscureText: isPasswordVisible,
      maxLines: maxLines,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.hintTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

//C6CEDD