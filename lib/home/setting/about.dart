import 'package:flutter/material.dart';
import '../../res/resources.dart';
import '../../util/image_utils.dart';
import '../../widgets/app_bar.dart';

class About extends StatefulWidget {
  @override
  AboutState createState() => AboutState();
}

class AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: MyAppBar(
          title: "关于mango",
        ),
        body: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    loadAssetImage("logo", width: 100.0, height: 160.0)
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Mango V1.0"),
                  ]),
              Gaps.vGap16,
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Mango is a cat ！"),
                  ])
            ])));
  }
}
