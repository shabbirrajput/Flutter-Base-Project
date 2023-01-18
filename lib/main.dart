import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutterbase/modules/core/utils/common_import.dart';

import 'app.dart';

/// `main()` is the entry point of the program
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('themeBox');
  FlavorConfig(
    variables: {
      "env": "main",
      "base": "https://probook-backend.staging9.com/",
      "front_end_base": "https://probook.staging9.com/"
    },
  );
  runApp(const MyApp());
}
