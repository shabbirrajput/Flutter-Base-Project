import 'package:connectivity/connectivity.dart';
import 'package:flutterbase/utils/common/app_localizations.dart';
import 'package:flutterbase/utils/common_import.dart';
import 'package:intl/intl.dart';

String? getTranslate(BuildContext context, String strTranslate) {
  return AppLocalizations.of(context)!.translate(strTranslate);
}

String formatDate(var mDate, String mDateFormat) {
  try {
    var dateFormatter = DateFormat(mDateFormat);
    String dateFormatted = dateFormatter.format(mDate);
    return dateFormatted;
  } catch (e) {
    return mDate.toString();
  }
}


Future<bool> checkConnectivity() async{
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    return true;
  }else{
    return false;
  }
}

bool validatePhone(String data) =>
    RegExp(r'(^(?:[+0]9)?[0-9]{8,12}$)').hasMatch(data);