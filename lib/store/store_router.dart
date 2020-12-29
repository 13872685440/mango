import 'package:fluro/fluro.dart';
import '../routers/router_init.dart';

import 'store_audit_result_page.dart';

class StoreRouter implements IRouterProvider {
  static String auditPage = "/store/audit";
  static String auditResultPage = "/store/auditResult";

  @override
  void initRouter(FluroRouter router) {
    //router.define(auditPage, handler: Handler(handlerFunc: (_, params) => StoreAudit()));
    router.define(auditResultPage,
        handler: Handler(handlerFunc: (_, params) => StoreAuditResult()));
  }
}
