import 'package:chatapp_firebase/components/my_button.dart';
import 'package:chatapp_firebase/components/my_textfield.dart';
import 'package:chatapp_firebase/constant/size.dart';
import 'package:chatapp_firebase/services/auth/auth_services.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) {
    final _auth = AuthServices();

    // if the password match then create the user

    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }

      // if password does'nt match
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password don't match!"),
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
            const Text("Let's creat an account for you"),
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
            kHeight10,
            MyTextField(
              hintText: "Confirm Password..",
              obscureText: true,
              controller: _confirmPasswordController,
            ),
            kHeight25,
            MyButton(
              text: "Register",
              onTap: () => register(context),
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
                    "Login now",
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
