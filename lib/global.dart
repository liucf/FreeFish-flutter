import 'package:flutter/material.dart';
import 'package:freefish/common/services/storage.dart';

class Global {
  static late StorageService storageService;

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    storageService = await StorageService().init();
  }
}
