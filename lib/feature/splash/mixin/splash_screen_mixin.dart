import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grey_to_green/feature/splash/screen/splash_screen.dart';
import 'package:grey_to_green/product/authentication/bloc/authentication_bloc.dart';
import 'package:grey_to_green/product/navigation/app_router.dart';

/// SplashScreenMixin is a mixin for SplashScreen
mixin SplashScreenMixin on State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  /// method to navigate to next screen
  /// [state] is the state of the authentication
  void navigateToNextScreen(AuthenticationState state) {
    Future.delayed(const Duration(seconds: 2), () {
      if (state.status.isAuthenticated) {
        context.router.replace(const WrapperRoute());
      } else {
        context.router.replace(const LoginRoute());
      }
    });
  }
}
