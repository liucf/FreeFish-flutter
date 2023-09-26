import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/models/product_model.dart';
import 'package:freefish/common/utils/app_colors.dart';
import 'package:freefish/common/utils/app_constants.dart';
import 'package:freefish/common/widgets/app_bar.dart';
import 'package:freefish/common/widgets/button_widgets.dart';
import 'package:freefish/common/widgets/image_widgets.dart';
import 'package:freefish/pages/product_detail/controller/product_detail_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetail extends ConsumerStatefulWidget {
  const ProductDetail({super.key});

  @override
  ConsumerState<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {
  late int id;

  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as int;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var productDetail = ref.watch(productDetailControllerProvider(id: id));
    return Scaffold(
      appBar: buildAppbar(title: "Product Detail"),
      body: productDetail.when(
          data: (data) => _buildProductDetail(data),
          error: (error, traceStack) => const Text("Error loading the data"),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }

  Widget _buildProductDetail(ProductModel product) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ImageWidget.url(
              product.thumbs.isNotEmpty
                  ? '${AppConstants.serverAssetUrl}product/${product.thumbs.first.name}'
                  : "${AppConstants.serverAssetUrl}default/computer.jpeg",
              width: 525.w,
              height: 200.h,
              fit: BoxFit.fitWidth,
            ),
            VxBox().height(20.h).make(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    product.name,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "\$${product.price}",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: AppColors.primarySecondaryElementText),
                ),
              ],
            ),
            VxBox().height(10.h).make(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.user!.name,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    Text(DateTime.parse(product.created_at.toString())
                        .toLocal()
                        .toString()
                        .split(' ')[0]),
                  ],
                ),
                VxBox().height(20.h).make(),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 14),
                ),
                VxBox().height(20.h).make(),
                appButton(
                    text: "Buy Now",
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed("checkout", arguments: product.id);
                    }),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
