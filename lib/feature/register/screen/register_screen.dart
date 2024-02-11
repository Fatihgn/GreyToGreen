import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grey_to_green/feature/login/widgets/login_register_textfield.dart';

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
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final gendercontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final conpasswordcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    namecontroller.dispose();
    usernamecontroller.dispose();
    gendercontroller.dispose();
    agecontroller.dispose();
    passwordcontroller.dispose();
    conpasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
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
                            icon: const Icon(Icons.arrow_drop_down_outlined),
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
                CustomTextFormField(
                  prefixicon: const Icon(Icons.mail_outline_outlined),
                  hintText: 'Emails: ',
                  textController: emailcontroller,
                ),
                CustomTextFormField(
                  prefixicon: const Icon(Icons.lock),
                  hintText: 'Password: ',
                  textController: passwordcontroller,
                ),
                CustomTextFormField(
                  prefixicon: const Icon(Icons.lock),
                  hintText: 'Confirm Password:  ',
                  textController: conpasswordcontroller,
                ),
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
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
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
    );
  }
}
