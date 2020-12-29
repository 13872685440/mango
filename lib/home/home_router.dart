import 'package:fluro/fluro.dart';
import '../home/setting.dart';
import '../home/workplace_page.dart';
import '../routers/router_init.dart';

import 'setting/about.dart';

class HomeRouter implements IRouterProvider {
  static String settingPage = "/setting";
  static String aboutPage = "/about";
  static String workSpacePage = "/workspace";

  @override
  void initRouter(FluroRouter router) {
    router.define(settingPage,
        handler: Handler(handlerFunc: (_, params) => Setting()));
    router.define(aboutPage,
        handler: Handler(handlerFunc: (_, params) => About()));
    router.define(workSpacePage,
        handler: Handler(handlerFunc: (_, params) => WorkSpace()));
  }
}
