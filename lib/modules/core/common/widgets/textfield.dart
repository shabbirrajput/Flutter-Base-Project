import 'package:flutterbase/modules/core/utils/common_import.dart';

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
    OutlineInputBorder mOutlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).canvasColor),
    );
    return SizedBox(
      height: Dimens.margin50,
      child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          enabled: isEnabled,
          style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!,
              Dimens.margin14, FontWeight.bold),
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            labelStyle: getTextStyle(
                Theme.of(context).primaryTextTheme.headline1!,
                Dimens.margin14,
                FontWeight.bold),
            hintStyle: getTextStyle(
                Theme.of(context).primaryTextTheme.headline1!,
                Dimens.margin14,
                FontWeight.bold),
            contentPadding: const EdgeInsets.only(left: Dimens.margin15),
            border: mOutlineInputBorder,
            enabledBorder: mOutlineInputBorder,
            focusedBorder: mOutlineInputBorder,
            disabledBorder: mOutlineInputBorder,
          )),
    );
  }
}
