
import 'package:flutterbase/utils/common_import.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      this.hintText,
      this.labelText,
      this.isEnabled,
      this.keyboardType,
      required this.obscureText,
      this.controller})
      : super(key: key);
  String? hintText;
  String? labelText;
  bool? isEnabled;

  // ignore: prefer_typing_uninitialized_variables
  final controller;

  // ignore: prefer_typing_uninitialized_variables
  final keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            contentPadding: const EdgeInsets.only(left:Dimens.margin15),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.colorGrey),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.colorGrey),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.colorGrey),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.colorGrey),
            ),
          )),
    );
  }
}
