import 'dart:ui' show ImageFilter;
export 'dart:ui' show ImageFilter;

import 'package:flutter/cupertino.dart'
    show
        Alignment,
        Border,
        BorderSide,
        BoxDecoration,
        BuildContext,
        Color,
        Column,
        Container,
        CrossAxisAlignment,
        CupertinoButton,
        CupertinoDatePicker,
        CupertinoDatePickerMode,
        CupertinoIcons,
        CupertinoTheme,
        EdgeInsets,
        Expanded,
        FontWeight,
        Icon,
        Key,
        MainAxisAlignment,
        Navigator,
        Row,
        SizedBox,
        Text,
        TextStyle,
        Widget,
        required,
        showCupertinoModalPopup;

import 'package:flutter/material.dart' show Color, Colors;
import 'package:flutterbase/utils/common_import.dart';
export 'package:flutter/material.dart' show Color, Colors;

void showCupertinoDatePicker(
  BuildContext context, {
  Key? key,
  CupertinoDatePickerMode mode = CupertinoDatePickerMode.dateAndTime,
  @required Function(DateTime value)? onDateTimeChanged,
  DateTime? initialDateTime,
  DateTime? minimumDate,
  DateTime? maximumDate,
  int minimumYear = 1,
  int? maximumYear,
  int minuteInterval = 1,
  bool use24hFormat = false,
  Color? backgroundColor,
  ImageFilter? filter,
  bool useRootNavigator = true,
  bool? semanticsDismissible,
  Widget? cancelText,
  Widget? doneText,
  bool useText = false,
  bool leftHanded = false,
}) {
  // Default to right now.
  initialDateTime ??= DateTime.now();
  showCupertinoModalPopup(
    context: context,
    builder: (context) => SizedBox(
      height: 240.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.colorWhite,
              border: Border(
                bottom: const BorderSide(width: 0.5, color: Colors.white),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 5,
                width: 50,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.5),
                  color: AppColors.colorGreyLight,
                  border: Border(
                    bottom: const BorderSide(width: 0.5, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: CupertinoDatePicker(
            key: key,
            mode: mode,
            onDateTimeChanged: (DateTime value) {
              if (onDateTimeChanged == null) return;
              if (mode == CupertinoDatePickerMode.time) {
                onDateTimeChanged(
                    DateTime(0000, 01, 01, value.hour, value.minute));
              } else {
                onDateTimeChanged(value);
              }
            },
            initialDateTime: initialDateTime,
            minimumDate: minimumDate,
            maximumDate: maximumDate,
            minimumYear: minimumYear,
            maximumYear: maximumYear,
            minuteInterval: minuteInterval,
            use24hFormat: use24hFormat,
            backgroundColor: AppColors.colorWhite,
          )),
        ],
      ),
    ),
    filter: filter,
    useRootNavigator: useRootNavigator,
    semanticsDismissible: semanticsDismissible,
  );
}
