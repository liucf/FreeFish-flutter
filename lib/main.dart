import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/routes/routes.dart';
import 'package:freefish/common/theme/dark_theme.dart';
import 'package:freefish/global.dart';
import 'package:freefish/common/theme/light_theme.dart';

Future<void> main() async {
  await Global.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) => MaterialApp(
        title: 'FreeFish',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        // initialRoute: "signIn",
        // routes: routesMap,
        // home: Welcome(), //initialRoute "/"
        onGenerateRoute: AppPages.onGenerateRoute,
      ),
    );
  }
}
