import 'package:flutter/material.dart';
import 'package:freefish/common/routes/app_routes_names.dart';
import 'package:freefish/common/utils/app_constants.dart';
import 'package:freefish/common/widgets/app_shadow.dart';
import 'package:freefish/common/widgets/text_widgets.dart';
import 'package:freefish/global.dart';
import 'package:velocity_x/velocity_x.dart';

class AppOnboardingPage extends StatelessWidget {
  final PageController pageController;
  final String imagePath;
  final String title;
  final String description;
  final int index;
  final BuildContext context;

  const AppOnboardingPage({
    super.key,
    required this.pageController,
    required this.context,
    this.imagePath = "assets/images/reading.png",
    this.title = "COMPX576",
    this.description = "A demo app for paper COMPX576 of University of Waikato",
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagePath),
        VxBox(
            child: text24Normal(
          text: title,
          color: Theme.of(context).colorScheme.primary,
        )).margin(Vx.mV12).make(),
        VxBox(
          child: text16Normal(
            text: description,
            color: Theme.of(context).colorScheme.primary,
          ),
        ).margin(Vx.mV12).padding(Vx.mH32).make(),
        _nextButton(index, pageController, context),
      ],
    );
  }
}

// Widget appOnboardingPage(
//   PageController pageController, {
//   String imagePath = "assets/images/reading.png",
//   String title = "First See Learning",
//   String description = "Forget about of paper all knowledge in one learning",
//   int index = 0,
//   required BuildContext context,
// }) {
//   return Column(
//     children: [
//       Image.asset(imagePath),
//       VxBox(child: text24Normal(text: title)).margin(Vx.mV12).make(),
//       VxBox(
//         child: text16Normal(
//           text: description,
//         ),
//       ).margin(Vx.mV12).padding(Vx.mH32).make(),
//       _nextButton(index, pageController, context),
//     ],
//   );
// }

Widget _nextButton(
    int index, PageController pageController, BuildContext context) {
  String btnText = "NEXT";
  if (index == 3) btnText = "GET STARTED";
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      } else if (index == 3) {
        Global.storageService
            .setBool(AppConstants.storageDeviceOpenedKey, true);
        Navigator.pushNamed(context, AppRoutesNames.login);
      }
    },
    child: Container(
      height: 50,
      width: 325,
      decoration: appBoxShadow(),
      margin: const EdgeInsets.symmetric(vertical: 64),
      child: text16Normal(text: btnText, color: Colors.white).centered(),
    ),
  );
}
