


import 'package:flutterbase/modules/auth/view/screen_login.dart';
import 'package:flutterbase/modules/splash/view/screen_splash.dart';
import 'package:flutterbase/modules/welcome_cards/view/screen_welcome_card.dart';

import 'common_import.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.routes_splash:
        return MaterialPageRoute(
            builder: (_) => ScreenSplash(),
            settings: RouteSettings(name: AppRoutes.routes_splash));
      case AppRoutes.routes_login:
        return MaterialPageRoute(
            builder: (_) => ScreenLogin(),
            settings: RouteSettings(name: AppRoutes.routes_login));
      case AppRoutes.routes_welcome_card:
        return MaterialPageRoute(
            builder: (_) => ScreenWelcomeCard(),
            settings: RouteSettings(name: AppRoutes.routes_welcome_card));
      default:
        return MaterialPageRoute(
            builder: (_) => ScreenSplash(),
            settings: RouteSettings(name: AppRoutes.routes_splash));
    }
  }
}