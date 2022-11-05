import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:mondaymorning/src/pages/home_page.dart';
import 'package:mondaymorning/src/ui/screens/home_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute<dynamic>(
      path: '/',
      name: 'HomeRoute',
      page: HomePage,
      initial: true,
      children: [
        AutoRoute<dynamic>(
          path: 'home',
          name: 'HomeScreenRoute',
          page: HomeScreen,
        ),
        AutoRoute<dynamic>(
          path: 'categories',
          name: 'CategoriesRoute',
          page: EmptyRouterPage,
        ),
        AutoRoute<dynamic>(
          path: 'expressions',
          name: 'ExpressionRouter',
          page: EmptyRouterPage,
        ),
        AutoRoute<dynamic>(
          path: 'more',
          name: 'MoreRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute<dynamic>(
              path: '',
              name: 'More',
              page: EmptyRouterPage,
            ),
          ],
        ),
      ],
    ),
    AutoRoute<dynamic>(
      path: 'article/:postId',
      name: 'ArticleRoute',
      page: EmptyRouterPage,
    ),
    AutoRoute<dynamic>(
      path: 'campus',
      name: 'CampusRoute',
      page: EmptyRouterPage,
    ),
    AutoRoute<dynamic>(
      path: 'connect',
      name: 'ConnectRoute',
      page: EmptyRouterPage,
    ),
    AutoRoute<dynamic>(
      path: 'ddcwc',
      name: 'DDCWCRoute',
      page: EmptyRouterPage,
    ),
    AutoRoute<dynamic>(
      path: 'career',
      name: 'CareerRoute',
      page: EmptyRouterPage,
    ),
    AutoRoute<dynamic>(
      path: 'alumni',
      name: 'AlumniRoute',
      page: EmptyRouterPage,
    ),
  ],
)
class $MMRouter {}