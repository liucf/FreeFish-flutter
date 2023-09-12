import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freefish/common/utils/app_constants.dart';
import 'package:freefish/common/widgets/app_messages.dart';
import 'package:freefish/global.dart';
import 'package:freefish/pages/sign_in/provider/login_state.dart';
import 'package:freefish/pages/sign_in/repo/sign_in_repo.dart';

class LoginController {
  LoginController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleLogin(WidgetRef ref, LoginState state) async {
    emailController.text = state.email;
    passwordController.text = state.password;

    // talk to server
    try {
      var token = await SignInRepo.getToken(state.email, state.password);
      await Global.storageService
          .setString(AppConstants.storageUserTokenKey, token.toString());

      var res = await SignInRepo.getUserProfile();
      var resData = res.data['data'];
      print(res.data);

      // local storage

      // Global.storageService
      //     .setString(AppConstants.storageUserProfileKey, "123");
    } catch (e) {
      toastInfo(msg: e.toString());
    }

    // redirect to new page
    // Navigator.of(ref.context)
    //     .pushNamedAndRemoveUntil("application", (route) => false);

    // Future.delayed(const Duration(microseconds: 500), () {
    // ref.read(appLoaderProvider.notifier).hideLoader();
    // });
  }
}
