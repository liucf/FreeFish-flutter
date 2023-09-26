import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/widgets/app_bar.dart';
import 'package:freefish/common/widgets/product_item.dart';
import 'package:freefish/common/widgets/text_widgets.dart';
import 'package:freefish/pages/category_detail/controller/category_detail_controller.dart';

class CategoryDetail extends ConsumerStatefulWidget {
  const CategoryDetail({super.key});

  @override
  ConsumerState<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends ConsumerState<CategoryDetail> {
  late String subCategoryName;

  @override
  void didChangeDependencies() {
    subCategoryName = ModalRoute.of(context)!.settings.arguments as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var categoryDetail =
        ref.watch(categoryDetailControllerProvider(subname: subCategoryName));
    return Scaffold(
      appBar: buildAppbar(title: "Category Detail"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: text24Normal(text: subCategoryName),
              ),
              categoryDetail.when(
                  data: (data) => _buildCategoryDetail(data),
                  error: (error, traceStack) =>
                      const Text("Error loading the data"),
                  loading: () =>
                      const Center(child: CircularProgressIndicator())),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCategoryDetail(data) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
    ),
    shrinkWrap: true,
    physics: const ScrollPhysics(),
    itemCount: data.length,
    itemBuilder: (context, index) {
      return ProductItem(
        product: data[index],
      );
    },
  );
}
