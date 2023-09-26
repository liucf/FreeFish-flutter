import 'package:flutter/material.dart';
import 'package:freefish/pages/my/repo/my_repo.dart';

class MyController {
  Future<void> logout(context) async {
    await MyRepo.logout();
    Navigator.of(context).pushNamedAndRemoveUntil("signIn", (route) => false);
  }
}
