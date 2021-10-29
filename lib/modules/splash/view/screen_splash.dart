import 'package:flutterbase/utils/common_import.dart';


class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () async {
      NavigatorKey.navigatorKey.currentState!.pushNamedAndRemoveUntil(
          AppRoutes.routes_welcome_card, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget background = new Container(
      height: double.infinity,
      width: double.infinity,
      child: new Image.asset(
        APPImages.ic_splash,
        fit: BoxFit
            .cover, // I thought this would fill up my Container but it doesn't
      ),
    );
    return SafeArea(
        child: Scaffold(
          body: background,
        ));
  }
}
