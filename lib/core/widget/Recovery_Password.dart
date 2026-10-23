
import 'package:ecommerce_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../theme/app_color.dart';
import '../services/auth_service.dart';

class RecoveryPassword extends StatefulWidget {
  static const String routeName = "RecoveryPassword";

  const RecoveryPassword({super.key});

  @override
  State<RecoveryPassword> createState() => _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword> {
  final emailController = TextEditingController();
  final authService = AuthService();

  bool isLoading = false;
  String? errorMessage;
  String? successMessage;

  Future<void> sendResetEmail() async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      setState(() {
        errorMessage = 'Please enter your email address.';
        successMessage = null;
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
      successMessage = null;
    });

    try {
      await authService.sendPasswordResetEmail(email: email);

      if (!mounted) return;

      setState(() {
        successMessage =
        'If the account is eligible, a password reset email will be sent.';
      });
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      setState(() {
        if (e.code == 'invalid-email') {
          errorMessage = 'Please enter a valid email address.';
        } else if (e.code == 'network-request-failed') {
          errorMessage = 'Check your internet connection.';
        } else {
          errorMessage = 'Unable to send the reset email. Please try again.';
        }
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        errorMessage = 'Something went wrong. Please try again.';
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final textColor =
    isDark ? appColor.textdark : appColor.textlight;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDark
            ? appColor.background_dark
            : appColor.background_light,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.1),

              Center(
                child: Column(
                  children: [
                    Text(
                      "Recovery Password",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: height * 0.02),

                    Text(
                      "Please Enter Your Email Address To",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: textColor,
                      ),
                    ),
                    Text(
                      "Receive a Password Reset Link",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.03),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text("Email Address"),
              ),

              SizedBox(height: height * 0.01),

              CustomTextField(
                hintText: "AlissonBecker@gmail.com",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

              if (successMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: Text(
                    successMessage!,
                    style: const TextStyle(color: Colors.green),
                  ),
                ),

              SizedBox(height: height * 0.03),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: InkWell(
                  onTap: isLoading ? null : sendResetEmail,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: width * 0.95,
                    height: height * 0.070,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: appColor.colorscandery,
                    ),
                    child: Center(
                      child: isLoading
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : const Text(
                        "Continue",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
