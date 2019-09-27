import 'package:flutter/material.dart';
import 'package:mango/base/list_refresh.dart';
import 'package:mango/models/users/apptree_bean.dart';
import 'package:mango/net/api.dart';
import 'package:mango/net/net.dart';
import 'package:mango/views/app_router.dart';
import 'package:mango/widgets/list_bar.dart';

import 'list_view_item.dart';

class ApptreeView extends StatefulWidget {
  @override
  _ApptreeState createState() => _ApptreeState();

  final name;

  const ApptreeView(this.name) : super();
}

class _ApptreeState extends State<ApptreeView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  Future<Map> getIndexListData([Map<String, dynamic> params]) async {
    var pageIndex = (params is Map) ? params['pageIndex'] : 1;
    final _param = {
      'pageNo': pageIndex,
      'pageSize': 10,
      'params': {'wn': widget.name}
    };
    var pageTotal = 0;
    List resultList = new List();
    await DioUtils.instance.request(Method.get, "apptree/main",
        queryParameters: _param, onSuccess: (data) {
      pageIndex += 1;
      for (var item in data['data']) {
        Apptree_bean app = Apptree_bean.fromJson(item);
        resultList.add(app);
      }
      pageTotal = data['totalPage'];
    });
    Map<String, dynamic> result = {
      "list": resultList,
      'total': pageTotal,
      'pageIndex': pageIndex
    };
    return result;
  }

  Widget makeCard(index, item) {
    var myTitle = '${item.name}';
    var data = '${item.code}';
    return new ListViewItem(itemTitle: myTitle, data: data);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: ListBar(
            title: "菜单管理", hintText: "菜单名称", path: AppRouter.apptreePage),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListRefresh(getIndexListData, makeCard),
              )
            ]));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
