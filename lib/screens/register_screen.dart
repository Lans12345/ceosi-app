import 'package:ceosi_app/constants/images.dart';
import 'package:ceosi_app/widgets/button_widget.dart';
import 'package:ceosi_app/widgets/text_widget.dart';
import 'package:ceosi_app/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:ceosi_app/constants/images.dart';

class RegisterScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              Images.coesiLogoCompleteAndMaroonBlueText,
              width: 350,
            ),
            const SizedBox(
              height: 10,
            ),
            TextformfieldWidget(
              textFieldController: _nameController,
              label: 'Name',
            ),
            const SizedBox(
              height: 10,
            ),
            TextformfieldWidget(
              textFieldController: _emailController,
              label: 'Email',
            ),
            const SizedBox(
              height: 10,
            ),
            TextformfieldWidget(
              isObscure: true,
              textFieldController: _passwordController,
              label: 'Password',
            ),
            const SizedBox(
              height: 10,
            ),
            TextformfieldWidget(
              isObscure: true,
              textFieldController: _confirmPasswordController,
              label: 'Confirm Password',
            ),
            const SizedBox(
              height: 50,
            ),
            ButtonWidget(
                borderRadius: 100,
                onPressed: () {},
                buttonHeight: 50,
                buttonWidth: 300,
                textWidget: const NormalTextWidget(
                    color: Colors.white, fontSize: 18, text: 'Register')),
            const Expanded(
              child: SizedBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const NormalTextWidget(
                    color: Colors.black,
                    fontSize: 14,
                    text: 'Already have an account?'),
                TextButton(
                  onPressed: () {},
                  child: const BoldTextWidget(
                      color: Colors.black, fontSize: 18, text: 'Login'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
