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
        path: '/DetailsPage/:name/:age/:occupation',
        name: 'DetailsPage',
        builder: (context, state) => DetailsPage(
          name: state.pathParameters['name']!,
          age: state.pathParameters['age']!,
          occupation: state.pathParameters['occupation']!,
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
