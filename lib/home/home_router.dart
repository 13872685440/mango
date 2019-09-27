import 'package:fluro/fluro.dart';
import 'package:mango/home/setting.dart';
import 'package:mango/home/workplace_page.dart';
import 'package:mango/routers/router_init.dart';

import 'setting/about.dart';

class HomeRouter implements IRouterProvider {
  static String settingPage = "/setting";
  static String aboutPage = "/about";
  static String workSpacePage = "/workspace";

  @override
  void initRouter(Router router) {
    router.define(settingPage,
        handler: Handler(handlerFunc: (_, params) => Setting()));
    router.define(aboutPage,
        handler: Handler(handlerFunc: (_, params) => About()));
    router.define(workSpacePage,
        handler: Handler(handlerFunc: (_, params) => WorkSpace()));
  }
}
