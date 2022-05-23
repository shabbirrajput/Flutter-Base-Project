import 'package:flutterbase/modules/auth/view/screen_login.dart';
import 'package:flutterbase/modules/splash/view/screen_splash.dart';
import 'package:flutterbase/modules/welcome_cards/view/screen_welcome_card.dart';

import 'common_import.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.routesSplash:
        return MaterialPageRoute(
            builder: (_) => const ScreenSplash(),
            settings: const RouteSettings(name: AppRoutes.routesSplash));
      case AppRoutes.routesLogin:
        return MaterialPageRoute(
            builder: (_) => const ScreenLogin(),
            settings: const RouteSettings(name: AppRoutes.routesLogin));
      case AppRoutes.routesWelcomeCard:
        return MaterialPageRoute(
            builder: (_) => const ScreenWelcomeCard(),
            settings: const RouteSettings(name: AppRoutes.routesWelcomeCard));
      default:
        return MaterialPageRoute(
            builder: (_) => const ScreenSplash(),
            settings: const RouteSettings(name: AppRoutes.routesSplash));
    }
  }
}