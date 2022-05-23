import 'dart:math';

import 'package:flutterbase/modules/core/api_service/preference_helper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';

import '../../auth/model/model_user.dart';
import '../common/widgets/app_localizations.dart';
import '../utils/common_import.dart';

/// A [getTranslate] This Method use to get Translate String
String? getTranslate(String strTranslate) {
  return AppLocalizations.of(NavigatorKey.navigatorKey.currentContext!)!
      .translate(strTranslate);
}

///[printWrapped] this function is used to print only in debug mode
void printWrapped(String text) {
  /// 800 is the size of each chunk
  final pattern = RegExp('.{1,800}');
  // ignore: avoid_print
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

/// A [formatDate] widget is a widget that describes part of the formatDate
/// * [mDate] which contains the mDate
/// * [mDateFormat] which contains the mDateFormat
String formatDate(var mDate, String mDateFormat) {
  try {
    var dateFormatter = DateFormat(mDateFormat);
    String dateFormatted = dateFormatter.format(mDate);
    return dateFormatted;
  } catch (e) {
    return mDate.toString();
  }
}

/// [getUser] login user data
ModelUser getUser() {
  String? data = PreferenceHelper.getString(PreferenceHelper.userData);
  if (data != null && data.isNotEmpty) {
    ModelUser streams = ModelUser.fromJson(json.decode(data));
    return streams;
  } else {
    return ModelUser();
  }
}

/// A [formatTime] widget is a widget that describes part of the formatTime
/// * [mTime] which contains the time
/// * [mTimeFormat] which contains the Format
String formatTime(var mTime, String mTimeFormat) {
  try {
    String selTime = '${mTime.hour}:${mTime.minute}:00';
    String dateFormatted =
        DateFormat.jm().format(DateFormat(mTimeFormat).parse(selTime));
    return dateFormatted;
  } catch (e) {
    return mTime.toString();
  }
}

/// A [formatDate] widget is a widget that describes part of the formatDate
/// * [dateStr] which contains the mDate
/// * [inPutDateFormat] which contains the input
/// * [outPutDateFormat] which contains the output
String convertDateFormat(
    String dateStr, String inPutDateFormat, String outPutDateFormat) {
  try {
    DateTime tempDate = DateFormat(inPutDateFormat).parse(dateStr);
    var date = tempDate.toUtc();
    var dateLocal = date.toLocal();
    String newDate = DateFormat(outPutDateFormat).format(dateLocal);
    return newDate;
  } catch (e) {
    return '-';
  }
}

/// A [convertStringToDateFormat] widget is a widget that describes part of the convertStringToDateFormat
/// * [dateStr] which contains the mDate
/// * [inPutDateFormat] which contains the input
DateTime convertStringToDateFormat(String dateStr, String inPutDateFormat) {
  try {
    DateTime newDate = DateFormat(inPutDateFormat).parse(dateStr);
    return newDate;
  } catch (e) {
    return DateTime.now();
  }
}

///[randomImage] This method use to random Image
String randomImage() {
  var rng = Random();
  return 'https://picsum.photos/500/500?random=${rng.nextInt(500)}';
}

///[randomNumber] This method use to random Number
int randomNumber({required int maxNum, int? min}) {
  var rng = Random();
  return rng.nextInt(
        maxNum - (min ?? 0),
      ) +
      (min ?? 0);
}

/// A [checkConnectivity] widget is a widget that describes part of check Connectivity
Future<bool> checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

/// A [getTextStyle] This Method Use to getTextStyle
TextStyle getTextStyle(
    TextStyle mainTextStyle, double size, FontWeight fontWeight) {
  return mainTextStyle.copyWith(fontSize: size, fontWeight: fontWeight);
}

/// A [getFileImageSize] is a method that calculates MB from bytes
double getFileImageSize(var bytes) {
  final mb = bytes / (1024 * 1024);
  return mb;
}

/// A [validatePhone] widget is a widget that describes part of validate Phone number
bool validatePhone(String data) =>
    RegExp(r'(^(?:[+0]9)?[0-9]{8,12}$)').hasMatch(data);

/// A [validateEmail] widget is a widget that describes part of validate Phone number
bool validateEmail(String data) => RegExp(
        r'^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{2,6}\.)?[a-z]{2,6}$')
    .hasMatch(data);

/// A [validatePassword] widget is a widget that describes part of validate Phone number
bool validatePassword(String data) => RegExp(
        r'(^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$)')
    .hasMatch(data);
