import 'package:dartt_hermes/pages/auth/binding/signin_binding.dart';
import 'package:dartt_hermes/pages/auth/view/sigin_screen.dart';
import 'package:dartt_hermes/pages/auth/view/signup_screen.dart';
import 'package:dartt_hermes/pages/home/view/home_screen.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PageRoutes.signin,
      page: () => SignInScreen(),
      binding: SigninBinding(),
    ),
    GetPage(name: PageRoutes.signup, page: () => SignUpScreen()),
    GetPage(name: PageRoutes.home, page: () => const HomePage()),
  ];
}

abstract class PageRoutes {
  static const String home = '/';
  static const String signin = '/signin';
  static const String signup = '/signup';
}
