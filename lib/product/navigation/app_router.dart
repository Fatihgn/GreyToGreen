import 'package:auto_route/auto_route.dart';
import 'package:grey_to_green/feature/add_event/screen/planning_event_screen.dart';
import 'package:grey_to_green/feature/events/screen/event_list_screen.dart';
import 'package:grey_to_green/feature/home/screen/home_screen.dart';
import 'package:grey_to_green/feature/login/screen/login_screen.dart';
import 'package:grey_to_green/feature/map/screen/map_screen.dart';
import 'package:grey_to_green/feature/profile/screen/profile_screen.dart';
import 'package:grey_to_green/feature/register/screen/register_screen.dart';
import 'package:grey_to_green/feature/splash/screen/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')

/// App router
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
      ];
}
