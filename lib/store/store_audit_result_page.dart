
import 'package:flutter/material.dart';
import '../res/resources.dart';
import '../routers/fluro_navigator.dart';
import '../routers/routers.dart';
import '../util/image_utils.dart';
import '../widgets/app_bar.dart';
import '../widgets/my_button.dart';

class StoreAuditResult extends StatefulWidget {
  @override
  _StoreAuditResultState createState() => _StoreAuditResultState();
}

class _StoreAuditResultState extends State<StoreAuditResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "审核结果",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Gaps.vGap50,
            loadAssetImage("store/icon_success",
              width: 80.0,
              height: 80.0,
            ),
            Gaps.vGap12,
            Text(
              "恭喜，店铺资料审核成功",
              style: TextStyles.textDark16,
            ),
            Gaps.vGap8,
            Text(
              "2019-02-21 15:20:10",
              style: TextStyles.textGray12,
            ),
            Gaps.vGap8,
            Text(
              "预计完成时间：02月28日",
              style: TextStyles.textGray12,
            ),
            Gaps.vGap12,
            Gaps.vGap12,
            MyButton(
              onPressed: (){
                NavigatorUtils.push(context, Routes.home, clearStack: true);
              },
              text: "进入",
            )
          ],
        ),
      ),
    );
  }
}
