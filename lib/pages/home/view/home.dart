import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/widgets/search_widgets.dart';
import 'package:freefish/pages/home/controller/home_controller.dart';
import 'package:freefish/pages/home/view/widgets/home_widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;

  @override
  void didChangeDependencies() {
    _controller =
        PageController(initialPage: ref.watch(homeBannerDotsProvider));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // appBar: homeAppBar(),
      body: RefreshIndicator(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HelloText(),
                const UserName(),
                VxBox().height(20.h).make(),
                searchBar(ref: ref),
                VxBox().height(20.h).make(),
                SliderBanner(controller: _controller, ref: ref),
                VxBox().height(20.h).make(),
                const HomeSectionHeader(),
                VxBox().height(10.h).make(),
                HomePopularGrid(ref: ref),
              ],
            ),
          ),
        ),
        onRefresh: () {
          return ref
              .refresh(homePopularProductsProvider.notifier)
              .fetchPopularProducts();
        },
      ),
    );
  }
}
