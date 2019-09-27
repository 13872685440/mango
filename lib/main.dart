import 'dart:io';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mango/provider/users/user_provider.dart';
import 'package:mango/res/colors.dart';
import 'package:mango/routers/application.dart';
import 'package:mango/routers/routers.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'home/splash_page.dart';

void main() {
  runApp(MyApp());
  // 沉浸式状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
        builder: (_) => new UserProvider(),
        child: OKToast(
            child: MaterialApp(
                title: 'Flutter Deer',
                //debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primaryColor: Colours.app_main,
                  scaffoldBackgroundColor: Colors.white,
                ),
                home: SplashPage(),
                onGenerateRoute: Application.router.generator,
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  const Locale('zh', 'CH'),
                  const Locale('en', 'US')
                ]),
            backgroundColor: Colors.black54,
            textPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            radius: 20.0,
            position: ToastPosition.bottom));
  }
}
