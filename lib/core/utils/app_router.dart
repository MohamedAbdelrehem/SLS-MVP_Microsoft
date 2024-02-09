import 'package:go_router/go_router.dart';
import 'package:sls_mvp_microsoft/features/authentication/login_view.dart';
import 'package:sls_mvp_microsoft/features/authentication/register_view.dart';
import 'package:sls_mvp_microsoft/features/home/home_view.dart';
import 'package:sls_mvp_microsoft/features/monitoring/monitoring_view.dart';

abstract class AppRouter {
  // static const kHomeView = '/homeView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
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
        path: '/register',
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
