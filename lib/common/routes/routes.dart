import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freefish/common/routes/app_routes_names.dart';
import 'package:freefish/common/utils/app_constants.dart';
import 'package:freefish/global.dart';
import 'package:freefish/pages/application/view/application.dart';
import 'package:freefish/pages/home/view/home.dart';
import 'package:freefish/pages/sign_in/view/sign_in.dart';
import 'package:freefish/pages/sign_up/view/sign_up.dart';
import 'package:freefish/pages/welcome/welcome.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.welcome, page: Welcome()),
      RouteEntity(path: AppRoutesNames.login, page: const SignIn()),
      RouteEntity(path: AppRoutesNames.register, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.application, page: const Application()),
      RouteEntity(path: AppRoutesNames.home, page: const Home()),
    ];
  }

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print("onGenerateRoute: ${settings.name}");
    }

    if (settings.name != null) {
      var route =
          routes().firstWhere((element) => element.path == settings.name);

      bool deviceOpened =
          Global.storageService.getBool(AppConstants.storageDeviceOpenedKey);

      if (route.path == AppRoutesNames.welcome && deviceOpened) {
        bool isLoggedIn = Global.storageService.isLoggedIn();
        if (isLoggedIn) {
          return MaterialPageRoute(
            builder: (context) => const Application(),
          );
        }
        return MaterialPageRoute(
          builder: (context) => const SignIn(),
        );
      }

      return MaterialPageRoute(builder: (context) => route.page);
    }

    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }
}

class RouteEntity {
  String path;
  Widget page;

  RouteEntity({required this.path, required this.page});
}
