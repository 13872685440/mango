
import 'package:fluro/fluro.dart';
import 'package:mango/home/home_page.dart';
import 'package:mango/routers/router_init.dart';

import 'login_page.dart';


class LoginRouter implements IRouterProvider{

  static String loginPage = "/login";

  static String homePage = "/home";
  
  @override
  void initRouter(Router router) {
    router.define(loginPage, handler: Handler(handlerFunc: (_, params) => Login()));
    router.define(homePage, handler: Handler(handlerFunc: (_, params) => Home()));
  }
  
}