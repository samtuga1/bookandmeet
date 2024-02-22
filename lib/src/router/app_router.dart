import 'package:bookandmeet/src/modules/customer/welcome/welcome_view.dart';
import 'package:bookandmeet/src/modules/module.dart';
import 'package:bookandmeet/src/modules/shared/account/create_account/create_account_view.dart';
import 'package:bookandmeet/src/modules/shared/account/verify/verify_view.dart';
import 'package:bookandmeet/src/router/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) => switch (settings.name) {
        Routes.initial => route(const GetStarted()),
        Routes.signUpSwitcher => route(const SignUpSwitcher()),
        Routes.create_account => route(const CreateAccountView()),
        Routes.verifyOtp => route(const VerifyOtpView()),
        Routes.welcome => route(const CustomerWelcomeView()),
        _ => route(const Scaffold()),
      };

  Route route(Widget routeWidget, {RouteSettings? settings}) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => routeWidget,
    );
  }
}
