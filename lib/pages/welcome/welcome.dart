import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freefish/common/utils/app_image_res.dart';
import 'package:freefish/pages/welcome/notifier/welcome_notifier.dart';
import 'package:freefish/pages/welcome/widgets.dart';

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dotIndex = ref.watch(indexDotProvider);

    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
          margin: const EdgeInsets.only(top: 30),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  ref.read(indexDotProvider.notifier).changeIndex(value);
                },
                children: [
                  AppOnboardingPage(
                      pageController: _pageController,
                      imagePath: AppImageRes.reading,
                      index: 1,
                      context: context),
                  AppOnboardingPage(
                      pageController: _pageController,
                      imagePath: AppImageRes.man,
                      title: "FreeFish",
                      description:
                          "FreeFish is a second-hand trading platform like TradeMe",
                      index: 2,
                      context: context),
                  AppOnboardingPage(
                      pageController: _pageController,
                      imagePath: AppImageRes.boy,
                      title: "Free Easy Quick",
                      description:
                          "Users can list things to sell or browser to buy",
                      index: 3,
                      context: context),
                ],
              ),
              Positioned(
                bottom: 50,
                child: DotsIndicator(
                    position: dotIndex,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                      activeColor: Colors.deepPurple,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
