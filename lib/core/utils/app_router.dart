import 'package:go_router/go_router.dart';
import 'package:sls_mvp_microsoft/features/home/home_view.dart';
import 'package:sls_mvp_microsoft/features/home/widgets/home_view_body.dart';

abstract class AppRouter {
  // static const kHomeView = '/homeView';
  static final router = GoRouter(
    routes: [
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) => const SplashView(),
      // ),
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
