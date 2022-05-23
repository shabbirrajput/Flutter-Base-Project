import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/common_import.dart';

/// A [ToastController] widget is a widget that describes part of the user interface by ToastController
/// * [message] which contains the Toast Text
/// * [BuildContext] which contains the Toast context
/// * [bool] which contains the isSuccess or not
class ToastController {
  static showToast(String message, bool isSuccess) {
    if (kIsWeb) {
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          webShowClose: true,
          webPosition: 'center',
          webBgColor: isSuccess
              ? 'linear-gradient(to right, #2E7D32, #2E7D32)'
              : 'linear-gradient(to right, #fe4f4f, #fe4f4f)',
          fontSize: 16.0);
    } else {
      final snackBar = SnackBar(
        content: Text(
          message,
         /// style: AppFont.boldWhite_15,
        ),
        backgroundColor: isSuccess ? Colors.green : AppColors.colorPrimary,
      );
      ScaffoldMessenger.of(NavigatorKey.navigatorKey.currentContext!).showSnackBar(snackBar);
    }
  }
}
