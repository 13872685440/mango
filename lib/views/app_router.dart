import 'package:fluro/fluro.dart';
import 'package:mango/routers/router_init.dart';
import 'package:mango/views/test2/main.dart';
import 'package:mango/widgets/search_page.dart';

import 'apptree/main.dart';

class AppRouter implements IRouterProvider {
  static String searchPage = "/search";
  static String apptreePage = "/apptree/main";
  static String test2Page = "/test2/main";

  @override
  void initRouter(Router router) {
    router.define(apptreePage, handler: Handler(handlerFunc: (_, params) {
      String searchData = params['searchData']?.first == null
          ? ""
          : params['searchData']?.first;
      return ApptreeView(searchData);
    }));
    router.define(test2Page, handler: Handler(handlerFunc: (_, params) {
      String searchData = params['searchData']?.first == null
          ? ""
          : params['searchData']?.first;
      return Test2View(searchData);
    }));
    router.define(searchPage, handler: Handler(handlerFunc: (_, params) {
      String hintText =
          params['hintText']?.first == null ? "" : params['hintText']?.first;
      String path = params['path']?.first == null ? "" : params['path']?.first;
      return Search(hintText, path);
    }));
  }
}
