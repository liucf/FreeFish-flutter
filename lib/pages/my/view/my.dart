import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/widgets/app_bar.dart';
import 'package:freefish/common/widgets/button_widgets.dart';
import 'package:freefish/global.dart';
import 'package:freefish/pages/my/controller/my_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class My extends StatelessWidget {
  const My({super.key});
  MyController get controller => MyController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(title: "My account"),
          body: SizedBox(
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      VxBox().height(20.h).make(),
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage("assets/images/account_header.png"),
                      ),
                      VxBox().height(10.h).make(),
                      Global.storageService
                          .getUserProfile()
                          .name
                          .text
                          .size(20)
                          .bold
                          .make(),
                    ],
                  ),
                ),
                VxBox().height(20.h).make(),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(10.0),
                        children: [
                          ListTile(
                            leading: const Icon(Icons.person_2_outlined),
                            title: const Text("Profile"),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              Navigator.of(context).pushNamed("my_profile");
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.view_list_outlined),
                            title: const Text("Lists"),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              Navigator.of(context).pushNamed("profile");
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.attach_money),
                            title: const Text("Orders"),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              Navigator.of(context).pushNamed("profile");
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.receipt_long_rounded),
                            title: const Text("Solds"),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              Navigator.of(context).pushNamed("profile");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Center(
                  child: appButtonWithColor(
                    text: "Sign Out",
                    bgColor: Colors.red,
                    onPressed: () {
                      controller.logout(context);
                    },
                  ),
                ),
                VxBox().height(20.h).make(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
