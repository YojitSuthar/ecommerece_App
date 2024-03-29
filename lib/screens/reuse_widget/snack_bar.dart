import 'package:ecommerce/resources/color_manager.dart';
import 'package:ecommerce/resources/style_manager.dart';
import 'package:flutter/material.dart';

class WarningBar{
  SnackBar snack(String warning) {
    return SnackBar(
      content: Text(
        warning,
        style: TextStyle(
            color: ColorManager.blackColor,
            fontSize: 15,
            fontWeight: FontWeightManager.semiBold),
      ),
      backgroundColor: ColorManager.redColor,
      behavior: SnackBarBehavior.floating,
    );
  }
}