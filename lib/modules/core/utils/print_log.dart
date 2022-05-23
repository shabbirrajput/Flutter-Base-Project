import 'package:flutter/foundation.dart';
class PrintLog {

  static printLog(message)
  {
    if(kDebugMode) {
      print(message);
    }
  }
}
