import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freefish/common/global_loader/global_loader.dart';
import 'package:freefish/common/utils/app_constants.dart';
import 'package:freefish/common/widgets/app_messages.dart';
import 'package:freefish/global.dart';
import 'package:freefish/pages/sign_in/provider/login_state.dart';
import 'package:freefish/pages/sign_in/repo/sign_in_repo.dart';

class LoginController {
  LoginController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey formKey = GlobalKey<FormState>();

  Future<void> handleLogin(WidgetRef ref, LoginState state) async {
    emailController.text = state.email;
    passwordController.text = state.password;
    var context = ref.context;
    // talk to server
    try {
      ref.read(appLoaderProvider.notifier).showLoader();
      var userToken = await SignInRepo.getToken(state.email, state.password);
      await Global.storageService
          .setString(AppConstants.storageUserTokenKey, userToken.token);
      var userProfile = await SignInRepo.getUserProfile();
      await Global.storageService.setString(
          AppConstants.storageUserProfileKey, jsonEncode(userProfile));
      // redirect to new page

      if (context.mounted) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil("application", (route) => false);
      }
    } on DioException catch (e) {
      toastInfo(msg: "${e.error}", backgroundColor: Colors.red);
    } catch (e) {
      toastInfo(msg: e.toString(), backgroundColor: Colors.red);
    } finally {
      ref.read(appLoaderProvider.notifier).hideLoader();
    }
  }
}
