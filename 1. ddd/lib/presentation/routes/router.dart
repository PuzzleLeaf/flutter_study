import 'package:auto_route/auto_route_annotations.dart';
import 'package:domain_driven/presentation/sign_in/sign_in_page.dart';
import 'package:domain_driven/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SignInPage, ),
    MaterialRoute(page: SplashPage, initial: true),
  ]
)
class $Router {}