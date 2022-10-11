import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_deals/auth/logic/auth_provider.dart';
import 'package:small_deals/shared/screens/homepage.dart';
import 'package:small_deals/shared/utils/alert.dart';
import 'package:small_deals/shared/utils/app_colors.dart';
import 'package:small_deals/shared/utils/validators.dart';
import 'package:small_deals/shared/widgets/app_button.dart';
import 'package:small_deals/shared/widgets/app_input.dart';

class ResgisterPage extends StatefulWidget {
  const ResgisterPage({super.key});

  @override
  State<ResgisterPage> createState() => _ResgisterPageState();
}

class _ResgisterPageState extends State<ResgisterPage> {
  var _formKey = GlobalKey<FormState>();
  bool visibily = true;

  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    AuthProvider authProvider = context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: screenHeight * .06,
              ),
              SizedBox(
                height: screenHeight * .05,
              ),
              AppInput(
                controller: _nameController,
                label: "Name",
                hintText: "Enter your name",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return Validators.required("Email", value);
                },
              ),
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
                      loading: context.watch<AuthProvider>().isLoading,
                      loadingColor: AppColors.primaryGrayText,
                      text: const Text(
                        "Create Account",
                        style: TextStyle(
                          color: AppColors.primaryGrayText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            await authProvider.register(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );

                            if (mounted) {
                              showSuccessMessage("Success login", context);
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                                (route) => false,
                              );
                            }
                          } on FirebaseAuthException catch (e) {
                            print(e);
                            showErrorMessage(e.code, context);
                          } on FirebaseException catch (e) {
                            print(e);
                            showErrorMessage(e.code, context);
                          } catch (e) {
                            print(e);
                            showErrorMessage("Error login", context);
                          } finally {
                            authProvider.setIsLoading(false);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
