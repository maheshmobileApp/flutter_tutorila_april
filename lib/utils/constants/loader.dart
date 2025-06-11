import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/utils/constants/appcolors/app_colors.dart';

class Loaders {
  static circularShowLoader(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const Center(
              child: CircularProgressIndicator(
            backgroundColor: AppColors.hintTextColor,
            color: AppColors.primaryColor,
          ));
        });
  }

  static circularHideLoader(BuildContext context) {
      Navigator.pop(context);
    // navigationService.goBack();
  }
}
