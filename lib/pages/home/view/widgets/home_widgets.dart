import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/utils/app_colors.dart';
import 'package:freefish/common/utils/app_image_res.dart';
import 'package:freefish/common/widgets/product_item.dart';
import 'package:freefish/common/widgets/text_widgets.dart';
import 'package:freefish/global.dart';
import 'package:freefish/pages/home/controller/home_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return text24Normal(
      text: "Hello, ",
      color: AppColors.primaryThreeElementText,
      fontWeight: FontWeight.bold,
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return text24Normal(
      // text: "Michael",
      text: Global.storageService.getUserName(),
      fontWeight: FontWeight.bold,
    );
  }
}

class SliderBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;
  const SliderBanner({super.key, required this.controller, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 375.w,
          height: 160.h,
          child: PageView(
            controller: controller,
            onPageChanged: (value) {
              ref.read(homeBannerDotsProvider.notifier).changeIndex(value);
            },
            children: [
              _bannerItem(),
              _bannerItem(imagePath: AppImageRes.banner2),
              _bannerItem(imagePath: AppImageRes.banner3),
            ],
          ),
        ),
        DotsIndicator(
          position: ref.watch(homeBannerDotsProvider),
          dotsCount: 3,
          decorator: DotsDecorator(
            activeColor: Colors.deepPurple,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _bannerItem({String imagePath = AppImageRes.banner1}) {
  return Container(
    width: 345.w,
    height: 160.h,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.fill,
      ),
    ),
  );
}

AppBar homeAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu),
          // GestureDetector(
          //   child: Container(
          //     width: 30.w,
          //     height: 30.h,
          //     margin: EdgeInsets.only(left: 10.w),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20.w),
          //       image: const DecorationImage(
          //         image: AssetImage(AppImageRes.user),
          //         fit: BoxFit.fitHeight,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    ),
  );
}

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        text16Normal(
            text: "Popular",
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText),
        GestureDetector(
          onTap: () {},
          child: "See all"
              .text
              .size(10.sp)
              .color(AppColors.primaryThreeElementText)
              .make(),
        ),
      ],
    );
  }
}

class HomePopularGrid extends StatelessWidget {
  final WidgetRef ref;
  const HomePopularGrid({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final popluarProductState = ref.watch(homePopularProductsProvider);
    return popluarProductState.when(
      data: (data) => GridView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(
            product: data[index],
          );
        },
      ),
      error: ((error, stackTrace) => const Center(
            child: Text("Error loading data"),
          )),
      loading: (() => const Center(child: CircularProgressIndicator())),
    );
  }
}
