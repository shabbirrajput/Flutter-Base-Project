import 'package:flutter/material.dart';
import 'package:flutterbase/utils/common_import.dart';

// ignore: must_be_immutable
class CustomTextFieldImage extends StatelessWidget {
  CustomTextFieldImage(
      {Key? key,
      this.hintText,
      this.labelText,
      this.image,
      this.isEnabled,
      this.keyboardType,
      required this.obscureText,
      this.controller})
      : super(key: key);
  String? hintText;
  String? labelText;
  String? image;
  bool? isEnabled;

  // ignore: prefer_typing_uninitialized_variables
  final controller;

  // ignore: prefer_typing_uninitialized_variables
  final keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.margin50,
      child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          enabled: isEnabled,
          style: AppFont.semiBoldBlack1_16,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            labelStyle: AppFont.boldBlack54_14,
            hintStyle: AppFont.boldBlack54_14,
            contentPadding: EdgeInsets.only(left: Dimens.margin15,right: Dimens.margin24),
            suffix: Container(
              margin: EdgeInsets.only(top: Dimens.margin5),
              height: Dimens.margin20,
              width: Dimens.margin35,
              child: Image.network(
                image!,
                fit: BoxFit.fill,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.colorGrey),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.colorGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.colorGrey),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.colorGrey),
            ),
          )),
    );
  }
}
