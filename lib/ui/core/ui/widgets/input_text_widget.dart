import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/utils/constants/appcolors/app_colors.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget(
      {super.key,
      required this.hintTex,
      required this.controller,
      this.textInputType = TextInputType.text,
      this.validator,
      this.suffixIcon,
      this.prefixIcon});

  final String hintTex;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintTex,
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