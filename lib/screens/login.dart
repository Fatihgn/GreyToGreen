import 'package:flutter/material.dart';
import 'package:grey_to_green/custom_widgets/textfields/custom_textfield.dart';
import 'package:grey_to_green/screens/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  bool passwordVisible = false;
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
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
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Column(
                  children: <Widget>[
                    CustomTextFormField(
                      prefixicon: const Icon(Icons.mail_outline_outlined),
                      hintText: 'Email: ',
                      textController: emailcontroller,
                    ),
                    CustomTextFormField(
                      prefixicon: const Icon(Icons.lock),
                      hintText: 'Password: ',
                      textController: passcontroller,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
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
                    const SizedBox(height: 10),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 200),
                        foregroundColor: Colors.black,
                      ),
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                          image: AssetImage('assets/images/googleicon.png'),
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
                      child: const Text('Don’t have an account? Sign up'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
