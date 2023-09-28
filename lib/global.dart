import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:freefish/common/services/storage.dart';
import 'package:freefish/common/utils/app_constants.dart';

class Global {
  static late StorageService storageService;

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    storageService = await StorageService().init();
    Stripe.publishableKey = AppConstants.stripePublicKey;
  }
}
