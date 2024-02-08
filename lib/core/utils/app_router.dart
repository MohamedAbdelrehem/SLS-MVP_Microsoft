import 'package:go_router/go_router.dart';
import 'package:sls_mvp_microsoft/features/authentication/login_view.dart';
import 'package:sls_mvp_microsoft/features/authentication/register_view.dart';
import 'package:sls_mvp_microsoft/features/home/home_view.dart';

abstract class AppRouter {
  // static const kHomeView = '/homeView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        //hiiiiiiiiii
        path: '/',
        builder: (context, state) => const LoginView(),
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
