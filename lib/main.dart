import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterbase/modules/auth/bloc/login_bloc.dart';
import 'package:flutterbase/modules/splash/view/screen_splash.dart';
import 'package:flutterbase/utils/common/app_localizations.dart';
import 'package:flutterbase/utils/common_import.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static ValueNotifier<Locale> notifier =
  ValueNotifier<Locale>(const Locale(APPStrings.languageEn));

  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    updateLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    addingMobileUiStyles(context);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.colorPrimary, // Color for Android
        statusBarBrightness:
        Brightness.dark // Dark == white status bar -- for IOS.
    ));
    return ValueListenableBuilder<Locale>(
      builder: (BuildContext context, Locale newLocale, Widget? child) {
        return MultiProvider(
            providers: [
              BlocProvider<LoginBloc>(
                create: (BuildContext context) => LoginBloc(),
              ),
            ],
            child: MaterialApp(
              title: 'Flutter 9SPL',
              locale: newLocale,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                AppLocalizations.delegate
              ],
              supportedLocales: const [
                Locale(APPStrings.languageEn, ''), // English
                Locale(APPStrings.languageAr, '') //
              ],
              theme: ThemeData(
                primaryColor: AppColors.colorPrimary,
                unselectedWidgetColor: Colors.black,
                highlightColor: Colors.white,
              ),
              initialRoute: AppRoutes.routesSplash,
              home: const ScreenSplash(),
              onGenerateRoute: RouteGenerator.generateRoute,
              navigatorKey: NavigatorKey.navigatorKey,
              debugShowCheckedModeBanner: false,
            ));
      },
      valueListenable: MyApp.notifier,
    );
  }

  void addingMobileUiStyles(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: (Theme.of(context).brightness == Brightness.dark)
            ? Colors.transparent
            : AppColors.colorPrimary,
        /* set Status bar color in Android devices. */

        statusBarIconBrightness: Brightness.dark,
        /* set Status bar icons color in Android devices.*/

        statusBarBrightness: Brightness.dark));
  }

  Future<void> updateLanguage() async {
    MyApp.notifier.value = const Locale(APPStrings.languageEn);
  }
}
