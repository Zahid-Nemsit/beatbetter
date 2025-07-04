import 'package:beatbetter/features/home/presentation/ui/screens/main_home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/forgotpassword/presentation/ui/screens/forgot_password_enter_email_screen.dart';
import '../../features/authentication/forgotpassword/presentation/ui/screens/forgot_password_enter_new_password_screen.dart';
import '../../features/authentication/signin/presentation/ui/screens/login_screen.dart';
import '../../features/authentication/signup/presentation/ui/screens/signup_screen.dart';
import '../../features/startup/presentation/ui/screens/splash_screen.dart';
import 'route_names.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  // final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: getRoutePath(loginRoute),
    // redirect: (context, state) {
    //   final isGoingToLogin = state.matchedLocation == '/login';
    //
    //   if (authState) {
    //     if (isGoingToLogin) {
    //       return '/home';
    //     }
    //   }
    //
    //   return null;
    // },
    routes: [
      GoRoute(
        path: getRoutePath(splashRoute),
        name: splashRoute,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: getRoutePath(loginRoute),
        name: loginRoute,
        builder: (context, state) => const LoginScreen(),
        routes: [
          GoRoute(
            path: getRoutePath(forgotPasswordEnterEmailRoute),
            name: forgotPasswordEnterEmailRoute,
            builder: (context, state) => const ForgotPasswordEnterEmailScreen(),
            routes: [
              GoRoute(
                path: getRoutePath(forgotPasswordEnterNewPasswordRoute),
                name: forgotPasswordEnterNewPasswordRoute,
                builder: (context, state) => const ForgotPasswordEnterNewPasswordScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: getRoutePath(singUpRoute),
        name: singUpRoute,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: getRoutePath(homeRoute),
        name: homeRoute,
        builder: (context, state) => const MainHomeScreen(),
      ),
    ],
  );
});

String getRoutePath(String route) {
  return "/$route";
}
