import 'package:dartt_hermes/pages/auth/view/sigin_screen.dart';
import 'package:dartt_hermes/pages/auth/view/signup_screen.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(name: PageRoutes.signin, page: () => SignInScreen()),
    GetPage(name: PageRoutes.signup, page: () => SignUpScreen()),
  ];
}

abstract class PageRoutes {
  static const String signin = '/signin';
  static const String signup = '/signup';
}