import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/utils/app_colors.dart';
import 'package:freefish/common/widgets/app_shadow.dart';
import 'package:freefish/pages/application/provider/home_nav_notifier.dart';
import 'package:freefish/pages/application/view/widgets/widgets.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavIndexProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: appScreens(index),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: appBoxShadowWithRadius(),
            child: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                ref
                    .read(applicationNavIndexProvider.notifier)
                    .changeIndex(value);
              },
              elevation: 0,
              items: bottomItems,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourElementText,
            ),
          ),
        ),
      ),
    );
  }
}
