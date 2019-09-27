import 'package:flutter/material.dart';
import 'package:mango/base/list_refresh.dart';
import 'package:mango/models/index.dart' as index;
import 'package:mango/net/api.dart';
import 'package:mango/net/net.dart';
import 'package:mango/views/app_router.dart';
import 'package:mango/widgets/list_bar.dart';

import 'list_view_item.dart';

class Test2View extends StatefulWidget {
  @override
  _Test2State createState() => _Test2State();

  final name;

  const Test2View(this.name) : super();
}

class _Test2State extends State<Test2View>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  Future<Map> getIndexListData([Map<String, dynamic> params]) async {
    var pageIndex = (params is Map) ? params['pageIndex'] : 1;
    final _param = {
      'pageNo': pageIndex,
      'pageSize': 10,
      'params': {'simple': widget.name}
    };
    var pageTotal = 0;
    List resultList = new List();
    await DioUtils.instance.request(Method.get, "test2/main",
        queryParameters: _param, onSuccess: (data) {
      pageIndex += 1;
      for (var item in data['data']) {
        index.Test2 app = index.Test2.fromJson(item);
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
    var myTitle = '${item.simple}';
    var data = '${item.id}';
    return new ListViewItem(itemTitle: myTitle, data: data);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar:
            ListBar(title: "测试2", hintText: "名称", path: AppRouter.test2Page),
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
