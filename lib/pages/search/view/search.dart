import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/models/product_model.dart';
import 'package:freefish/common/widgets/app_bar.dart';
import 'package:freefish/common/widgets/product_item.dart';
import 'package:freefish/pages/search/controller/search_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class Search extends ConsumerStatefulWidget {
  const Search({super.key});

  @override
  ConsumerState<Search> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Search> {
  late String query;

  @override
  void didChangeDependencies() {
    query = ModalRoute.of(context)!.settings.arguments as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var searchResults = ref.watch(searchControllerProvider(query: query));
    return Scaffold(
      appBar: buildAppbar(title: 'Search result'),
      body: searchResults.when(
          data: (data) => _buildSerchResult(data),
          error: (error, traceStack) => const Text("Error loading the data"),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }

  _buildSerchResult(List<ProductModel> data) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxBox().height(20.h).make(),
            "Search result for '$query'".text.bold.xl2.make(),
            const SizedBox(height: 20),
            GridView.builder(
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
          ],
        ),
      ),
    );
  }
}
