import 'package:flutterbase/modules/core/utils/common_import.dart';

/// This class is a stateful widget that creates a state object that is used to create a splash screen
/// `ScreenSplash` is a `StatefulWidget` that creates a `_ScreenSplashState` when it's built
class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () async {
      NavigatorKey.navigatorKey.currentState!
          .pushNamedAndRemoveUntil(AppRoutes.routesWelcomeCard, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget background = SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset(
        APPImages.icSplash,
        fit: BoxFit.cover, // I thought this would fill up my Container but it doesn't
      ),
    );
    return SafeArea(
        child: Scaffold(
      body: background,
    ));
  }
}
