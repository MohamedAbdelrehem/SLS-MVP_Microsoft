import 'package:go_router/go_router.dart';
import 'package:sls_mvp_microsoft/features/AR/ar_view.dart';
import 'package:sls_mvp_microsoft/features/authentication/presentation/view/login_view.dart';
import 'package:sls_mvp_microsoft/features/authentication/presentation/view/register_view.dart';
import 'package:sls_mvp_microsoft/features/home/view/add_car.dart';
import 'package:sls_mvp_microsoft/features/home/view/home_view.dart';

import 'package:sls_mvp_microsoft/features/monitoring/monitoring_view.dart';
import 'package:sls_mvp_microsoft/features/splash/views/slash_view.dart';

abstract class AppRouter {
  // static const kHomeView = '/homeView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/DetailsPage/:name/:ignite/:temp',
        name: 'DetailsPage',
        builder: (context, state) => DetailsPage(
          name: state.pathParameters['name']!,
          ignite: state.pathParameters['ignite']!,
          temp: state.pathParameters['temp']!,
        ),
      ),
      GoRoute(
        path: '/cars',
        builder: (context, state) => const CarView(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) {
          print('insideapprouter');
          return const HomeView();
        },
      ),
      //route for AR
      GoRoute(
        path: '/ar',
        builder: (context, state) => ARPage(),
      ),
    ],
  );
}
