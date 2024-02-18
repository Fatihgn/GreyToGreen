import 'package:authentication_repository/index.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/index.dart';
import 'package:grey_to_green/feature/splash/mixin/splash_screen_mixin.dart';
import 'package:grey_to_green/product/authentication/bloc/authentication_bloc.dart';

@RoutePage()

/// SplashScreen is the first screen that is shown when the app is launched
class SplashScreen extends StatefulWidget {
  /// constructor for SplashScreen
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SplashScreenMixin {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthenticationRepository(),
      child: BlocProvider(
        create: (context) => AuthenticationBloc(
          authenticationRepository: context.read<AuthenticationRepository>(),
        ),
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (BuildContext context, state) {
            navigateToNextScreen(state);
          },
          child: Scaffold(
            body: Center(
              child: SizedBox(
                width: 200,
                child: Assets.animations.loadingAnim.lottie(package: 'gen'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
