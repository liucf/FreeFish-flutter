import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freefish/common/api/product_api.dart';
import 'package:freefish/common/global_loader/global_loader.dart';
import 'package:freefish/common/widgets/app_messages.dart';
import 'package:freefish/pages/checkout/controller/checkout_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'checkout_controller.g.dart';

class CheckoutController {
  CheckoutController();
  GlobalKey formKey = GlobalKey<FormState>();

  Future<void> handleCheckoutSubmit(WidgetRef ref, int productId, double amount,
      CheckoutState checkoutState) async {
    var context = ref.context;
    try {
      ref.read(appLoaderProvider.notifier).showLoader();

      await ProductApi.buy(
        product: productId,
        amount: amount,
        // email: ref.watch(checkoutFormProvider).email,
        // mobilephone: ref.watch(checkoutFormProvider).mobilephone,
        // address: ref.watch(checkoutFormProvider).address,
        email: checkoutState.email,
        mobilephone: checkoutState.mobilephone,
        address: checkoutState.address,
      );

      if (context.mounted) {
        toastInfo(msg: "Payment successfully", backgroundColor: Colors.green);
        Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => false);
      }
    } on DioException catch (e) {
      toastInfo(msg: "${e.error}", backgroundColor: Colors.red);
    } catch (e) {
      toastInfo(msg: e.toString(), backgroundColor: Colors.red);
    } finally {
      ref.read(appLoaderProvider.notifier).hideLoader();
    }
  }
}

@riverpod
class CheckoutForm extends _$CheckoutForm {
  @override
  CheckoutState build() => CheckoutState();

  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onMobileChange(String mobilephone) {
    state = state.copyWith(mobilephone: mobilephone);
  }

  void onAddressChange(String address) {
    state = state.copyWith(address: address);
  }
}
