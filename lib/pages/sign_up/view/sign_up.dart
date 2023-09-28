import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/global_loader/global_loader.dart';
import 'package:freefish/common/utils/app_image_res.dart';
import 'package:freefish/common/widgets/app_bar.dart';
import 'package:freefish/common/widgets/app_textfields.dart';
import 'package:freefish/common/widgets/button_widgets.dart';
import 'package:freefish/common/widgets/text_widgets.dart';
import 'package:freefish/pages/sign_up/controller/sign_up_controller.dart';
import 'package:freefish/pages/sign_up/provider/register_notifier.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = SignUpController();
    final registerState = ref.watch(registerNotiferProvider);
    final appLoader = ref.watch(appLoaderProvider);

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: buildAppbar(title: "Sign Up", context: context),
        body: !appLoader
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxBox().height(30.h).make(),
                    Center(
                        child: text14Normal(
                            text: "Enter your details below & free sign up")),
                    Container(
                      padding:
                          EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appTextField("User name",
                              iconPath: AppImageRes.user,
                              hint: "Enter your email address",
                              func: (value) => ref
                                  .read(registerNotiferProvider.notifier)
                                  .onNameChange(value)),
                          appTextField(
                            "Email",
                            iconPath: AppImageRes.user,
                            hint: "Enter your email address",
                            func: (value) => ref
                                .read(registerNotiferProvider.notifier)
                                .onEmailChange(value),
                          ),
                          appTextField(
                            "Password",
                            iconPath: AppImageRes.lock,
                            hint: "Enter your password",
                            obscureText: true,
                            func: (value) => ref
                                .read(registerNotiferProvider.notifier)
                                .setPassword(value),
                          ),
                          appTextField(
                            "Confirm your password",
                            iconPath: AppImageRes.lock,
                            hint: "Enter your password",
                            obscureText: true,
                            func: (value) => ref
                                .read(registerNotiferProvider.notifier)
                                .setRePassword(value),
                          ),
                          VxBox().height(20.h).make(),
                          "By creating an account you are agreeing with our terms and conditions"
                              .text
                              .size(12)
                              .color(Colors.grey)
                              .make(),
                          VxBox().height(50.h).make(),
                          appButton(
                            text: "Sign Up",
                            onPressed: () =>
                                _controller.handleSignUp(ref, registerState),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
