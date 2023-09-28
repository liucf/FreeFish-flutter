import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:freefish/common/models/product_model.dart';
import 'package:freefish/common/services/http_util.dart';
import 'package:freefish/common/utils/app_colors.dart';
import 'package:freefish/common/utils/app_constants.dart';
import 'package:freefish/common/widgets/app_bar.dart';
import 'package:freefish/common/widgets/app_messages.dart';
import 'package:freefish/common/widgets/app_textfields.dart';
import 'package:freefish/common/widgets/button_widgets.dart';
import 'package:freefish/pages/checkout/controller/checkout_controller.dart';
import 'package:freefish/pages/checkout/controller/checkout_form.dart';
import 'package:freefish/pages/product_detail/controller/product_detail_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class Checkout extends ConsumerStatefulWidget {
  const Checkout({super.key});

  @override
  ConsumerState<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends ConsumerState<Checkout> {
  late int id;
  late CheckoutController checkoutController;

  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as int;
    checkoutController = CheckoutController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var productDetail = ref.watch(productDetailControllerProvider(id: id));
    var checkoutForm = ref.watch(checkoutFormProvider);

    return Scaffold(
      appBar: buildAppbar(title: "Checkout"),
      body: productDetail.when(
          data: (data) => _buildProductDetail(
              data, context, checkoutController, ref, id, checkoutForm),
          error: (error, traceStack) => const Text("Error loading the data"),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}

Widget _buildProductDetail(
    ProductModel product,
    BuildContext context,
    CheckoutController checkoutController,
    WidgetRef ref,
    int id,
    CheckoutState checkoutForm) {
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
          Form(
            key: checkoutController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appTextFieldOnly(
                  hint: "Email address",
                  func: (value) {
                    ref
                        .read(checkoutFormProvider.notifier)
                        .onEmailChange(value);
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
                  hint: "Mobile number",
                  func: (value) {
                    ref
                        .read(checkoutFormProvider.notifier)
                        .onMobileChange(value);
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
                  linenumber: 3,
                  height: 100,
                  hint: "Address",
                  func: (value) {
                    ref
                        .read(checkoutFormProvider.notifier)
                        .onAddressChange(value);
                  },
                  validateFunc: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Address ';
                    }
                    return null;
                  },
                ),
                VxBox().height(50.h).make(),
                Center(
                  child: appButton(
                      text: "Checkout ",
                      onPressed: () async {
                        // print("Checkout");
                        if ((checkoutController.formKey.currentState!
                                as FormState)
                            .validate()) {
                          try {
                            await initPaymentSheet(product.price * 100);

                            await Stripe.instance.presentPaymentSheet();

                            await checkoutController.handleCheckoutSubmit(
                                ref, id, product.price, checkoutForm);
                          } on Exception catch (e) {
                            if (e is StripeException) {
                              toastInfo(
                                  msg: e.error.localizedMessage ??
                                      "Payment failed.",
                                  backgroundColor: Colors.red);
                            } else {
                              toastInfo(
                                  msg: "Unforeseen error",
                                  backgroundColor: Colors.red);
                            }
                          }
                        }
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Future<String> initPaymentSheet(double amount) async {
  try {
    // 1. create payment intent on the server
    final clientSecret = await _createTestPaymentSheet(amount);

    // 2. initialize the payment sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Set to true for custom flow
        customFlow: false,
        // Main params
        merchantDisplayName: 'FreeFish Demo',
        paymentIntentClientSecret: clientSecret,
        // Customer keys
        // customerEphemeralKeySecret: data['ephemeralKey'],
        // customerId: data['customer'],
        // Extra options
        // testEnv: true,
        // applePay: true,
        // googlePay: true,
        // style: ThemeMode.dark,
        // merchantCountryCode: 'DE',
      ),
    );
    // setState(() {
    //   _ready = true;
    // });
    return clientSecret;
  } catch (e) {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text('Error: $e')),
    // );
    rethrow;
  }
}

Future<String> _createTestPaymentSheet(double amount) async {
  var paymentIntent = await HttpUtil().post("/api/payment_intent", data: {
    "amount": amount,
    "currency": "nzd",
    "payment_method_types[]": "card"
  });
  return paymentIntent.data;
}
