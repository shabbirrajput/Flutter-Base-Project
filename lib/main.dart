import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutterbase/modules/core/utils/common_import.dart';

import 'app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('themeBox');
  runApp(const MyApp());
}

