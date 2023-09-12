import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freefish/common/global_loader/global_loader.dart';
import 'package:freefish/common/widgets/app_messages.dart';
import 'package:freefish/pages/sign_up/provider/register_state.dart';

class SignUpController {
  SignUpController();

  void handleSignUp(WidgetRef ref, RegisterState state) {
    inspect(state);

    ref.read(appLoaderProvider.notifier).showLoader();

    toastInfo(msg: "Sign up success");

    if (state.password != state.rePassword) {
      return;
    }

    Future.delayed(const Duration(seconds: 3), () {
      ref.read(appLoaderProvider.notifier).hideLoader();
    });
  }
}
