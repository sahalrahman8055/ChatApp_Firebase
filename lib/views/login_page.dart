import 'package:chatapp_firebase/components/my_button.dart';
import 'package:chatapp_firebase/components/my_textfield.dart';
import 'package:chatapp_firebase/constant/size.dart';
import 'package:chatapp_firebase/services/auth/auth_services.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    // get auth services
    final authServices = AuthServices();
    // try Login
    try {
      await authServices.signInWithEmailPassword(
          _emailController.text, _passwordController.text);
    }

    // catch any errors

    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_outlined,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            kHeight50,
            Text("Welcome back, you've been missed!"),
            kHeight25,
            MyTextField(
              hintText: "Type somthing..",
              obscureText: false,
              controller: _emailController,
            ),
            kHeight10,
            MyTextField(
              hintText: "Password..",
              obscureText: true,
              controller: _passwordController,
            ),
            kHeight25,
            MyButton(
              text: "Login",
              onTap: () => login(context),
            ),
            kHeight25,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
