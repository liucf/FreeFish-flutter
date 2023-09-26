import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/global_loader/global_loader.dart';
import 'package:freefish/common/utils/app_image_res.dart';
import 'package:freefish/common/widgets/app_bar.dart';
import 'package:freefish/common/widgets/app_textfields.dart';
import 'package:freefish/common/widgets/button_widgets.dart';
import 'package:freefish/common/widgets/text_widgets.dart';
import 'package:freefish/pages/sign_in/controller/login_controller.dart';
import 'package:freefish/pages/sign_in/provider/login_notifier.dart';
import 'package:freefish/pages/sign_in/view/widgets/sign_in_widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late LoginController _controller;

  @override
  void didChangeDependencies() {
    _controller = LoginController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final appLoader = ref.watch(appLoaderProvider);
    final loginState = ref.watch(loginNotifierProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppbar(),
          body: !appLoader
              ? SingleChildScrollView(
                  child: Form(
                    key: _controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        thirdPartyLogin(),
                        Center(
                            child: text14Normal(
                                text: "Or use your email account to login")),
                        Container(
                          padding: EdgeInsets.only(
                              left: 25.w, right: 25.w, top: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appTextField(
                                "Email",
                                controller: _controller.emailController,
                                iconPath: AppImageRes.user,
                                hint: "Enter your email address",
                                func: (value) {
                                  ref
                                      .read(loginNotifierProvider.notifier)
                                      .onEmailChange(value);
                                },
                                validateFunc: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter email address';
                                  }
                                  if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                    return "Please enter valid email address";
                                  }
                                  return null;
                                },
                              ),
                              appTextField(
                                "Password",
                                controller: _controller.passwordController,
                                iconPath: AppImageRes.lock,
                                hint: "Enter your password",
                                obscureText: true,
                                func: (value) {
                                  ref
                                      .read(loginNotifierProvider.notifier)
                                      .onPasswordChange(value);
                                },
                                validateFunc: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              forgetPassword(),
                              VxBox().height(100.h).make(),
                              appButton(
                                  text: "Login",
                                  onPressed: () {
                                    if ((_controller.formKey.currentState!
                                            as FormState)
                                        .validate()) {
                                      _controller.handleLogin(ref, loginState);
                                    }
                                  }),
                              VxBox().height(20.h).make(),
                              appButton(
                                  text: "Register",
                                  inversePrimary: true,
                                  onPressed: () {
                                    Navigator.pushNamed(context, "signUp");
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
