import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/models/product_model.dart';
import 'package:freefish/common/utils/app_colors.dart';
import 'package:freefish/common/utils/app_constants.dart';
import 'package:freefish/common/widgets/app_bar.dart';
import 'package:freefish/common/widgets/app_textfields.dart';
import 'package:freefish/common/widgets/button_widgets.dart';
import 'package:freefish/pages/product_detail/controller/product_detail_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class Checkout extends ConsumerStatefulWidget {
  const Checkout({super.key});

  @override
  ConsumerState<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends ConsumerState<Checkout> {
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
      appBar: buildAppbar(title: "Checkout"),
      body: productDetail.when(
          data: (data) => _buildProductDetail(data),
          error: (error, traceStack) => const Text("Error loading the data"),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}

Widget _buildProductDetail(ProductModel product) {
  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      product.thumbs.isNotEmpty
                          ? '${AppConstants.serverAssetUrl}product/${product.thumbs.first.name}'
                          : "${AppConstants.serverAssetUrl}default/computer.jpeg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              VxBox().width(10.w).make(),
              Flexible(
                child: Text(
                  product.name,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "\$${product.price}",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.primarySecondaryElementText),
              ),
            ],
          ),
          VxBox().height(20.h).make(),
          const Divider(),
          VxBox().height(20.h).make(),

          // Shipping Address
          "Shipping Address"
              .text
              .size(18)
              .bold
              .align(TextAlign.left)
              .color(AppColors.primarySecondaryElementText)
              .make(),
          VxBox().height(10.h).make(),

          appTextFieldOnly(
            // controller: _controller.emailController,
            hint: "Email address",
            func: (value) {
              // ref
              //     .read(loginNotifierProvider.notifier)
              //     .onEmailChange(value);
            },
            validateFunc: (value) {
              if (value.isEmpty) {
                return 'Please enter email address';
              }
              if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
                return "Please enter valid email address";
              }
              return null;
            },
          ),
          VxBox().height(15.h).make(),

          appTextFieldOnly(
            // controller: _controller.emailController,

            hint: "Mobile number",
            func: (value) {
              // ref
              //     .read(loginNotifierProvider.notifier)
              //     .onEmailChange(value);
            },
            validateFunc: (value) {
              if (value.isEmpty) {
                return 'Please enter mobile ';
              }
              return null;
            },
          ),

          VxBox().height(15.h).make(),

          appTextFieldOnly(
            // controller: _controller.emailController,
            linenumber: 3,
            height: 100,
            hint: "Address",
            func: (value) {
              // ref
              //     .read(loginNotifierProvider.notifier)
              //     .onEmailChange(value);
            },
            validateFunc: (value) {
              if (value.isEmpty) {
                return 'Please enter mobile ';
              }
              return null;
            },
          ),

          VxBox().height(50.h).make(),
          Center(
            child: appButton(
                text: "Checkout ",
                onPressed: () {
                  // print("Checkout");
                  // if ((_controller.formKey.currentState! as FormState)
                  //     .validate()) {
                  //   _controller.handleLogin(ref, loginState);
                  // }
                }),
          ),
        ],
      ),
    ),
  );
}
