import 'dart:io';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'net/api.dart';
import 'net/dio_utils.dart';
import 'provider/users/user_provider.dart';
import 'res/colors.dart';
import 'routers/application.dart';
import 'routers/routers.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'home/splash_page.dart';

void main() {
  // SharedPreferences.setMockInitialValues({});
  WidgetsFlutterBinding.ensureInitialized();
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
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
    _initJPush();
  }

  void _initJPush() async {
    JPush jpush = new JPush();
    // 注册接收和打开 Notification()
    _initNotification(jpush);

    jpush.setup();
    print("初始化jpush成功");

    
  }

  void _initNotification(JPush jpush) {
    jpush.addEventHandler(
      // 接收通知回调方法。
      onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
      },
      // 点击通知回调方法。
      onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
      },
      // 接收自定义消息回调方法。
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
        create: (_) => new UserProvider(),
        child: OKToast(
            child: MaterialApp(
                title: '宏泰通',
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
