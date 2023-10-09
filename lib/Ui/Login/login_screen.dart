import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Shared_Components/color.dart';
import 'package:todo_app/Ui/Register/register.dart';
import 'package:todo_app/Ui/dialog_utils.dart';

import '../Register/customTextField.dart';
import '../Register/validator_utils.dart';

class LoginScreen extends StatefulWidget {
  static const String routName = "loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Login",
          style: theme.bodyMedium!.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              controller: emailController,
              hint: "Email",
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "Please entre your email address";
                }
                if (!ValidatorUtils.isValidEmail(text)) {
                  return "Please entre a valid email";
                }
              },
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: passwordController,
              hint: "password",
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "Please enter your password";
                }
                if (text.length < 6) {
                  return "Password should at least 6 chars";
                }
              },
              keyboardType: TextInputType.text,
              isPassword: true,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                LoginScreen();
                // Navigator.pushReplacementNamed(context, HomePage.routName);
              },
              child: Text(
                "Login",
                style: theme.bodyMedium!.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, RegisterScreen.routName);
              },
              child: Text(
                "Don't have account",
                style: theme.bodyMedium!.copyWith(
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FirebaseAuth authServices = FirebaseAuth.instance;

  void LoginScreen() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    DialogUtils.showLoadingDialog(context, "Loading...");
    try {
      final result = await authServices.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context, "Successful Login");
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideDialog(context);
      String errorMessage = "Wrong Email Or Password";
      DialogUtils.showMessage(context, errorMessage, postActionName: "ok");
    } catch (e) {
      DialogUtils.hideDialog(context);
      String errorMessage = "Something Wrong";
      DialogUtils.showMessage(context, errorMessage,
          postActionName: "cancel", nagActionName: "Try Again", negAction: () {
        LoginScreen();
      });
      print(e);
    }
  }
}
