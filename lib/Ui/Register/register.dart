import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Shared_Components/color.dart';
import 'package:todo_app/Ui/Login/login_screen.dart';
import 'package:todo_app/Ui/Register/customTextField.dart';
import 'package:todo_app/Ui/Register/validator_utils.dart';
import 'package:todo_app/Ui/dialog_utils.dart';

class RegisterScreen extends StatefulWidget {
  static const String routName = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var re_passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, LoginScreen.routName);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Create New Account",
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
              controller: nameController,
              hint: "Full Name",
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "Please entre full Name";
                }
              },
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
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
              height: 20,
            ),
            CustomTextFormField(
              controller: re_passwordController,
              hint: "re_Password",
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "Please enter your password";
                }
                if (passwordController.text != text) {
                  return "Password dose't match";
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
                register();
                // Navigator.pushReplacementNamed(context, HomePage.routName);
              },
              child: Text(
                "Register",
                style: theme.bodyMedium!.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, LoginScreen.routName);
              },
              child: Text(
                "Already have account",
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

  void register() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    DialogUtils.showLoadingDialog(context, "Loading...");
    try {
      final result = await authServices.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context, "Successful Register");
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Something Wrong";
      DialogUtils.hideDialog(context);

      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email';
      }
      DialogUtils.showMessage(context, errorMessage, postActionName: "ok");
    } catch (e) {
      DialogUtils.hideDialog(context);
      String errorMessage = "Something Wrong";
      DialogUtils.showMessage(context, errorMessage,
          postActionName: "cancel", nagActionName: "Try Again", negAction: () {
        register();
      });
      print(e);
    }
  }
}
