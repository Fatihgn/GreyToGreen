import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grey_to_green/feature/login/screen/login_screen.dart';
import 'package:grey_to_green/product/navigation/app_router.dart';

/// mixin for login screen
mixin LoginScreenMixin on State<LoginScreen> {
  /// bool for password visibility
  bool passwordVisible = false;

  /// email controller
  final emailcontroller = TextEditingController();

  /// password controller
  final passcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();

    passwordVisible = true;
  }

  /// when the login button is pressed
  void onLoginButtonPressed() {
    AutoRouter.of(context).push(const RegisterRoute());
  }
}
