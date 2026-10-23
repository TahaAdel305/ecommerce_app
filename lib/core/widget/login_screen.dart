import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/widget/signup_screen.dart';
import 'package:ecommerce_app/widget/custom_google.dart';
import 'package:ecommerce_app/widget/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main_screen.dart';
import '../services/auth_service.dart';
import 'Recovery_Password.dart';

class Login_Screen extends StatefulWidget {
  static const String routeName = "Login_Screen";

  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;

  final authService = AuthService();

  Future<void> handleSignIn() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      await authService.signIn(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (!mounted) return;

      Navigator.pushReplacementNamed(
        context,
        MainScreen.routeName,
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      setState(() {
        errorMessage = authService.getErrorMessage(e.code);
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        errorMessage = 'Something went wrong. Please try again';
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
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        backgroundColor: isDark
            ? appColor.background_dark
            : appColor.background_light,
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.128),
              Center(
                child: Text(
                  "Hello Again!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400,color: isDark
                    ? appColor.textdark
                    : appColor.textlight,),

                ),
              ),
              Center(
                child: Text(
                  "Welcome Back You’ve Been Missed!",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w200,color: isDark
                      ? appColor.textdark
                      : appColor.textlight),
                ),
              ),
              SizedBox(height: height * 0.040),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Text(
                  "Email Address",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300,color: isDark
                      ? appColor.textdark
                      : appColor.textlight),
                ),
              ),
              SizedBox(height: height * 0.020),
              CustomTextField(
                  hintText: "AlissonBecker@gmail.com",
                prefixIcon: Icons.email_outlined,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: height * 0.010),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Text(
                  "Password",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300,color: isDark
                      ? appColor.textdark
                      : appColor.textlight),
                ),
              ),
              SizedBox(height: height * 0.010),
              CustomTextField(
                hintText: "password",
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              controller: passwordController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: (){Navigator.push(context,
                            MaterialPageRoute(builder: (context) => RecoveryPassword(),));},
                        child: Text("Recovery Password",style: TextStyle(
                          fontSize: 15,fontWeight: FontWeight.w100,
                            color:  isDark
                                ? appColor.textdark
                                : appColor.textlight,
                          ),
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.030),
              SizedBox(
                width: width * 0.95,
                height: height * 0.070,
                child: ElevatedButton(
                  onPressed: isLoading ? null : handleSignIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColor.colorscandery,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 24,
                         color:  isDark
                        ? appColor.textdark
                        : appColor.textlight ),
                  ),
                ),

              ),
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              /*Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  width: width*0.95,
                  height: height*0.070,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: appColor.colorscandery
                  ),
                  child: Center(child: Text("Sign In",style: TextStyle(fontSize: 24),)),
                ),
              ),*/
              SizedBox(height: height * 0.040),
              custom_google(),
              SizedBox(height: height * 0.060),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Don’t have an account?"),
                //SizedBox(width: width*0.030,),
                TextButton(
                    onPressed: ()
                    {Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup_Screen())
                       );
                      },
                    child: Text("Sign Up for free")
                 )
                ],
              )





            ],
          ),],
        ),
      ),
    );
  }
}
