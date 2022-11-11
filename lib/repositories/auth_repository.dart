import 'package:ceosi_app/repositories/auth_repository_interface.dart';
import 'package:ceosi_app/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../screens/ceosi_rewards/widgets/dialogs/error_dialog_widget.dart';

class AuthRepository implements AuthRepositoryInterface {
  @override
  userSignUp(String name, email, password, confirmPassword, role,
      BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = FirebaseAuth.instance.currentUser!;

      UserRepository().addUser(
        name,
        email,
        password,
        confirmPassword,
        role,
        user.uid,
        'https://cdn-icons-png.flaticon.com/512/1177/1177568.png',
      );
    } catch (e) {
      ErrorDialog(
          caption: e.toString(),
          onPressed: () {
            Navigator.of(context).pop();
          });
    }
  }
}