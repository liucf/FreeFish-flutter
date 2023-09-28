import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freefish/common/widgets/app_textfields.dart';
import 'package:freefish/common/widgets/button_widgets.dart';
import 'package:freefish/common/widgets/text_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/pages/sign_in/controller/login_controller.dart';
import 'package:freefish/pages/sign_in/provider/login_notifier.dart';
import 'package:freefish/pages/sign_in/provider/login_state.dart';
import 'package:velocity_x/velocity_x.dart';

Widget thirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(left: 80.w, right: 80.w, top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _socialLoginButton("assets/icons/google.png"),
        _socialLoginButton("assets/icons/apple.png"),
        _socialLoginButton("assets/icons/facebook.png"),
      ],
    ),
  );
}

Widget _socialLoginButton(String imagePath) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 40.h,
      width: 40.w,
      child: Image.asset(imagePath),
    ),
  );
}

Widget loginInputField(BuildContext context, LoginController controller,
    WidgetRef ref, LoginState loginState) {
  final loginState2 = ref.watch(loginNotifierProvider);

  return Container(
    padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appTextField(
          "Email",
          iconPath: "assets/icons/user.png",
          hint: "Enter your email address",
          func: (value) {
            ref.read(loginNotifierProvider.notifier).onEmailChange(value);
            inspect(loginState2);
          },
        ),
        appTextField(
          "Password",
          iconPath: "assets/icons/lock.png",
          hint: "Enter your password",
          obscureText: true,
          func: (value) {
            ref.read(loginNotifierProvider.notifier).onPasswordChange(value);
          },
        ),
        forgetPassword(),
        VxBox().height(100.h).make(),
        _loginButton(controller, loginState),
        VxBox().height(20.h).make(),
        _signUpButton(context),
      ],
    ),
  );
}

Widget _signUpButton(BuildContext context) {
  return appButton(
      text: "Register",
      inversePrimary: true,
      onPressed: () {
        Navigator.pushNamed(context, "signUp");
      });
}

Widget _loginButton(LoginController controller, LoginState loginState) {
  return appButton(
      text: "Login",
      onPressed: () {
        // controller.handleLogin();
      });
}

Widget forgetPassword() {
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        textUnderline(text: "Forget Password?",),
      ],
    ),
  );
}
