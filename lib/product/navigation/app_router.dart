import 'package:auto_route/auto_route.dart';
import 'package:grey_to_green/feature/home/screen/home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')

/// App router
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: HomeRoute.page),
      ];
}
