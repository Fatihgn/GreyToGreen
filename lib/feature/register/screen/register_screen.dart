import 'package:authentication_repository/index.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grey_to_green/feature/login/widgets/login_register_textfield.dart';
import 'package:grey_to_green/feature/register/cubit/register_screen_cubit.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterScreen> {
  bool passwordVisible = false;
  String choosegender = 'Male';

  List<String> gender = ['Male', 'Female', 'Other'];
  late final TextEditingController emailcontroller;
  late final TextEditingController namecontroller;
  late final TextEditingController usernamecontroller;
  late final TextEditingController gendercontroller;
  late final TextEditingController agecontroller;
  late final TextEditingController passwordcontroller;
  late final TextEditingController conpasswordcontroller;
  @override
  void initState() {
    emailcontroller = TextEditingController();
    namecontroller = TextEditingController();
    usernamecontroller = TextEditingController();
    gendercontroller = TextEditingController();
    agecontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    conpasswordcontroller = TextEditingController();
    passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return RepositoryProvider(
      create: (context) => AuthenticationRepository(),
      child: BlocProvider(
        create: (context) =>
            RegisterScreenCubit(context.read<AuthenticationRepository>()),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 195, 201, 175),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Image.asset(
                      'assets/images/applogo.png',
                      width: screenWidth / 4,
                      height: screenHeight / 6,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      prefixicon: const Icon(Icons.person_3_outlined),
                      hintText: 'Name: ',
                      textController: namecontroller,
                    ),
                    CustomTextFormField(
                      prefixicon: const Icon(Icons.person_3_outlined),
                      hintText: 'Username: ',
                      textController: usernamecontroller,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            prefixicon: const Icon(Icons.work_rounded),
                            hintText: 'Age: ',
                            textController: agecontroller,
                          ),
                        ),
                        const SizedBox(width: 25),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12),
                              color: const Color.fromARGB(255, 250, 243, 243),
                            ),
                            child: Center(
                              child: DropdownButton(
                                value: choosegender,
                                icon:
                                    const Icon(Icons.arrow_drop_down_outlined),
                                items: [
                                  for (final item in gender)
                                    DropdownMenuItem(
                                      value: item,
                                      child: Text(
                                        item,
                                      ),
                                    ),
                                ],
                                onChanged: (newValue) {
                                  if (newValue == null) {
                                    return;
                                  }
                                  setState(() {
                                    choosegender = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    _EmailInput(),
                    _PasswordInput(),
                    _ConfirmPasswordInput(),
                    _SignUpButton(),
                    SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: screenWidth,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 53, 96, 42),
                                Color.fromARGB(255, 73, 210, 36),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'LOGIN',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
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
                          image: AssetImage('assets/images/googleicon.png'),
                          width: 20,
                        ),
                        label: Text(
                          'Sign in with Google',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text(
                        'Do you have an account? Sign in',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
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
    return BlocBuilder<RegisterScreenCubit, RegisterScreenState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_emailInput_textField'),
          onChanged: (email) =>
              context.read<RegisterScreenCubit>().emailChanged(email),
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
    return BlocBuilder<RegisterScreenCubit, RegisterScreenState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<RegisterScreenCubit>().passwordChanged(password),
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

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterScreenCubit, RegisterScreenState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_confirmedPasswordInput_textField'),
          onChanged: (confirmPassword) => context
              .read<RegisterScreenCubit>()
              .confirmedPasswordChanged(confirmPassword),
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'confirm password',
            helperText: '',
          ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterScreenCubit, RegisterScreenState>(
      builder: (context, state) {
        return state.status.isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('signUpForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.orangeAccent,
                ),
                onPressed: () => context
                    .read<RegisterScreenCubit>()
                    .registerButtonTrigerred(),
                child: const Text('SIGN UP'),
              );
      },
    );
  }
}
