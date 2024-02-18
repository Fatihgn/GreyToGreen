import 'package:authentication_repository/index.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grey_to_green/feature/login/cubit/cubit/login_screen_cubit.dart';
import 'package:grey_to_green/feature/login/mixin/login_screen_mixin.dart';
import 'package:grey_to_green/product/navigation/app_router.dart';

@RoutePage()

/// login screen is the first screen that is shown when the app is launched
class LoginScreen extends StatefulWidget {
  /// constructor for LoginScreen
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> with LoginScreenMixin {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return RepositoryProvider(
      create: (context) => AuthenticationRepository(),
      child: BlocProvider(
        create: (context) => LoginScreenCubit(
          authenticationRepository: context.read<AuthenticationRepository>(),
        ),
        child: Material(
          child: BlocListener<LoginScreenCubit, LoginScreenState>(
            listener: (context, state) {
              if (state.status == LoginStatus.authenticated) {
                context.router.replace(const HomeRoute());
              }
            },
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset(
                      'assets/images/applogo.png',
                      width: screenWidth / 2,
                      height: screenHeight / 4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Volunteering : Small Action, Big Impact!',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: const Color.fromARGB(255, 74, 111, 9),
                          ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: screenHeight / 2,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 195, 201, 175),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 40, left: 20, right: 20),
                        child: Column(
                          children: <Widget>[
                            _EmailInput(),
                            _PasswordInput(),
                            _LoginButton(),
                            const SizedBox(height: 10),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.only(left: 200),
                                foregroundColor: Colors.black,
                              ),
                              child: Text(
                                'Forgot Password?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              child: OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.only(
                                    left: 85,
                                    right: 85,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                ),
                                onPressed: () {},
                                icon: const Image(
                                  image: AssetImage(
                                    'assets/images/googleicon.png',
                                  ),
                                  width: 20,
                                ),
                                label: Text(
                                  'Sign in with Google',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: onLoginButtonPressed,
                              child:
                                  const Text('Don’t have an account? Sign up'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenCubit, LoginScreenState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) =>
              context.read<LoginScreenCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'email',
            helperText: '',
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenCubit, LoginScreenState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginScreenCubit>().passwordChanged(password),
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'password',
            helperText: '',
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenCubit, LoginScreenState>(
      builder: (context, state) {
        return state.status.isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color(0xFFFFD600),
                ),
                onPressed: () {
                  context.read<LoginScreenCubit>().loginWithCredentials();
                },
                child: const Text('LOGIN'),
              );
      },
    );
  }
}
