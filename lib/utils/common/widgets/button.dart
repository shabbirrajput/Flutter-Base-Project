import 'package:flutter/material.dart';
import 'package:flutterbase/utils/common_import.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    this.buttonText,
    this.color,
  }) : super(key: key);

  String? buttonText;
  final Function? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 0, left: 0, bottom: 15),
      alignment: Alignment.center,
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: AppColors.colorPrimary,
      ),
      child: Text(
        '$buttonText',
        style: AppFont.colorWhite_14,
      ),
    );
  }
}

// ignore: must_be_immutable
class UploadButton extends StatelessWidget {
  UploadButton({
    Key? key,
    this.buttonText,
    this.color,
  }) : super(key: key);

  String? buttonText;
  final Function? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 0, left: 0, bottom: 15),
      alignment: Alignment.centerLeft,
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        color: AppColors.colorWhite,
        border: Border.all(color: AppColors.colorGrey),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          '$buttonText',
          style: GoogleFonts.lato(color: AppColors.colorGrey, fontSize: 14),
        ),
      ),
    );
  }
}
