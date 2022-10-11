import 'package:flutter/material.dart';
import 'package:small_deals/auth/presentation/register_page.dart';
import 'package:small_deals/shared/utils/app_colors.dart';
import 'package:small_deals/shared/utils/validators.dart';
import 'package:small_deals/shared/widgets/app_button.dart';
import 'package:small_deals/shared/widgets/app_input.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();
  bool visibily = true;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppInput(
                        controller: _emailController,
                        label: "Email",
                        hintText: "Enter email address",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          return Validators.required("Email", value);
                        },
                      ),
                      AppInput(
                        controller: _passwordController,
                        label: "Password",
                        hintText: "Choose a password",
                        maxLine: 1,
                        minLine: 1,
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              visibily = !visibily;
                            });
                          },
                          child: Icon(
                            visibily ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                        obscureText: visibily,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          return Validators.required("password", value);
                        },
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppButton(
                              loadingColor: AppColors.primaryGrayText,
                              text: const Text(
                                "Login",
                                style: TextStyle(
                                  color: AppColors.primaryGrayText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () async {},
                            ),
                            AppButton(
                              loadingColor: AppColors.primary,
                              text: const Text(
                                "Create Account",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: AppColors.black,
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ResgisterPage(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
